-- drop tables
DROP TABLE musicians;
DROP TABLE band;      
DROP TABLE alba;
DROP TABLE pisne;

-- create tables with foreign keys
CREATE TABLE band (
    id_skupiny NUMBER(6) PRIMARY KEY,
    name VARCHAR2(50) NOT NULL
);

CREATE TABLE musicians (
    id_hudebnika NUMBER(10) PRIMARY KEY,
    band_id NUMBER(6),
    name VARCHAR2(50) NOT NULL,
    instrument VARCHAR2(50),
    
    CONSTRAINT fk_band FOREIGN KEY (band_id) REFERENCES band (id_skupiny) 
);

CREATE TABLE alba (
    id_alba NUMBER(5) PRIMARY KEY,
    band_id NUMBER(6),
    name VARCHAR(50),
    datum_vydani DATE,
    
    CONSTRAINT fk_band FOREIGN KEY (band_id) REFERENCES band (id_skupiny) 
);

CREATE TABLE pisne (
    id_pisne NUMBER(5) PRIMARY KEY,
    id_alba NUMBER(5),
    name VARCHAR(50) NOT NULL,
    
    CONSTRAINT fk_alba FOREIGN KEY (id_alba) REFERENCES alba (id_alba) 
);

-- instert into tables
INSERT INTO band (id_skupiny, name) VALUES (1, 'Kabati');
INSERT INTO musicians (id_hudebnika, band_id, name, instrument) VALUES (1, 1, 'Jakub Valasek', 'Svicka');
INSERT INTO alba (id_alba, band_id, name, datum_vydani) VALUES (1, 1, 'Zavodou', '2024-05-01');
INSERT INTO pisne (id_pisne, id_alba, name) VALUES (1, 1, 'Jicinka');

-- select everything from tables with corresponding 
SELECT * FROM band WHERE id_skupiny = 1;
SELECT * FROM musicians WHERE id_hudebnika = 1;
SELECT * FROM alba WHERE id_alba = 1;
SELECT * FROM pisne WHERE id_pisne = 1;