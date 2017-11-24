BEGIN;
  DELETE FROM $$speicherSchema.t_bb_before_except_after;
  DELETE FROM $$speicherSchema.t_bb_after_except_before;
  DELETE FROM $$speicherSchema.t_eo_fl_before_except_after;
  DELETE FROM $$speicherSchema.t_eo_fl_after_except_before;
  DELETE FROM $$speicherSchema.t_eo_li_before_except_after;
  DELETE FROM $$speicherSchema.t_eo_li_after_except_before;
  DELETE FROM $$speicherSchema.t_eo_pt_before_except_after;
  DELETE FROM $$speicherSchema.t_eo_pt_after_except_before;
COMMIT;


BEGIN;
  -- BODENBEDECKUNG BEFORE EXCEPT AFTER
  INSERT INTO $$speicherSchema.t_bb_before_except_after (the_geom)
  SELECT 
    ST_GeomFromEWKB(the_geom)
  FROM
    (
      SELECT 
        CASE WHEN ST_X(sp) < ST_X(ep) THEN ST_AsEWKB(ST_SnapToGrid(ST_MakeLine(sp,ep), 0.0001))
        ELSE ST_AsEWKB(ST_SnapToGrid(ST_MakeLine(ep,sp), 0.0001))
        END as the_geom
      FROM
        (
         SELECT
           ST_PointN(geom, generate_series(1, ST_NPoints(geom)-1)) as sp,
           ST_PointN(geom, generate_series(2, ST_NPoints(geom)  )) as ep
         FROM
           (
            SELECT 
              (ST_Dump(ST_Boundary(geometrie))).geom
            FROM 
              $$schemaVorher.bodenbedeckung_boflaeche
           ) AS linestrings
        ) AS segments_before
        
      EXCEPT 
      
      SELECT 
        CASE WHEN ST_X(sp) < ST_X(ep) THEN ST_AsEWKB(ST_SnapToGrid(ST_MakeLine(sp,ep), 0.0001))
        ELSE ST_AsEWKB(ST_SnapToGrid(ST_MakeLine(ep,sp), 0.0001))
        END as the_geom
      FROM
        (
         SELECT
           ST_PointN(geom, generate_series(1, ST_NPoints(geom)-1)) as sp,
           ST_PointN(geom, generate_series(2, ST_NPoints(geom)  )) as ep
         FROM
           (
            SELECT 
              (ST_Dump(ST_Boundary(geometrie))).geom
            FROM 
               $$schemaNachher.bodenbedeckung_boflaeche
           ) AS linestrings
       ) AS segments_after
    ) as foo;
    
  -- BODENBEDECKUNG AFTER EXCEPT BEFORE
  INSERT INTO $$speicherSchema.t_bb_after_except_before (the_geom)
  SELECT 
    ST_GeomFromEWKB(the_geom)
  FROM
    (
     SELECT 
       CASE WHEN ST_X(sp) < ST_X(ep) THEN ST_AsEWKB(ST_SnapToGrid(ST_MakeLine(sp,ep), 0.0001))
       ELSE ST_AsEWKB(ST_SnapToGrid(ST_MakeLine(ep,sp), 0.0001))
       END as the_geom
     FROM
       (
        SELECT
          ST_PointN(geom, generate_series(1, ST_NPoints(geom)-1)) as sp,
          ST_PointN(geom, generate_series(2, ST_NPoints(geom)  )) as ep
        FROM
          (
           SELECT 
             (ST_Dump(ST_Boundary(geometrie))).geom
           FROM 
             $$schemaNachher.bodenbedeckung_boflaeche
          ) AS linestrings
      ) AS segments_before
      
     EXCEPT 
     
     SELECT 
       CASE WHEN ST_X(sp) < ST_X(ep) THEN ST_AsEWKB(ST_SnapToGrid(ST_MakeLine(sp,ep), 0.0001))
       ELSE ST_AsEWKB(ST_SnapToGrid(ST_MakeLine(ep,sp), 0.0001))
       END as the_geom
     FROM
       (
        SELECT
          ST_PointN(geom, generate_series(1, ST_NPoints(geom)-1)) as sp,
          ST_PointN(geom, generate_series(2, ST_NPoints(geom)  )) as ep
        FROM
          (
           SELECT 
             (ST_Dump(ST_Boundary(geometrie))).geom
           FROM 
              $$schemaVorher.bodenbedeckung_boflaeche
          ) AS linestrings
      ) AS segments_after
   ) as foo;


  -- EO FLAECHE BEFORE EXCEPT AFTER
  INSERT INTO $$speicherSchema.t_eo_fl_before_except_after (the_geom)
  SELECT 
    ST_GeomFromEWKB(the_geom)
  FROM
    (
     SELECT 
       CASE WHEN ST_X(sp) < ST_X(ep) THEN ST_AsEWKB(ST_SnapToGrid(ST_MakeLine(sp,ep), 0.0001))
       ELSE ST_AsEWKB(ST_SnapToGrid(ST_MakeLine(ep,sp), 0.0001))
       END as the_geom
     FROM
       (
        SELECT
          ST_PointN(geom, generate_series(1, ST_NPoints(geom)-1)) as sp,
          ST_PointN(geom, generate_series(2, ST_NPoints(geom)  )) as ep
        FROM
          (
            SELECT 
              (ST_Dump(ST_Boundary(geometrie))).geom
            FROM 
              $$schemaVorher.einzelobjekte_flaechenelement
          ) AS linestrings
       ) AS segments_before
       
     EXCEPT 
     
     SELECT 
       CASE WHEN ST_X(sp) < ST_X(ep) THEN ST_AsEWKB(ST_SnapToGrid(ST_MakeLine(sp,ep), 0.0001))
       ELSE ST_AsEWKB(ST_SnapToGrid(ST_MakeLine(ep,sp), 0.0001))
       END as the_geom
     FROM
       (
        SELECT
          ST_PointN(geom, generate_series(1, ST_NPoints(geom)-1)) as sp,
          ST_PointN(geom, generate_series(2, ST_NPoints(geom)  )) as ep
        FROM
          (
           SELECT 
             (ST_Dump(ST_Boundary(geometrie))).geom
           FROM 
             $$schemaNachher.einzelobjekte_flaechenelement
          ) AS linestrings
       ) AS segments_after
    ) as foo;


  -- EO FLAECHE AFTER EXCEPT BEFORE
  INSERT INTO $$speicherSchema.t_eo_fl_after_except_before (the_geom)
  SELECT 
    ST_GeomFromEWKB(the_geom)
  FROM
    (
     SELECT 
       CASE WHEN ST_X(sp) < ST_X(ep) THEN ST_AsEWKB(ST_SnapToGrid(ST_MakeLine(sp,ep), 0.0001))
       ELSE ST_AsEWKB(ST_SnapToGrid(ST_MakeLine(ep,sp), 0.0001))
       END as the_geom
     FROM
       (
        SELECT
          ST_PointN(geom, generate_series(1, ST_NPoints(geom)-1)) as sp,
          ST_PointN(geom, generate_series(2, ST_NPoints(geom)  )) as ep
        FROM
          (
           SELECT 
             (ST_Dump(ST_Boundary(geometrie))).geom
           FROM 
             $$schemaNachher.einzelobjekte_flaechenelement
          ) AS linestrings
       ) AS segments_before
       
     EXCEPT 
     
     SELECT 
       CASE WHEN ST_X(sp) < ST_X(ep) THEN (ST_SnapToGrid(ST_MakeLine(sp,ep), 0.0001))
       ELSE (ST_SnapToGrid(ST_MakeLine(ep,sp), 0.0001))
       END as the_geom
     FROM
       (
        SELECT
          ST_PointN(geom, generate_series(1, ST_NPoints(geom)-1)) as sp,
          ST_PointN(geom, generate_series(2, ST_NPoints(geom)  )) as ep
        FROM
          (
           SELECT 
             (ST_Dump(ST_Boundary(geometrie))).geom
           FROM 
             $$schemaVorher.einzelobjekte_flaechenelement
          ) AS linestrings
       ) AS segments_after
    ) as foo;
    
  -- EO LINIE BEFORE EXCEPT AFTER
  INSERT INTO $$speicherSchema.t_eo_li_before_except_after (the_geom)
  SELECT 
    ST_GeomFromEWKB(the_geom)
  FROM
    (
     SELECT 
       CASE WHEN ST_X(sp) < ST_X(ep) THEN ST_AsEWKB(ST_SnapToGrid(ST_MakeLine(sp,ep), 0.0001))
       ELSE ST_AsEWKB(ST_SnapToGrid(ST_MakeLine(ep,sp), 0.0001))
       END as the_geom
     FROM
       (
        SELECT
          ST_PointN(geom, generate_series(1, ST_NPoints(geom)-1)) as sp,
          ST_PointN(geom, generate_series(2, ST_NPoints(geom)  )) as ep
        FROM
          (
           SELECT 
             (ST_Dump(geometrie)).geom
           FROM 
             $$schemaVorher.einzelobjekte_linienelement
          ) AS linestrings
       ) AS segments_before
       
     EXCEPT 
     
     SELECT 
       CASE WHEN ST_X(sp) < ST_X(ep) THEN ST_AsEWKB(ST_SnapToGrid(ST_MakeLine(sp,ep), 0.0001))
       ELSE ST_AsEWKB(ST_SnapToGrid(ST_MakeLine(ep,sp), 0.0001))
       END as the_geom
     FROM
       (
        SELECT
          ST_PointN(geom, generate_series(1, ST_NPoints(geom)-1)) as sp,
          ST_PointN(geom, generate_series(2, ST_NPoints(geom)  )) as ep
        FROM
          (
           SELECT 
             (ST_Dump(geometrie)).geom
           FROM 
             $$schemaNachher.einzelobjekte_linienelement
         ) AS linestrings
      ) AS segments_after
    ) as foo;

  -- EO LINIE AFTER EXCEPT BEFORE
  INSERT INTO $$speicherSchema.t_eo_li_after_except_before (the_geom)
  SELECT 
    ST_GeomFromEWKB(the_geom)
  FROM
    (
     SELECT 
       CASE WHEN ST_X(sp) < ST_X(ep) THEN ST_AsEWKB(ST_SnapToGrid(ST_MakeLine(sp,ep), 0.0001)) 
       ELSE ST_AsEWKB(ST_SnapToGrid(ST_MakeLine(ep,sp), 0.0001)) 
       END as the_geom
     FROM
       (
        SELECT
          ST_PointN(geom, generate_series(1, ST_NPoints(geom)-1)) as sp,
          ST_PointN(geom, generate_series(2, ST_NPoints(geom)  )) as ep
        FROM
          (
           SELECT 
             (ST_Dump((geometrie))).geom  
           FROM 
             $$schemaNachher.einzelobjekte_linienelement
          ) AS linestrings
       ) AS segments_before
       
     EXCEPT 
     
     SELECT 
       CASE WHEN ST_X(sp) < ST_X(ep) THEN ST_AsEWKB(ST_SnapToGrid(ST_MakeLine(sp,ep), 0.0001)) 
       ELSE ST_AsEWKB(ST_SnapToGrid(ST_MakeLine(ep,sp), 0.0001)) 
       END as the_geom
     FROM
       (
        SELECT
          ST_PointN(geom, generate_series(1, ST_NPoints(geom)-1)) as sp,
          ST_PointN(geom, generate_series(2, ST_NPoints(geom)  )) as ep
       FROM
         (
          SELECT 
            (ST_Dump((geometrie))).geom
          FROM 
            $$schemaVorher.einzelobjekte_linienelement
         ) AS linestrings
       ) AS segments_after
     ) as foo;

  -- EO PUNKT BEFORE EXCEPT AFTER
  INSERT INTO $$speicherSchema.t_eo_pt_before_except_after (the_geom)
  SELECT 
    ST_GeomFromEWKB(the_geom)
  FROM
    (
     SELECT 
       ST_AsEWKB(ST_SnapToGrid(geometrie, 0.001)) as the_geom
     FROM 
       $$schemaVorher.einzelobjekte_punktelement

     EXCEPT
     
     SELECT 
       ST_AsEWKB(ST_SnapToGrid(geometrie, 0.001)) as the_geom
     FROM 
       $$schemaNachher.einzelobjekte_punktelement
    ) as foo;

  -- EO PUNKT AFTER EXCEPT BEFORE
  INSERT INTO $$speicherSchema.t_eo_pt_after_except_before (the_geom)   
  SELECT 
    ST_GeomFromEWKB(the_geom)
  FROM
    (
     SELECT 
       ST_AsEWKB(ST_SnapToGrid(geometrie, 0.001)) as the_geom
     FROM 
       $$schemaNachher.einzelobjekte_punktelement
     EXCEPT
     SELECT 
       ST_AsEWKB(ST_SnapToGrid(geometrie, 0.001)) as the_geom
     FROM 
       $$schemaVorher.einzelobjekte_punktelement
    ) as foo;
    
COMMIT;
