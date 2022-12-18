UPDATE isuumo.estate SET geom=POINT(latitude, longitude);
ALTER TABLE isuumo.estate MODIFY geom POINT NOT NULL;
ALTER TABLE isuumo.estate ADD SPATIAL INDEX idx_geom(geom);
