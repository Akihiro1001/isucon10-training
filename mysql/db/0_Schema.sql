DROP DATABASE IF EXISTS isuumo;
CREATE DATABASE isuumo;

DROP TABLE IF EXISTS isuumo.estate;
DROP TABLE IF EXISTS isuumo.chair;

/** TAKI:popularity_desc追加 */
CREATE TABLE isuumo.estate
(
    id          INTEGER             NOT NULL PRIMARY KEY,
    name        VARCHAR(64)         NOT NULL,
    description VARCHAR(4096)       NOT NULL,
    thumbnail   VARCHAR(128)        NOT NULL,
    address     VARCHAR(128)        NOT NULL,
    latitude    DOUBLE PRECISION    NOT NULL,
    longitude   DOUBLE PRECISION    NOT NULL,
    rent        INTEGER             NOT NULL,
    door_height INTEGER             NOT NULL,
    door_width  INTEGER             NOT NULL,
    features    VARCHAR(64)         NOT NULL,
    popularity  INTEGER             NOT NULL,
    popularity_desc INTEGER AS (-popularity) NOT NULL,
    geom POINT
);

/** TAKI:インデックス追加 */
ALTER TABLE isuumo.estate ADD INDEX idx_popularity_desc_id(popularity_desc,id);
ALTER TABLE isuumo.estate ADD INDEX idx_rent_id (rent,id);
ALTER TABLE isuumo.estate ADD INDEX idx_door_width_rent(door_width,rent);
ALTER TABLE isuumo.estate ADD INDEX idx_door_height_rent(door_height,rent);

/** TAKI:popularity_desc追加 */
CREATE TABLE isuumo.chair
(
    id          INTEGER         NOT NULL PRIMARY KEY,
    name        VARCHAR(64)     NOT NULL,
    description VARCHAR(4096)   NOT NULL,
    thumbnail   VARCHAR(128)    NOT NULL,
    price       INTEGER         NOT NULL,
    height      INTEGER         NOT NULL,
    width       INTEGER         NOT NULL,
    depth       INTEGER         NOT NULL,
    color       VARCHAR(64)     NOT NULL,
    features    VARCHAR(64)     NOT NULL,
    kind        VARCHAR(64)     NOT NULL,
    popularity  INTEGER         NOT NULL,
    stock       INTEGER         NOT NULL,
    popularity_desc INTEGER AS (-popularity) NOT NULL
);


/** TAKI:インデックス追加 */
ALTER TABLE isuumo.chair ADD INDEX idx_popularity_desc_id(popularity_desc,id);
ALTER TABLE isuumo.chair ADD INDEX idx_price_id (price,id);
ALTER TABLE isuumo.chair ADD INDEX idx_price_stock(price, stock);
ALTER TABLE isuumo.chair ADD INDEX idx_height_stock(height, stock);
ALTER TABLE isuumo.chair ADD INDEX idx_kind_stock(kind, stock);
