UPDATE isuumo.estate SET geom=POINT(latitude, longitude);
ALTER TABLE issumo.estate MODIFY COLUMN geom POINT NOT NULL;
ALTER TABLE issumo.estate ADD SPATIAL INDEX idx_geom(geom);
