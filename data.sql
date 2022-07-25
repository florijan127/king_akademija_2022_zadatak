CREATE TABLE BRAND (
    id_brand INTEGER PRIMARY KEY,
    naziv_brand VARCHAR
);

CREATE TABLE NACIN_PLACANJA (
    id_nacin_plac INTEGER PRIMARY KEY,
    naz_nacin_plac VARCHAR
);

CREATE TABLE POPUST_KODOVI (
    id_popust_kod INTEGER PRIMARY KEY,
    popust_kod VARCHAR UNIQUE,
    popust DECIMAL,
    iskoristen BOOLEAN
);

CREATE TABLE PROIZVOD (
    id_pro INTEGER PRIMARY KEY,
    naziv_pro VARCHAR,
    opis_pro VARCHAR,
    cijena_pro DECIMAL(7, 2),
	kolicina_pro INTEGER,
    id_brand INTEGER REFERENCES BRAND(id_brand)
);


CREATE TABLE NARUDZBA (
    id_nar INTEGER PRIMARY KEY,
    datum_nar TIMESTAMP,
    uk_cijena_bez_p INTEGER,
    uk_cijena_s_p INTEGER,
    id_popust_kod INTEGER  REFERENCES POPUST_KODOVI(id_popust_kod),
    id_nacin_plac INTEGER  REFERENCES NACIN_PLACANJA(id_nacin_plac),
    br_kartice VARCHAR,
    email VARCHAR,
    br_mob INTEGER,
    adr_dostave VARCHAR,
    napomena VARCHAR
);

CREATE TABLE NARUDZBA_PROIZVODI (
    id_nar_pro INTEGER PRIMARY KEY,
    id_nar INTEGER  REFERENCES NARUDZBA(id_nar),
    id_brand INTEGER  REFERENCES BRAND(id_brand)
);


INSERT INTO BRAND VALUES 
(1, 'PIK'),
(2, 'Mlinar'),
(3, 'Podravka'),
(4, 'Gavrilović');

INSERT INTO PROIZVOD VALUES 
(1, 'Salama', 'Domaća PIK salama', 29.99, 25, 1),
(2, 'Sir', 'Domaći sir Pik', 27.99, 25, 1),
(3, 'Kruh', 'Domaći kruh Mlinar', 12.99, 25, 2),
(4, 'Salata', 'Domaća salata Podravka', 7.99, 50, 3),
(5, 'Krastavci', 'Domaći Podraka krastavci', 12.99, 25, 3),
(6, 'Čajna', 'Domaća Čajna kobasic Gavrilović', 49.99, 25, 4);


