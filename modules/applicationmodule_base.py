# -*- coding: utf-8 -*-

from __future__ import absolute_import, print_function

import sys
import traceback
from builtins import str
from qgis.PyQt.QtCore import QCoreApplication, QObject, QSettings, Qt
from qgis.PyQt.QtWidgets import QAction, QApplication, QMenu, QMenuBar, \
    QSizePolicy
from qgis.core import QgsMessageLog
from qgis.gui import QgsMessageBar

from veriso.base.utils.module import (get_topics_tables, get_baselayers,
                                      get_check_topics, get_layers_from_topic)
from veriso.base.utils.loadlayer import LoadLayer
from veriso.base.utils.utils import dynamic_import

# Translation was a pain in the a...
# Umlaute from files etc.
# This seems to work.
try:
    _encoding = QApplication.UnicodeUTF8


    def _translate(context, text, disambig):
        return QApplication.translate(context, text, disambig, _encoding)
except AttributeError:
    def _translate(context, text, disambig):
        return QApplication.translate(context, text, disambig)


class ApplicationModuleBase(QObject):
    def __init__(self, iface, toolbar, locale_path):
        QObject.__init__(self)
        self.iface = iface
        self.message_bar = self.iface.messageBar()
        self.canvas = self.iface.mapCanvas()
        self.toolbar = toolbar

        self.settings = QSettings("CatAIS", "VeriSO")
        self.epsg = self.settings.value("project/epsg")
        self.provider = self.settings.value("project/provider")
        self.module = self.settings.value("project/appmodule")
        self.module_name = self.settings.value("project/appmodulename")

        self.beforeAction = None
        self.settingsAction = None

    # noinspection PyPep8Naming
    def init_gui(self):
        """Initialize all the additional menus.
        this method is the entry point when a new project is loaded
        """
        self.clean_gui()
        self.do_init_checks_menu()
        self.do_init_defects_menu()
        # TODO (MB) is this really the requirement?
        # Entfernen des Reiters "Tables"
        # self.do_init_topics_tables_menu()
        self.do_init_baselayer_menu()

        self.doShowProjectId()

    def do_init_checks_menu(self):
        """Initialize checks menu.
        """
        try:
            check_topics = get_check_topics(self.module)
        except:
            message = "Something went wrong reading check topics from" \
                      "yaml file"
            self.message_bar.pushMessage("Error",
                                         _translate(self.module, message,
                                                    None),
                                         level=QgsMessageBar.CRITICAL,
                                         duration=0)
            return

        menubar = self.get_checks_menubar(check_topics)
        self.toolbar.insertWidget(self.beforeAction, menubar)

    def get_checks_menubar(self, check_topics):
        menubar = QMenuBar(self.toolbar)
        menubar.setObjectName("VeriSOModule.LoadChecksMenuBar")
        menubar.setSizePolicy(
                QSizePolicy(QSizePolicy.Minimum, QSizePolicy.Minimum))
        menu = QMenu(menubar)
        menu.setTitle(_translate(self.module, "Checks", None))

        locale = QSettings().value('locale/userLocale')[0:2]
        for check_topic in check_topics:
            checks = check_topics[check_topic]["checks"]
            if not checks:
                message = "The topic %s has no valid checks: skiping." % (
                    check_topic)
                self.message_bar.pushWarning(
                        "Warning",
                        _translate(self.module, message, None))

                # this topic has no valid checks
                continue

            single_check_menu = menu.addMenu(str(check_topic))

            for check in checks:
                check_name = check["name"]

                # Same multilingual strategy as in get_check_topics().
                try:
                    keys = list(check_name.keys())
                    try:
                        check_name = str(check_name[locale])
                        # language found
                    except:
                        # language *not* found
                        check_name = str(list(check_name.values())[0])
                except:
                    check_name = str(check_name)

                if check_name == "separator":
                    single_check_menu.addSeparator()
                else:
                    action = QAction(check_name, self.iface.mainWindow())

                    try:
                        shortcut = check["shortcut"]
                        action.setShortcut(shortcut)
                    except:
                        pass

                    single_check_menu.addAction(action)
                    topic_dir = check_topics[check_topic]['topic_dir']
                    action.triggered.connect(
                            lambda checked,
                            complex_check=check,
                            folder=topic_dir:
                            self.do_show_complex_check(folder, complex_check))

        menubar.addMenu(menu)
        return menubar

    def do_show_complex_check(self, folder, check):
        module = "veriso.modules.%s.checks.%s.%s" % (
            self.module, folder, check["file"])
        try:
            module = dynamic_import(module)
            c = module.ComplexCheck(self.iface)
            c.run()
        except Exception:
            exc_type, exc_value, exc_traceback = sys.exc_info()
            self.message_bar.pushMessage(self.module_name,
                                         str(traceback.format_exc(
                                                 exc_traceback)),
                                         QgsMessageBar.CRITICAL, duration=0)
            return

    def do_init_baselayer_menu(self):
        """Initialize baselayer menu:
        
        Adds the menu and reads all baselayers from the yaml file
        and adds them into the menu.
        
        Language support is working!
        """
        menubar = QMenuBar(self.toolbar)
        menubar.setObjectName("VeriSOModule.LoadBaselayerMenuBar")
        menubar.setSizePolicy(
                QSizePolicy(QSizePolicy.Minimum, QSizePolicy.Minimum))
        menu = QMenu(menubar)
        menu.setTitle(_translate(self.module, "Basislayer", None))

        locale = QSettings().value('locale/userLocale')[0:2]

        baselayers = get_baselayers(self.module)
        if not baselayers:
            message = "Could not load baselayer definitions file."
            self.message_bar.pushMessage("Error",
                                         _translate(self.module, message,
                                                    None),
                                         level=QgsMessageBar.CRITICAL,
                                         duration=0)
            return

        for baselayer in baselayers["baselayer"]:
            baselayer_title = baselayer["title"]
            try:
                keys = list(baselayer_title.keys())
                try:
                    baselayer_title = str(baselayer_title[locale])
                    # language found
                except:
                    # language *not* found
                    baselayer_title = str(list(baselayer_title.values())[0])
            except:
                baselayer_title = str(baselayer_title)

            baselayer["title"] = baselayer_title

            action = QAction(baselayer_title, self.iface.mainWindow())
            menu.addAction(action)
            action.triggered.connect(
                    lambda checked, layer=baselayer: self.do_show_baselayer(
                            layer))

        menubar.addMenu(menu)
        self.toolbar.insertWidget(self.beforeAction, menubar)

    def do_show_baselayer(self, layer):
        """Load a baselayer into map canvas.
        
        Uses an universal 'load layer' method.
        """
        QApplication.setOverrideCursor(Qt.WaitCursor)
        try:
            layer_loader = LoadLayer(self.iface)
            layer_loader.load(layer, True,
                              True)  # Do not show legend for baselayers ->
            # collapse legend.
        except Exception as e:
            QApplication.restoreOverrideCursor()
            QgsMessageLog.logMessage(str(e), self.module_name,
                                     QgsMessageLog.CRITICAL)
            return

        QApplication.restoreOverrideCursor()

    def do_init_topics_tables_menu(self):
        """Creates the topics and tables loader menu.
        Topics and tables are sorted alphanumerically. I'm not sure if ili2pg
        saves enough
        information in the database to find out the interlis model order.
        
        At the moment there is no locale support here.
        Seems to be not very handy without mapping tables anyway...
        """
        menubar = QMenuBar(self.toolbar)
        menubar.setObjectName("VeriSOModule.LoadTopicsTablesMenuBar")
        menubar.setSizePolicy(
                QSizePolicy(QSizePolicy.Minimum, QSizePolicy.Minimum))
        menu = QMenu(menubar)
        menu.setTitle(_translate(self.module, "Tables", None))

        topics = get_topics_tables(self.module_name)
        if not topics:
            message = "Something went wrong catching the topics/tables list " \
                      "from the database."
            self.message_bar.pushMessage(self.module_name,
                                         _translate(self.module, message, None),
                                         QgsMessageBar.CRITICAL, duration=0)
            return

        for topic in topics:
            topic_menu = menu.addMenu(str(topic["topic"]))

            action = QAction(_translate(self.module, "Load Topic", None),
                             self.iface.mainWindow())
            topic_menu.addAction(action)
            topic_menu.addSeparator()
            action.triggered.connect(
                    lambda checked, topic=topic: self.do_show_topic(topic))

            layers = get_layers_from_topic(topic)
            for my_layer in layers:
                action = QAction(my_layer["title"], self.iface.mainWindow())
                topic_menu.addAction(action)
                action.triggered.connect(
                        lambda checked, layer=my_layer:
                        self.do_show_single_topic_layer(layer))

        menubar.addMenu(menu)
        self.toolbar.insertWidget(self.beforeAction, menubar)

    def do_show_single_topic_layer(self, layer):
        """Loads an interlis table from the database
        into the map canvas.
        
        Uses an universal 'load layer' method.
        """
        layer["type"] = str(self.provider)
        layer_loader = LoadLayer(self.iface)
        layer_loader.load(layer)

    def do_show_topic(self, topic):
        """Loads all interlis tables of a topic (from
        the database) into the map canvas.
        
        Uses an universal 'load layer' method.        
        """
        layers = get_layers_from_topic(topic)
        for layer in layers:
            self.do_show_single_topic_layer(layer)

    def do_init_defects_menu(self):
        """Inititializes the defects menu:
        - load defects
        - export defects
        
        Export defects uses some external python excel library.
        """
        menubar = QMenuBar(self.toolbar)
        menubar.setObjectName("VeriSOModule.LoadDefectsMenuBar")
        menubar.setSizePolicy(
                QSizePolicy(QSizePolicy.Minimum, QSizePolicy.Minimum))
        menu = QMenu(menubar)
        menu.setTitle(_translate(self.module, "Mängel", None))

        action = QAction(_translate(self.module, "Mängellayer laden", None),
                         self.iface.mainWindow())
        action.triggered.connect(self.do_load_defects)
        menu.addAction(action)

        action = QAction(_translate(
                        self.module, "Mängellayer exportieren",None),
                self.iface.mainWindow())
        action.triggered.connect(self.do_export_defects)
        menu.addAction(action)

        menubar.addMenu(menu)
        self.toolbar.insertWidget(self.beforeAction, menubar)


    def doShowProjectId(self):
        menuBar = QMenuBar(self.toolbar)
        menuBar.setObjectName("VeriSOModule.ShowProjectIdMenuBar")        
        menuBar.setSizePolicy(QSizePolicy(QSizePolicy.Minimum, QSizePolicy.Minimum))
        menu = QMenu(menuBar)
        self.project_id = self.settings.value("project/id")
        menu.setTitle(QCoreApplication.translate( self.module, "Aktives Projekt: " + self.project_id ))  

        menuBar.addMenu(menu)
        menuBar.setEnabled(False)
        self.toolbar.addWidget(menuBar)
    

    def do_load_defects(self):
        defects_module = 'veriso.modules.tools.loaddefects'
        defects_module = dynamic_import(defects_module)
        d = defects_module.LoadDefects(self.iface, self.module,
                                       self.module_name)
        d.run()

    def do_export_defects(self):
        defects_module = 'veriso.modules.tools.exportdefects'
        defects_module = dynamic_import(defects_module)
        d = defects_module.ExportDefects(self.iface, self.module,
                                         self.module_name)
        d.run()

    def clean_gui(self):
        # Remove all the applications module specific menus.
        actions = self.toolbar.actions()
        for action in actions:
            try:
                object_name = action.defaultWidget().objectName()
                # Delete existing module menus.
                if object_name[0:12] == "VeriSOModule":
                    self.toolbar.removeAction(action)
                # Remember the action where we want to insert our new menu 
                # (e.g. settings menu bar).
                if object_name == "VeriSO.Main.SettingsMenuBar":
                    self.beforeAction = action
                # Get settings menu bar for module specific settings.
                if object_name == "VeriSO.Main.SettingsMenuBar":
                    self.settingsAction = action
            except AttributeError:
                pass

        # Remove all the application module specific options/settings in the
        # settings menu.
        settings_menu_bar = self.settingsAction.defaultWidget()
        settings_menu = self.settingsAction.defaultWidget().actions()[
            0].parentWidget()

        actions = settings_menu.actions()
        for action in actions:
            object_name = action.objectName()
            if object_name[0:12] == "VeriSOModule":
                settings_menu.removeAction(action)

            if action.isSeparator():
                settings_menu.removeAction(action)
