<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="1.9.0-Master" minimumScale="-4.65661e-10" maximumScale="20000" hasScaleBasedVisibilityFlag="1">
  <transparencyLevelInt>255</transparencyLevelInt>
  <renderer-v2 symbollevels="0" type="RuleRenderer">
    <rules>
      <rule filter=" &quot;EO.Einzelobjekt_art&quot; = 0" symbol="0" label="Mauer"/>
      <rule filter=" &quot;EO.Einzelobjekt_art&quot;  = 1" symbol="1" label="Laermschutzwand"/>
      <rule filter=" &quot;EO.Einzelobjekt_art&quot;  = 10" symbol="2" label="Reservoir"/>
      <rule filter=" &quot;EO.Einzelobjekt_art&quot;  = 2" symbol="3" label="unterirdisches_Gebaeude"/>
      <rule filter=" &quot;EO.Einzelobjekt_art&quot;  = 12" symbol="4" label="Unterstand"/>
      <rule filter=" &quot;EO.Einzelobjekt_art&quot;  = 3" symbol="5" label="uebriger_Gebaeudeteil"/>
      <rule filter=" &quot;EO.Einzelobjekt_art&quot;  = 13" symbol="6" label="Silo_Turm_Gasometer"/>
      <rule filter=" &quot;EO.Einzelobjekt_art&quot;  = 5" symbol="7" label="wichtige_Treppe"/>
      <rule filter="&quot;EO.Einzelobjekt_art&quot; = 45" symbol="8" label="weitere"/>
      <rule scalemaxdenom="5000" filter=" &quot;EO.Einzelobjekt_art&quot;  NOT IN (0,1,10,2,12,3,13,5)" symbol="9" label="andere"/>
    </rules>
    <symbols>
      <symbol outputUnit="MM" alpha="1" type="fill" name="0">
        <layer pass="1" class="LinePatternFill" locked="0">
          <prop k="color" v="255,170,255,255"/>
          <prop k="distance" v="2"/>
          <prop k="lineangle" v="45"/>
          <prop k="linewidth" v="0.5"/>
          <prop k="offset" v="0"/>
          <symbol outputUnit="MM" alpha="1" type="line" name="@0@0">
            <layer pass="0" class="SimpleLine" locked="0">
              <prop k="capstyle" v="square"/>
              <prop k="color" v="255,170,255,255"/>
              <prop k="customdash" v="5;2"/>
              <prop k="joinstyle" v="bevel"/>
              <prop k="offset" v="0"/>
              <prop k="penstyle" v="solid"/>
              <prop k="use_custom_dash" v="0"/>
              <prop k="width" v="0.4"/>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="0.705882" type="fill" name="1">
        <layer pass="1" class="SimpleFill" locked="0">
          <prop k="color" v="116,27,189,255"/>
          <prop k="color_border" v="85,0,127,255"/>
          <prop k="offset" v="0,0"/>
          <prop k="style" v="solid"/>
          <prop k="style_border" v="solid"/>
          <prop k="width_border" v="0.4"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="0.478431" type="fill" name="2">
        <layer pass="1" class="SimpleFill" locked="0">
          <prop k="color" v="224,110,44,255"/>
          <prop k="color_border" v="255,0,0,255"/>
          <prop k="offset" v="0,0"/>
          <prop k="style" v="no"/>
          <prop k="style_border" v="dash"/>
          <prop k="width_border" v="0.4"/>
        </layer>
        <layer pass="1" class="LinePatternFill" locked="0">
          <prop k="color" v="255,0,0,255"/>
          <prop k="distance" v="2"/>
          <prop k="lineangle" v="45"/>
          <prop k="linewidth" v="0.5"/>
          <prop k="offset" v="0"/>
          <symbol outputUnit="MM" alpha="1" type="line" name="@2@1">
            <layer pass="0" class="SimpleLine" locked="0">
              <prop k="capstyle" v="square"/>
              <prop k="color" v="0,0,0,255"/>
              <prop k="customdash" v="5;2"/>
              <prop k="joinstyle" v="bevel"/>
              <prop k="offset" v="0"/>
              <prop k="penstyle" v="no"/>
              <prop k="use_custom_dash" v="0"/>
              <prop k="width" v="0.26"/>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="fill" name="3">
        <layer pass="1" class="SimpleFill" locked="0">
          <prop k="color" v="144,119,21,255"/>
          <prop k="color_border" v="255,0,255,255"/>
          <prop k="offset" v="0,0"/>
          <prop k="style" v="no"/>
          <prop k="style_border" v="dot"/>
          <prop k="width_border" v="0.4"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="0.658824" type="fill" name="4">
        <layer pass="1" class="SimpleLine" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="color" v="34,237,240,255"/>
          <prop k="customdash" v="2;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="0.35"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="fill" name="5">
        <layer pass="1" class="SimpleFill" locked="0">
          <prop k="color" v="220,220,0,255"/>
          <prop k="color_border" v="255,248,33,255"/>
          <prop k="offset" v="0,0"/>
          <prop k="style" v="no"/>
          <prop k="style_border" v="dot"/>
          <prop k="width_border" v="0.4"/>
        </layer>
        <layer pass="1" class="PointPatternFill" locked="0">
          <prop k="displacement_x" v="0"/>
          <prop k="displacement_y" v="0"/>
          <prop k="distance_x" v="3"/>
          <prop k="distance_y" v="3"/>
          <symbol outputUnit="MM" alpha="1" type="marker" name="@5@1">
            <layer pass="0" class="SimpleMarker" locked="0">
              <prop k="angle" v="0"/>
              <prop k="color" v="255,255,0,255"/>
              <prop k="color_border" v="255,255,0,255"/>
              <prop k="name" v="circle"/>
              <prop k="offset" v="0,0"/>
              <prop k="scale_method" v="area"/>
              <prop k="size" v="0.3"/>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="0.772549" type="fill" name="6">
        <layer pass="1" class="SimpleFill" locked="0">
          <prop k="color" v="224,110,44,255"/>
          <prop k="color_border" v="255,0,0,255"/>
          <prop k="offset" v="0,0"/>
          <prop k="style" v="no"/>
          <prop k="style_border" v="dash"/>
          <prop k="width_border" v="0.4"/>
        </layer>
        <layer pass="1" class="LinePatternFill" locked="0">
          <prop k="color" v="255,0,0,255"/>
          <prop k="distance" v="2"/>
          <prop k="lineangle" v="45"/>
          <prop k="linewidth" v="0.5"/>
          <prop k="offset" v="0"/>
          <symbol outputUnit="MM" alpha="1" type="line" name="@6@1">
            <layer pass="0" class="SimpleLine" locked="0">
              <prop k="capstyle" v="square"/>
              <prop k="color" v="0,0,0,255"/>
              <prop k="customdash" v="5;2"/>
              <prop k="joinstyle" v="bevel"/>
              <prop k="offset" v="0"/>
              <prop k="penstyle" v="no"/>
              <prop k="use_custom_dash" v="0"/>
              <prop k="width" v="0.26"/>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="0.658824" type="fill" name="7">
        <layer pass="1" class="SimpleFill" locked="0">
          <prop k="color" v="170,255,255,255"/>
          <prop k="color_border" v="120,180,180,255"/>
          <prop k="offset" v="0,0"/>
          <prop k="style" v="solid"/>
          <prop k="style_border" v="solid"/>
          <prop k="width_border" v="0.35"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="fill" name="8">
        <layer pass="0" class="LinePatternFill" locked="0">
          <prop k="color" v="0,0,255,255"/>
          <prop k="distance" v="3"/>
          <prop k="lineangle" v="45"/>
          <prop k="linewidth" v="0.4"/>
          <prop k="offset" v="0"/>
          <symbol outputUnit="MM" alpha="1" type="line" name="@8@0">
            <layer pass="0" class="SimpleLine" locked="0">
              <prop k="capstyle" v="square"/>
              <prop k="color" v="0,0,0,255"/>
              <prop k="customdash" v="5;2"/>
              <prop k="joinstyle" v="bevel"/>
              <prop k="offset" v="0"/>
              <prop k="penstyle" v="solid"/>
              <prop k="use_custom_dash" v="0"/>
              <prop k="width" v="0.26"/>
            </layer>
          </symbol>
        </layer>
        <layer pass="0" class="SimpleFill" locked="0">
          <prop k="color" v="154,176,79,255"/>
          <prop k="color_border" v="0,0,255,255"/>
          <prop k="offset" v="0,0"/>
          <prop k="style" v="no"/>
          <prop k="style_border" v="solid"/>
          <prop k="width_border" v="0.4"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="0.74902" type="fill" name="9">
        <layer pass="0" class="SimpleFill" locked="0">
          <prop k="color" v="224,110,44,255"/>
          <prop k="color_border" v="162,162,162,255"/>
          <prop k="offset" v="0,0"/>
          <prop k="style" v="no"/>
          <prop k="style_border" v="dash"/>
          <prop k="width_border" v="0.26"/>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <customproperties>
    <property key="labeling" value="pal"/>
    <property key="labeling/addDirectionSymbol" value="false"/>
    <property key="labeling/angleOffset" value="0"/>
    <property key="labeling/bufferColorB" value="255"/>
    <property key="labeling/bufferColorG" value="255"/>
    <property key="labeling/bufferColorR" value="255"/>
    <property key="labeling/bufferJoinStyle" value="64"/>
    <property key="labeling/bufferNoFill" value="false"/>
    <property key="labeling/bufferSize" value="1"/>
    <property key="labeling/bufferSizeInMapUnits" value="false"/>
    <property key="labeling/bufferTransp" value="0"/>
    <property key="labeling/centroidWhole" value="false"/>
    <property key="labeling/dataDefinedProperty0" value=""/>
    <property key="labeling/dataDefinedProperty1" value=""/>
    <property key="labeling/dataDefinedProperty10" value=""/>
    <property key="labeling/dataDefinedProperty11" value=""/>
    <property key="labeling/dataDefinedProperty12" value=""/>
    <property key="labeling/dataDefinedProperty13" value=""/>
    <property key="labeling/dataDefinedProperty14" value=""/>
    <property key="labeling/dataDefinedProperty15" value=""/>
    <property key="labeling/dataDefinedProperty16" value=""/>
    <property key="labeling/dataDefinedProperty17" value=""/>
    <property key="labeling/dataDefinedProperty18" value=""/>
    <property key="labeling/dataDefinedProperty19" value=""/>
    <property key="labeling/dataDefinedProperty2" value=""/>
    <property key="labeling/dataDefinedProperty20" value=""/>
    <property key="labeling/dataDefinedProperty3" value=""/>
    <property key="labeling/dataDefinedProperty4" value=""/>
    <property key="labeling/dataDefinedProperty5" value=""/>
    <property key="labeling/dataDefinedProperty6" value=""/>
    <property key="labeling/dataDefinedProperty7" value=""/>
    <property key="labeling/dataDefinedProperty8" value=""/>
    <property key="labeling/dataDefinedProperty9" value=""/>
    <property key="labeling/decimals" value="0"/>
    <property key="labeling/displayAll" value="false"/>
    <property key="labeling/dist" value="0"/>
    <property key="labeling/distInMapUnits" value="false"/>
    <property key="labeling/enabled" value="false"/>
    <property key="labeling/fieldName" value=""/>
    <property key="labeling/fontCapitals" value="0"/>
    <property key="labeling/fontFamily" value="Ubuntu"/>
    <property key="labeling/fontItalic" value="false"/>
    <property key="labeling/fontLetterSpacing" value="0"/>
    <property key="labeling/fontLimitPixelSize" value="false"/>
    <property key="labeling/fontMaxPixelSize" value="10000"/>
    <property key="labeling/fontMinPixelSize" value="3"/>
    <property key="labeling/fontSize" value="10"/>
    <property key="labeling/fontSizeInMapUnits" value="false"/>
    <property key="labeling/fontStrikeout" value="false"/>
    <property key="labeling/fontUnderline" value="false"/>
    <property key="labeling/fontWeight" value="50"/>
    <property key="labeling/fontWordSpacing" value="0"/>
    <property key="labeling/formatNumbers" value="false"/>
    <property key="labeling/isExpression" value="false"/>
    <property key="labeling/labelOffsetInMapUnits" value="true"/>
    <property key="labeling/labelPerPart" value="false"/>
    <property key="labeling/leftDirectionSymbol" value="&lt;"/>
    <property key="labeling/limitNumLabels" value="false"/>
    <property key="labeling/maxCurvedCharAngleIn" value="20"/>
    <property key="labeling/maxCurvedCharAngleOut" value="-20"/>
    <property key="labeling/maxNumLabels" value="2000"/>
    <property key="labeling/mergeLines" value="false"/>
    <property key="labeling/minFeatureSize" value="0"/>
    <property key="labeling/multilineAlign" value="0"/>
    <property key="labeling/multilineHeight" value="1"/>
    <property key="labeling/namedStyle" value="Regular"/>
    <property key="labeling/obstacle" value="true"/>
    <property key="labeling/placeDirectionSymbol" value="0"/>
    <property key="labeling/placement" value="0"/>
    <property key="labeling/placementFlags" value="0"/>
    <property key="labeling/plussign" value="true"/>
    <property key="labeling/preserveRotation" value="true"/>
    <property key="labeling/previewBkgrdColor" value="#ffffff"/>
    <property key="labeling/priority" value="5"/>
    <property key="labeling/reverseDirectionSymbol" value="false"/>
    <property key="labeling/rightDirectionSymbol" value=">"/>
    <property key="labeling/scaleMax" value="0"/>
    <property key="labeling/scaleMin" value="0"/>
    <property key="labeling/textColorB" value="0"/>
    <property key="labeling/textColorG" value="0"/>
    <property key="labeling/textColorR" value="0"/>
    <property key="labeling/textTransp" value="0"/>
    <property key="labeling/upsidedownLabels" value="0"/>
    <property key="labeling/wrapChar" value=""/>
    <property key="labeling/xOffset" value="0"/>
    <property key="labeling/xQuadOffset" value="0"/>
    <property key="labeling/yOffset" value="0"/>
    <property key="labeling/yQuadOffset" value="0"/>
  </customproperties>
  <displayfield>ogc_fid</displayfield>
  <label>0</label>
  <labelattributes>
    <label fieldname="" text="Label"/>
    <family fieldname="" name="Ubuntu"/>
    <size fieldname="" units="pt" value="12"/>
    <bold fieldname="" on="0"/>
    <italic fieldname="" on="0"/>
    <underline fieldname="" on="0"/>
    <strikeout fieldname="" on="0"/>
    <color fieldname="" red="0" blue="0" green="0"/>
    <x fieldname=""/>
    <y fieldname=""/>
    <offset x="0" y="0" units="pt" yfieldname="" xfieldname=""/>
    <angle fieldname="" value="0" auto="0"/>
    <alignment fieldname="" value="center"/>
    <buffercolor fieldname="" red="255" blue="255" green="255"/>
    <buffersize fieldname="" units="pt" value="1"/>
    <bufferenabled fieldname="" on=""/>
    <multilineenabled fieldname="" on=""/>
    <selectedonly on=""/>
  </labelattributes>
  <edittypes>
    <edittype type="0" name="EO.Einzelobjekt_art"/>
    <edittype type="0" name="EO.Einzelobjekt_art_txt"/>
    <edittype type="0" name="EO.Einzelobjekt_entstehung"/>
    <edittype type="0" name="EO.Einzelobjekt_gem_bfs"/>
    <edittype type="0" name="EO.Einzelobjekt_lieferdatum"/>
    <edittype type="0" name="EO.Einzelobjekt_los"/>
    <edittype type="0" name="EO.Einzelobjekt_ogc_fid"/>
    <edittype type="0" name="EO.Einzelobjekt_qualitaet"/>
    <edittype type="0" name="EO.Einzelobjekt_qualitaet_txt"/>
    <edittype type="0" name="flaechenelement_von"/>
    <edittype type="0" name="gem_bfs"/>
    <edittype type="0" name="lieferdatum"/>
    <edittype type="0" name="los"/>
    <edittype type="0" name="ogc_fid"/>
    <edittype type="0" name="tid"/>
  </edittypes>
  <editorlayout>generatedlayout</editorlayout>
  <editform>.</editform>
  <editforminit></editforminit>
  <annotationform>.</annotationform>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <attributeactions/>
</qgis>
