CREATE TABLE CAMPUS(

    ID_campus varchar(20)
        CONSTRAINT CAMPUS_ID_campus_PK PRIMARY KEY,

    Locatie varchar(40)
        CONSTRAINT CAMPUS_Locatie_NN NOT NULL
        CONSTRAINT CAMPUS_Locatie_UQ UNIQUE,

    Are_cantina char(2)
        DEFAULT 'NU'
        CONSTRAINT  CAMPUS_Are_cantina_NN NOT NULL,

    Are_baza_sportiva char(2)
        DEFAULT 'NU'
        CONSTRAINT  CAMPUS_Are_baza_sportiva_NN NOT NULL
);



INSERT INTO CAMPUS(ID_campus, Locatie,Are_cantina,Are_baza_sportiva) VALUES
   ('MLTR1170','Militari, Strada Drumul Osiei nr.19','DA','NU');
INSERT INTO CAMPUS(ID_campus, Locatie,Are_cantina,Are_baza_sportiva) VALUES
    ('PEPO836','Petrache Poenaru, Strada Soarelui nr.17','DA','DA');
INSERT INTO CAMPUS(ID_campus, Locatie,Are_cantina,Are_baza_sportiva) VALUES
    ('VITN2750','Vitan, Bulevardul Energeticienilor nr.12','NU','NU');
INSERT INTO CAMPUS(ID_campus, Locatie,Are_cantina,Are_baza_sportiva) VALUES
    ('DRTA1260','Drumul Taberei, Strada Brasov nr.40','NU','NU');



CREATE TABLE CLADIRE(

    ID_cladire char(7)
        CONSTRAINT CLADIRE_ID_cladire_PK PRIMARY KEY,

    ID_campus varchar(20)
        CONSTRAINT CLADIRE_ID_campus_FK REFERENCES CAMPUS(ID_campus) ON DELETE CASCADE
        CONSTRAINT CLADIRE_ID_campus_NN NOT NULL,

    Etaje int
        CONSTRAINT CLADIRE_Etaje_NN NOT NULL
        CONSTRAINT  CLADIRE_Etaje_CK CHECK(Etaje >=2 AND Etaje <=10),

    Numar_stingatoare int
        DEFAULT 0
        CONSTRAINT  CLADIRE_Numar_stingatoare_NN NOT NULL,
        CONSTRAINT CLADIRE_Numar_stingatoare_CK CHECK (Numar_stingatoare <=2* Etaje)

);


---CAMPUS MILITARI---
INSERT INTO CLADIRE(ID_cladire, ID_campus, Etaje,Numar_stingatoare) VALUES
    ('M1_1170','MLTR1170',4,2);
INSERT INTO CLADIRE(ID_cladire, ID_campus, Etaje,Numar_stingatoare) VALUES
    ('M2_1170','MLTR1170',3,0);
INSERT INTO CLADIRE(ID_cladire, ID_campus, Etaje,Numar_stingatoare) VALUES
    ('M3_1170','MLTR1170',2,4);


---CAMPUS PETRACHE POENARU---
INSERT INTO CLADIRE(ID_cladire, ID_campus, Etaje,Numar_stingatoare) VALUES
    ('M1_836','PEPO836',8,15);


---CAMPUS VITAN---
INSERT INTO CLADIRE(ID_cladire, ID_campus, Etaje,Numar_stingatoare) VALUES
    ('M1_2750','VITN2750',2,4);
INSERT INTO CLADIRE(ID_cladire, ID_campus, Etaje,Numar_stingatoare) VALUES
    ('M2_2750','VITN2750',2,1);


---CAMPUS DRUMUL TABEREI---
INSERT INTO CLADIRE(ID_cladire, ID_campus, Etaje,Numar_stingatoare) VALUES
    ('M1_1260','DRTA1260',3,6);


CREATE TABLE TIP_CAMERA(

    ID_tip char(3)
        CONSTRAINT TIP_CAMERA_ID_tip_PK PRIMARY KEY,

    Denumire varchar(25)
        CONSTRAINT TIP_CAMERA_Denumire_UQ UNIQUE
        CONSTRAINT TIP_CAMERA_Denumire_NN NOT NULL,

    Premium char(2)
        DEFAULT 'NU'
        CONSTRAINT  TIP_CAMERA_Premium_NN NOT NULL,

    Numar_locuri int
        CONSTRAINT  TIP_CAMERA_Numar_locuri_NN NOT NULL
        CONSTRAINT  TIP_CAMERA_Numar_locuri_CK CHECK (Numar_locuri <=3)

);

INSERT INTO TIP_CAMERA(ID_tip, Denumire, Premium,Numar_locuri) VALUES
    ('SNP','Single Standard','NU',1);
INSERT INTO TIP_CAMERA(ID_tip, Denumire, Premium,Numar_locuri) VALUES
    ('SP','Single Premium','DA',1);
INSERT INTO TIP_CAMERA(ID_tip, Denumire, Premium,Numar_locuri) VALUES
    ('DNP','Double Standard','NU',2);
INSERT INTO TIP_CAMERA(ID_tip, Denumire, Premium,Numar_locuri) VALUES
    ('DP','Double Premium','DA',2);
INSERT INTO TIP_CAMERA(ID_tip, Denumire, Premium,Numar_locuri) VALUES
    ('TNP','Triple Standard','NU',3);
INSERT INTO TIP_CAMERA(ID_tip, Denumire, Premium,Numar_locuri) VALUES
    ('TP','Triple Premium','DA',3);
INSERT INTO TIP_CAMERA(ID_tip, Denumire, Premium,Numar_locuri) VALUES
    ('EX','Exclusive','DA',2);

CREATE TABLE CAMERE(

    ID_camera varchar(10)
        CONSTRAINT CAMERE_ID_camera_PK PRIMARY KEY,

    ID_cladire char(7)
        CONSTRAINT CAMERE_ID_cladire_FK REFERENCES CLADIRE(ID_cladire) ON DELETE CASCADE
        CONSTRAINT CAMERE_ID_cladire_NN  NOT NULL,

    Etaj smallint
        CONSTRAINT  CAMERE_ID_Etaj_NN NOT NULL,

    ID_tip char(3)
        CONSTRAINT  CAMERE_ID_tip_FK REFERENCES TIP_CAMERA(ID_tip) ON DELETE CASCADE
        CONSTRAINT   CAMERE_ID_tip_NN NOT NULL,

    Necesita_reparatii char(2)
        DEFAULT 'NU'
        CONSTRAINT  CAMERE_ID_Necesita_rep_NN NOT NULL

);

---M1 Militari---
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('1_M1_1170','M1_1170',0,'SNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('2_M1_1170','M1_1170',0,'DP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('3_M1_1170','M1_1170',0,'SNP','DA') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('4_M1_1170','M1_1170',0,'DNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('5_M1_1170','M1_1170',0,'SNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('6_M1_1170','M1_1170',1,'DP','DA') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('7_M1_1170','M1_1170',1,'SNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('8_M1_1170','M1_1170',1,'SNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('9_M1_1170','M1_1170',1,'EX','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('10_M1_1170','M1_1170',1,'TNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('11_M1_1170','M1_1170',2,'SNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('12_M1_1170','M1_1170',2,'DNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('13_M1_1170','M1_1170',2,'DP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('14_M1_1170','M1_1170',2,'SP','DA') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('15_M1_1170','M1_1170',2,'SNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('16_M1_1170','M1_1170',3,'SP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('17_M1_1170','M1_1170',3,'SNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('18_M1_1170','M1_1170',3,'SP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('19_M1_1170','M1_1170',3,'TNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('20_M1_1170','M1_1170',3,'SNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('21_M1_1170','M1_1170',4,'TNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('22_M1_1170','M1_1170',4,'SNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('23_M1_1170','M1_1170',4,'SNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('24_M1_1170','M1_1170',4,'SP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('25_M1_1170','M1_1170',4,'EX','NU') ;

---M2 Militari---
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('1_M2_1170','M2_1170',0,'SP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('2_M2_1170','M2_1170',0,'SNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('3_M2_1170','M2_1170',0,'DNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('4_M2_1170','M2_1170',0,'EX','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('5_M2_1170','M2_1170',0,'EX','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('6_M2_1170','M2_1170',1,'DP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('7_M2_1170','M2_1170',1,'TP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('8_M2_1170','M2_1170',1,'TNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('9_M2_1170','M2_1170',1,'SP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('10_M2_1170','M2_1170',1,'EX','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('11_M2_1170','M2_1170',2,'SNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('12_M2_1170','M2_1170',2,'EX','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('13_M2_1170','M2_1170',2,'TNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('14_M2_1170','M2_1170',2,'DNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('15_M2_1170','M2_1170',2,'EX','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('16_M2_1170','M2_1170',3,'SNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('17_M2_1170','M2_1170',3,'DP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('18_M2_1170','M2_1170',3,'DNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('19_M2_1170','M2_1170',3,'SP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('20_M2_1170','M2_1170',3,'EX','NU') ;

---M3 Militari---
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('1_M3_1170','M3_1170',0,'SP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('2_M3_1170','M3_1170',0,'SNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('3_M3_1170','M3_1170',0,'SP','DA') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('4_M3_1170','M3_1170',0,'DNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('5_M3_1170','M3_1170',0,'TNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('6_M3_1170','M3_1170',1,'TP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('7_M3_1170','M3_1170',1,'TNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('8_M3_1170','M3_1170',1,'TP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('9_M3_1170','M3_1170',1,'DNP','DA') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('10_M3_1170','M3_1170',1,'TP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('11_M3_1170','M3_1170',2,'TNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('12_M3_1170','M3_1170',2,'SNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('13_M3_1170','M3_1170',2,'TNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('14_M3_1170','M3_1170',2,'EX','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('15_M3_1170','M3_1170',2,'SP','NU') ;

---M1 PETRACHE POENARU---
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('1_M1_836','M1_836',0,'SNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('2_M1_836','M1_836',0,'DP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('3_M1_836','M1_836',0,'TP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('4_M1_836','M1_836',0,'TNP','DA') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('5_M1_836','M1_836',0,'SP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('6_M1_836','M1_836',1,'SNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('7_M1_836','M1_836',1,'SP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('8_M1_836','M1_836',1,'TP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('9_M1_836','M1_836',1,'SP','DA') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('10_M1_836','M1_836',1,'TP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('11_M1_836','M1_836',2,'SP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('12_M1_836','M1_836',2,'DP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('13_M1_836','M1_836',2,'SP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('14_M1_836','M1_836',2,'DNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('15_M1_836','M1_836',2,'SP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('16_M1_836','M1_836',3,'SP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('17_M1_836','M1_836',3,'DP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('18_M1_836','M1_836',3,'SP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('19_M1_836','M1_836',3,'DNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('20_M1_836','M1_836',3,'SP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('21_M1_836','M1_836',4,'TP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('22_M1_836','M1_836',4,'TNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('23_M1_836','M1_836',4,'SP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('24_M1_836','M1_836',4,'EX','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('25_M1_836','M1_836',4,'TNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('26_M1_836','M1_836',5,'SP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('27_M1_836','M1_836',5,'DP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('28_M1_836','M1_836',5,'DNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('29_M1_836','M1_836',5,'TP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('30_M1_836','M1_836',5,'TNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('31_M1_836','M1_836',6,'DP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('32_M1_836','M1_836',6,'SP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('33_M1_836','M1_836',6,'SNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('34_M1_836','M1_836',6,'DP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('35_M1_836','M1_836',6,'DNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('36_M1_836','M1_836',7,'SNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('37_M1_836','M1_836',7,'SP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('38_M1_836','M1_836',7,'EX','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('39_M1_836','M1_836',7,'EX','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('40_M1_836','M1_836',7,'TP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('41_M1_836','M1_836',8,'TNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('42_M1_836','M1_836',8,'TP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('43_M1_836','M1_836',8,'DP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('44_M1_836','M1_836',8,'DNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('45_M1_836','M1_836',8,'SP','NU') ;

---M1 VITAN---
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('1_M1_2750','M1_2750',0,'SP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('2_M1_2750','M1_2750',0,'SNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('3_M1_2750','M1_2750',0,'DP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('4_M1_2750','M1_2750',0,'TP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('5_M1_2750','M1_2750',0,'DNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('6_M1_2750','M1_2750',1,'TNP','DA') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('7_M1_2750','M1_2750',1,'EX','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('8_M1_2750','M1_2750',1,'TP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('9_M1_2750','M1_2750',1,'SNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('10_M1_2750','M1_2750',1,'SP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('11_M1_2750','M1_2750',2,'DP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('12_M1_2750','M1_2750',2,'TNP','DA') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('13_M1_2750','M1_2750',2,'DP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('14_M1_2750','M1_2750',2,'TNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('15_M1_2750','M1_2750',2,'TNP','NU') ;

---M2 VITAN---
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('1_M2_2750','M2_2750',0,'EX','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('2_M2_2750','M2_2750',0,'SNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('3_M2_2750','M2_2750',0,'DP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('4_M2_2750','M2_2750',0,'TP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('5_M2_2750','M2_2750',0,'DP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('6_M2_2750','M2_2750',1,'TNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('7_M2_2750','M2_2750',1,'EX','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('8_M2_2750','M2_2750',1,'TP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('9_M2_2750','M2_2750',1,'SNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('10_M2_2750','M2_2750',1,'SNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('11_M2_2750','M2_2750',2,'DNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('12_M2_2750','M2_2750',2,'TP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('13_M2_2750','M2_2750',2,'DNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('14_M2_2750','M2_2750',2,'TNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('15_M2_2750','M2_2750',2,'TNP','NU') ;

---M1 DRUMUL TABEREI---
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('1_M1_1260','M1_1260',0,'TNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('2_M1_1260','M1_1260',0,'TP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('3_M1_1260','M1_1260',0,'DP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('4_M1_1260','M1_1260',0,'TP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('5_M1_1260','M1_1260',0,'DNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('6_M1_1260','M1_1260',1,'DNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('7_M1_1260','M1_1260',1,'DP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('8_M1_1260','M1_1260',1,'DNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('9_M1_1260','M1_1260',1,'TNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('10_M1_1260','M1_1260',1,'TP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('11_M1_1260','M1_1260',2,'DNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('12_M1_1260','M1_1260',2,'TP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('13_M1_1260','M1_1260',2,'TNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('14_M1_1260','M1_1260',2,'TNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('15_M1_1260','M1_1260',2,'TP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('16_M1_1260','M1_1260',3,'TP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('17_M1_1260','M1_1260',3,'DNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('18_M1_1260','M1_1260',3,'TP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('19_M1_1260','M1_1260',3,'DNP','NU') ;
INSERT INTO CAMERE(ID_camera, ID_cladire, Etaj, ID_tip, Necesita_reparatii) VALUES
  ('20_M1_1260','M1_1260',3,'TP','NU') ;


CREATE TABLE DEPARTAMENTE(

    ID_departament int
        CONSTRAINT DEPARTAMENTE_ID_departament_PK PRIMARY KEY,

    Nume_departament varchar(25)
        CONSTRAINT DEPARTAMENTE_Nume_depart_NN NOT NULL
        CONSTRAINT DEPARTAMENTE_Nume_depart_UQ UNIQUE

);

INSERT INTO DEPARTAMENTE(ID_departament, Nume_departament) VALUES
    (1049,'Securitate');
INSERT INTO DEPARTAMENTE(ID_departament, Nume_departament) VALUES
    (1358,'Administratie');
INSERT INTO DEPARTAMENTE(ID_departament, Nume_departament) VALUES
    (928,'Curatenie');
INSERT INTO DEPARTAMENTE(ID_departament, Nume_departament) VALUES
    (2046,'Reparatii si Intretinere');


CREATE SEQUENCE ANGAJATI_ID_angajat_SEQ
START WITH 1
MAXVALUE 99999
NOCACHE NOCYCLE;

CREATE TABLE ANGAJATI(

    ID_angajat int
        CONSTRAINT ANGAJATI_ID_angajat_PK PRIMARY KEY,

    ID_departament int
        CONSTRAINT ANGAJATI_ID_departament_FK REFERENCES DEPARTAMENTE(ID_departament) ON DELETE CASCADE
        CONSTRAINT ANGAJATI_ID_departament_NN NOT NULL,

    Nume varchar(15)
        CONSTRAINT  ANGAJATI_Nume_NN NOT NULL,

    Prenume varchar(20)
        CONSTRAINT  ANGAJATI_Prenume_NN NOT NULL,

    An_nastere date
        CONSTRAINT  ANGAJATI_An_nastere_NN NOT NULL,

    Oras varchar(15),

    Salariu number(7,2)
        DEFAULT 1800
        CONSTRAINT  ANGAJATI_Salariu_NN NOT NULL
        CONSTRAINT ANGAJATI_Salariu_CK CHECK ( Salariu>=1800),

    ID_campus varchar(20)
        CONSTRAINT ANGAJATI_ID_campus_FK REFERENCES CAMPUS(ID_campus) ON DELETE CASCADE
        CONSTRAINT ANGAJATI_ID_campus_NN NOT NULL

);

---Angajati Campus Militari---
INSERT INTO ANGAJATI VALUES
    (ANGAJATI_ID_angajat_SEQ.nextval,1049,'Agache','Marian',TO_DATE('10/07/1990','DD/MM/YYYY'),'Timisoara',2000.36,'MLTR1170');
INSERT INTO ANGAJATI VALUES
    (ANGAJATI_ID_angajat_SEQ.nextval,1049,'Miron','Eduard',TO_DATE('10/07/1984','DD/MM/YYYY'),'Suceava',2200.36,'MLTR1170');
INSERT INTO ANGAJATI VALUES
    (ANGAJATI_ID_angajat_SEQ.nextval,1049,'Stanescu','George',TO_DATE('13/05/1997','DD/MM/YYYY'),'Bucuresti',2000.36,'MLTR1170');
INSERT INTO ANGAJATI VALUES
    (ANGAJATI_ID_angajat_SEQ.nextval,1358,'Tanase','Andreea',TO_DATE('17/09/1998','DD/MM/YYYY'),'Bucuresti',2607.84,'MLTR1170');
INSERT INTO ANGAJATI VALUES
    (ANGAJATI_ID_angajat_SEQ.nextval,1358,'Felea','Marius',TO_DATE('10/12/1991','DD/MM/YYYY'),'Braila',3600.11,'MLTR1170');
INSERT INTO ANGAJATI VALUES
    (ANGAJATI_ID_angajat_SEQ.nextval,1358,'Demetrin','Tudor',TO_DATE('11/03/2000','DD/MM/YYYY'),'Brasov',2600.84,'MLTR1170');
INSERT INTO ANGAJATI VALUES
    (ANGAJATI_ID_angajat_SEQ.nextval,928,'Ilie','Ioana',TO_DATE('29/01/1978','DD/MM/YYYY'),'Iasi',2430.40,'MLTR1170');
INSERT INTO ANGAJATI VALUES
    (ANGAJATI_ID_angajat_SEQ.nextval,928,'Macovei','Sorina',TO_DATE('27/10/1986','DD/MM/YYYY'),'Bucuresti',2430.40,'MLTR1170');
INSERT INTO ANGAJATI VALUES
    (ANGAJATI_ID_angajat_SEQ.nextval,2046,'Dumitrescu','Sorin',TO_DATE('12/11/1983','DD/MM/YYYY'),'Slobozia',2510.10,'MLTR1170');

---Angajati Campus Petrache Poenaru---
INSERT INTO ANGAJATI VALUES
    (ANGAJATI_ID_angajat_SEQ.nextval,1049,'Dragan','Iulian',TO_DATE('16/02/1969','DD/MM/YYYY'),'Bucuresti',2700.12,'PEPO836');
INSERT INTO ANGAJATI VALUES
    (ANGAJATI_ID_angajat_SEQ.nextval,1358,'Negoita','Dragos',TO_DATE('04/04/1988','DD/MM/YYYY'),'Bucuresti',4350.84,'PEPO836');
INSERT INTO ANGAJATI VALUES
    (ANGAJATI_ID_angajat_SEQ.nextval,2046,'Bostan','David',TO_DATE('09/12/1989','DD/MM/YYYY'),'Vaslui',3090.10,'PEPO836');

---Angajati Campus Vitan---
INSERT INTO ANGAJATI VALUES
    (ANGAJATI_ID_angajat_SEQ.nextval,1049,'Lemnaru','Andrei',TO_DATE('16/11/1959','DD/MM/YYYY'),'Bucuresti',2706.92,'VITN2750');
INSERT INTO ANGAJATI VALUES
    (ANGAJATI_ID_angajat_SEQ.nextval,928,'Dumistrescu','Maria',TO_DATE('07/02/1961','DD/MM/YYYY'),'Buzau',2520.80,'VITN2750');
INSERT INTO ANGAJATI VALUES
    (ANGAJATI_ID_angajat_SEQ.nextval,928,'Schiopu','Dorina',TO_DATE('14/09/1972','DD/MM/YYYY'),'Bucuresti',2380.40,'VITN2750');
INSERT INTO ANGAJATI VALUES
    (ANGAJATI_ID_angajat_SEQ.nextval,1358,'Patrascu','Sergiu',TO_DATE('06/08/1994','DD/MM/YYYY'),'Bucuresti',3710.82,'VITN2750');
INSERT INTO ANGAJATI VALUES
    (ANGAJATI_ID_angajat_SEQ.nextval,2046,'Olteanu','Octavian',TO_DATE('26/06/1995','DD/MM/YYYY'),'Constanta',3120.15,'VITN2750');

---Angajati Campus Drumul Taberei---
INSERT INTO ANGAJATI VALUES
    (ANGAJATI_ID_angajat_SEQ.nextval,1049,'Baston','Bogdan',TO_DATE('02/03/1973','DD/MM/YYYY'),'Bucuresti',2311.22,'DRTA1260');
INSERT INTO ANGAJATI VALUES
    (ANGAJATI_ID_angajat_SEQ.nextval,928,'Iosif','Georgiana',TO_DATE('09/05/1985','DD/MM/YYYY'),'Botosani',2810.20,'DRTA1260');


CREATE SEQUENCE CLIENTI_ID_client_SEQ
START WITH 1
MAXVALUE 9999999
NOCACHE NOCYCLE;

CREATE TABLE CLIENTI(

    ID_client int
        CONSTRAINT CLIENTI_ID_client_PK  PRIMARY KEY,

    Nume varchar(15)
        CONSTRAINT CLIENTI_Nume_NN NOT NULL,

    Prenume varchar(20)
        CONSTRAINT CLIENTI_Prenume_NN NOT NULL,

    Facultate varchar(50)
        DEFAULT '-',

    Data_nastere date
        CONSTRAINT CLIENTI_Data_nastere_NN NOT NULL,

    Sex  char(1)
        CONSTRAINT  CLIENTI_Sex_NN NOT NULL

);

INSERT INTO CLIENTI(ID_client, Nume, Prenume, Facultate, Data_nastere, Sex)  VALUES
    (CLIENTI_ID_client_SEQ.nextval,'Tanase','Victor','',TO_DATE('10/07/2002','DD/MM/YYYY'),'M');
INSERT INTO CLIENTI(ID_client, Nume, Prenume, Facultate, Data_nastere, Sex)  VALUES
    (CLIENTI_ID_client_SEQ.nextval,'Turis','Marius','Facultatea de Medicina Generala',TO_DATE('11/09/2003','DD/MM/YYYY'),'M');
INSERT INTO CLIENTI(ID_client, Nume, Prenume, Facultate, Data_nastere, Sex)  VALUES
    (CLIENTI_ID_client_SEQ.nextval,'Ionascu','Andrei','Facultatea de Psihologie',TO_DATE('19/02/2001','DD/MM/YYYY'),'M');
INSERT INTO CLIENTI(ID_client, Nume, Prenume, Facultate, Data_nastere, Sex)  VALUES
    (CLIENTI_ID_client_SEQ.nextval,'Reut','Iulia','Facultatea de Istorie',TO_DATE('23/11/2003','DD/MM/YYYY'),'F');
INSERT INTO CLIENTI(ID_client, Nume, Prenume, Facultate, Data_nastere, Sex)  VALUES
    (CLIENTI_ID_client_SEQ.nextval,'Dinu','Maria','Facultatea de Biologie',TO_DATE('29/05/1999','DD/MM/YYYY'),'F');
INSERT INTO CLIENTI(ID_client, Nume, Prenume, Facultate, Data_nastere, Sex)  VALUES
    (CLIENTI_ID_client_SEQ.nextval,'Ilie','Adrian','Facultatea de Matematica',TO_DATE('06/03/2002','DD/MM/YYYY'),'M');
INSERT INTO CLIENTI(ID_client, Nume, Prenume, Facultate, Data_nastere, Sex)  VALUES
    (CLIENTI_ID_client_SEQ.nextval,'Lungu','Diana','Facultatea de Istorie',TO_DATE('17/12/2001','DD/MM/YYYY'),'F');
INSERT INTO CLIENTI(ID_client, Nume, Prenume, Facultate, Data_nastere, Sex)  VALUES
    (CLIENTI_ID_client_SEQ.nextval,'Govor','Mihai','Facultatea de Arte',TO_DATE('23/01/1998 ','DD/MM/YYYY'),'M');
INSERT INTO CLIENTI(ID_client, Nume, Prenume, Facultate, Data_nastere, Sex)  VALUES
    (CLIENTI_ID_client_SEQ.nextval,'Neagu','Alexandru','Facultatea de Automatica si Calculatoare',TO_DATE('25/04/2000','DD/MM/YYYY'),'M');
INSERT INTO CLIENTI(ID_client, Nume, Prenume, Facultate, Data_nastere, Sex)  VALUES
    (CLIENTI_ID_client_SEQ.nextval,'Irimia','Elena','Facultatea de Administratie si Afaceri',TO_DATE('20/12/2001','DD/MM/YYYY'),'F');
INSERT INTO CLIENTI(ID_client, Nume, Prenume, Facultate, Data_nastere, Sex)  VALUES
    (CLIENTI_ID_client_SEQ.nextval,'Dobre','Ioana','',TO_DATE('19/03/2002','DD/MM/YYYY'),'F');
INSERT INTO CLIENTI(ID_client, Nume, Prenume, Facultate, Data_nastere, Sex)  VALUES
    (CLIENTI_ID_client_SEQ.nextval,'Dragnea','Marian','Facultatea de Geografie',TO_DATE('22/11/2003','DD/MM/YYYY'),'M');
INSERT INTO CLIENTI(ID_client, Nume, Prenume, Facultate, Data_nastere, Sex)  VALUES
    (CLIENTI_ID_client_SEQ.nextval,'Macovei','Stefan','Facultatea de Relatii Internationale',TO_DATE('16/07/2001','DD/MM/YYYY'),'M');
INSERT INTO CLIENTI(ID_client, Nume, Prenume, Facultate, Data_nastere, Sex)  VALUES
    (CLIENTI_ID_client_SEQ.nextval,'Stanciu','Miruna','Facultatea de Matematica',TO_DATE('19/08/2002','DD/MM/YYYY'),'F');
INSERT INTO CLIENTI(ID_client, Nume, Prenume, Facultate, Data_nastere, Sex)  VALUES
    (CLIENTI_ID_client_SEQ.nextval,'Dragnea','Emilia','Facultatea de Istorie',TO_DATE('03/01/2001','DD/MM/YYYY'),'F');
INSERT INTO CLIENTI(ID_client, Nume, Prenume, Facultate, Data_nastere, Sex)  VALUES
    (CLIENTI_ID_client_SEQ.nextval,'Tanase','Alexia','',TO_DATE('10/07/1997','DD/MM/YYYY'),'F');
INSERT INTO CLIENTI(ID_client, Nume, Prenume, Facultate, Data_nastere, Sex)  VALUES
    (CLIENTI_ID_client_SEQ.nextval,'Dinu','Matei','',TO_DATE('10/07/1999','DD/MM/YYYY'),'M');
INSERT INTO CLIENTI(ID_client, Nume, Prenume, Facultate, Data_nastere, Sex)  VALUES
    (CLIENTI_ID_client_SEQ.nextval,'Zaharia','Amedeea','Facultatea de Medicina Generala',TO_DATE('09/05/1997','DD/MM/YYYY'),'F');
INSERT INTO CLIENTI(ID_client, Nume, Prenume, Facultate, Data_nastere, Sex)  VALUES
    (CLIENTI_ID_client_SEQ.nextval,'Enache','Andra','Facultatea de Informatica',TO_DATE('11/07/2002','DD/MM/YYYY'),'F');
INSERT INTO CLIENTI(ID_client, Nume, Prenume, Facultate, Data_nastere, Sex)  VALUES
    (CLIENTI_ID_client_SEQ.nextval,'Neacsu','Razvan','Facultatea de Biologie',TO_DATE('06/04/2000','DD/MM/YYYY'),'M');
INSERT INTO CLIENTI(ID_client, Nume, Prenume, Facultate, Data_nastere, Sex)  VALUES
    (CLIENTI_ID_client_SEQ.nextval,'Ionascu','Marius','',TO_DATE('10/07/1998','DD/MM/YYYY'),'M');
INSERT INTO CLIENTI(ID_client, Nume, Prenume, Facultate, Data_nastere, Sex)  VALUES
    (CLIENTI_ID_client_SEQ.nextval,'Ilie','Iulian','Facultatea de Informatica',TO_DATE('01/10/2002','DD/MM/YYYY'),'M');
INSERT INTO CLIENTI(ID_client, Nume, Prenume, Facultate, Data_nastere, Sex)  VALUES
    (CLIENTI_ID_client_SEQ.nextval,'Dinu','Raluca','Facultatea de Psihologie',TO_DATE('23/05/2000','DD/MM/YYYY'),'F');


CREATE SEQUENCE CONTRACTE_IE_ID_contract_SEQ
START WITH 1
MAXVALUE 9999999
NOCACHE NOCYCLE;

CREATE TABLE CONTRACTE_INCHIRIERE(

    ID_contract int
        CONSTRAINT CONTRACTE_IE_ID_contract_PK  PRIMARY KEY,

    ID_client int
        CONSTRAINT CONTRACTE_IE_ID_client_NN NOT NULL
        CONSTRAINT CONTRACTE_IE_ID_client_FK REFERENCES CLIENTI(ID_client) ON DELETE CASCADE ,

    Inceput_contract date
        CONSTRAINT CONTRACTE_IE_Inceput_contr_NN NOT NULL,

    Final_contract date
        CONSTRAINT CONTRACTE_IE_Final_contract_NN NOT NULL,
        CONSTRAINT  CONTRACTE_IE_Final_contract_CK CHECK (Final_contract>Inceput_contract),

    ID_camera varchar(10)
        CONSTRAINT CONTRACTE_IE_ID_camera_NN NOT NULL
        CONSTRAINT CONTRACTE_IE_ID_camera_FK REFERENCES CAMERE(ID_camera) ON DELETE CASCADE

);

INSERT INTO CONTRACTE_INCHIRIERE(ID_contract, ID_client, Inceput_contract, Final_contract, ID_camera)VALUES
    (CONTRACTE_IE_ID_contract_SEQ.nextval,1,TO_DATE('05/07/2022','DD/MM/YYYY'),TO_DATE('05/07/2023','DD/MM/YYYY'),'3_M1_1170');
INSERT INTO CONTRACTE_INCHIRIERE(ID_contract, ID_client, Inceput_contract, Final_contract, ID_camera)VALUES
    (CONTRACTE_IE_ID_contract_SEQ.nextval,2,TO_DATE('06/07/2022','DD/MM/YYYY'),TO_DATE('06/07/2023','DD/MM/YYYY'),'5_M2_1170');
INSERT INTO CONTRACTE_INCHIRIERE(ID_contract, ID_client, Inceput_contract, Final_contract, ID_camera)VALUES
    (CONTRACTE_IE_ID_contract_SEQ.nextval,3,TO_DATE('10/07/2022','DD/MM/YYYY'),TO_DATE('10/07/2023','DD/MM/YYYY'),'5_M2_1170');
INSERT INTO CONTRACTE_INCHIRIERE(ID_contract, ID_client, Inceput_contract, Final_contract, ID_camera)VALUES
    (CONTRACTE_IE_ID_contract_SEQ.nextval,4,TO_DATE('10/07/2022','DD/MM/YYYY'),TO_DATE('10/07/2023','DD/MM/YYYY'),'10_M3_1170');
INSERT INTO CONTRACTE_INCHIRIERE(ID_contract, ID_client, Inceput_contract, Final_contract, ID_camera)VALUES
    (CONTRACTE_IE_ID_contract_SEQ.nextval,5,TO_DATE('11/07/2022','DD/MM/YYYY'),TO_DATE('11/07/2023','DD/MM/YYYY'),'2_M1_1170');
INSERT INTO CONTRACTE_INCHIRIERE(ID_contract, ID_client, Inceput_contract, Final_contract, ID_camera)VALUES
    (CONTRACTE_IE_ID_contract_SEQ.nextval,6,TO_DATE('13/08/2022','DD/MM/YYYY'),TO_DATE('13/08/2024','DD/MM/YYYY'),'4_M1_1170');
INSERT INTO CONTRACTE_INCHIRIERE(ID_contract, ID_client, Inceput_contract, Final_contract, ID_camera)VALUES
    (CONTRACTE_IE_ID_contract_SEQ.nextval,7,TO_DATE('13/08/2022','DD/MM/YYYY'),TO_DATE('13/08/2023','DD/MM/YYYY'),'4_M1_1170');
INSERT INTO CONTRACTE_INCHIRIERE(ID_contract, ID_client, Inceput_contract, Final_contract, ID_camera)VALUES
    (CONTRACTE_IE_ID_contract_SEQ.nextval,8,TO_DATE('15/08/2022','DD/MM/YYYY'),TO_DATE('15/08/2023','DD/MM/YYYY'),'20_M1_1170');
INSERT INTO CONTRACTE_INCHIRIERE(ID_contract, ID_client, Inceput_contract, Final_contract, ID_camera)VALUES
    (CONTRACTE_IE_ID_contract_SEQ.nextval,9,TO_DATE('15/08/2022','DD/MM/YYYY'),TO_DATE('15/08/2024','DD/MM/YYYY'),'5_M1_836');
INSERT INTO CONTRACTE_INCHIRIERE(ID_contract, ID_client, Inceput_contract, Final_contract, ID_camera)VALUES
    (CONTRACTE_IE_ID_contract_SEQ.nextval,10,TO_DATE('13/10/2022','DD/MM/YYYY'),TO_DATE('13/10/2023','DD/MM/YYYY'),'5_M1_1170');
INSERT INTO CONTRACTE_INCHIRIERE(ID_contract, ID_client, Inceput_contract, Final_contract, ID_camera)VALUES
    (CONTRACTE_IE_ID_contract_SEQ.nextval,11,TO_DATE('14/10/2022','DD/MM/YYYY'),TO_DATE('14/10/2023','DD/MM/YYYY'),'3_M1_2750');
INSERT INTO CONTRACTE_INCHIRIERE(ID_contract, ID_client, Inceput_contract, Final_contract, ID_camera)VALUES
    (CONTRACTE_IE_ID_contract_SEQ.nextval,12,TO_DATE('14/10/2022','DD/MM/YYYY'),TO_DATE('14/10/2023','DD/MM/YYYY'),'15_M2_2750');
INSERT INTO CONTRACTE_INCHIRIERE(ID_contract, ID_client, Inceput_contract, Final_contract, ID_camera)VALUES
    (CONTRACTE_IE_ID_contract_SEQ.nextval,13,TO_DATE('1/11/2022','DD/MM/YYYY'),TO_DATE('1/11/2023','DD/MM/YYYY'),'6_M1_1260');
INSERT INTO CONTRACTE_INCHIRIERE(ID_contract, ID_client, Inceput_contract, Final_contract, ID_camera)VALUES
    (CONTRACTE_IE_ID_contract_SEQ.nextval,14,TO_DATE('5/11/2022','DD/MM/YYYY'),TO_DATE('5/11/2023','DD/MM/YYYY'),'9_M1_1260');
INSERT INTO CONTRACTE_INCHIRIERE(ID_contract, ID_client, Inceput_contract, Final_contract, ID_camera)VALUES
    (CONTRACTE_IE_ID_contract_SEQ.nextval,15,TO_DATE('5/11/2022','DD/MM/YYYY'),TO_DATE('5/11/2023','DD/MM/YYYY'),'10_M1_1260');
INSERT INTO CONTRACTE_INCHIRIERE(ID_contract, ID_client, Inceput_contract, Final_contract, ID_camera)VALUES
    (CONTRACTE_IE_ID_contract_SEQ.nextval,16,TO_DATE('17/11/2022','DD/MM/YYYY'),TO_DATE('17/11/2023','DD/MM/YYYY'),'1_M2_2750');
INSERT INTO CONTRACTE_INCHIRIERE(ID_contract, ID_client, Inceput_contract, Final_contract, ID_camera)VALUES
    (CONTRACTE_IE_ID_contract_SEQ.nextval,17,TO_DATE('17/11/2022','DD/MM/YYYY'),TO_DATE('17/11/2023','DD/MM/YYYY'),'40_M1_836');
INSERT INTO CONTRACTE_INCHIRIERE(ID_contract, ID_client, Inceput_contract, Final_contract, ID_camera)VALUES
    (CONTRACTE_IE_ID_contract_SEQ.nextval,18,TO_DATE('05/12/2022','DD/MM/YYYY'),TO_DATE('05/12/2023','DD/MM/YYYY'),'23_M1_836');
INSERT INTO CONTRACTE_INCHIRIERE(ID_contract, ID_client, Inceput_contract, Final_contract, ID_camera)VALUES
    (CONTRACTE_IE_ID_contract_SEQ.nextval,19,TO_DATE('05/12/2022','DD/MM/YYYY'),TO_DATE('05/12/2023','DD/MM/YYYY'),'21_M1_836');
INSERT INTO CONTRACTE_INCHIRIERE(ID_contract, ID_client, Inceput_contract, Final_contract, ID_camera)VALUES
    (CONTRACTE_IE_ID_contract_SEQ.nextval,20,TO_DATE('06/12/2022','DD/MM/YYYY'),TO_DATE('06/12/2023','DD/MM/YYYY'),'21_M1_836');
INSERT INTO CONTRACTE_INCHIRIERE(ID_contract, ID_client, Inceput_contract, Final_contract, ID_camera)VALUES
    (CONTRACTE_IE_ID_contract_SEQ.nextval,21,TO_DATE('06/12/2022','DD/MM/YYYY'),TO_DATE('06/12/2023','DD/MM/YYYY'),'35_M1_836');
INSERT INTO CONTRACTE_INCHIRIERE(ID_contract, ID_client, Inceput_contract, Final_contract, ID_camera)VALUES
    (CONTRACTE_IE_ID_contract_SEQ.nextval,22,TO_DATE('08/12/2022','DD/MM/YYYY'),TO_DATE('08/12/2023','DD/MM/YYYY'),'4_M3_1170');
INSERT INTO CONTRACTE_INCHIRIERE(ID_contract, ID_client, Inceput_contract, Final_contract, ID_camera)VALUES
    (CONTRACTE_IE_ID_contract_SEQ.nextval,23,TO_DATE('10/12/2022','DD/MM/YYYY'),TO_DATE('10/12/2023','DD/MM/YYYY'),'13_M3_1170');


---STERGERE TABELE + SEQUENCES---
DROP SEQUENCE CONTRACTE_IE_ID_contract_SEQ;
ALTER TABLE CONTRACTE_INCHIRIERE
DROP CONSTRAINT CONTRACTE_IE_ID_CAMERA_FK
DROP CONSTRAINT CONTRACTE_IE_ID_client_FK;
DROP TABLE CONTRACTE_INCHIRIERE;


DROP SEQUENCE CLIENTI_ID_client_SEQ;
DROP TABLE CLIENTI;

DROP SEQUENCE ANGAJATI_ID_angajat_SEQ;
ALTER TABLE ANGAJATI
DROP CONSTRAINT ANGAJATI_ID_campus_FK
DROP CONSTRAINT ANGAJATI_ID_departament_FK;
DROP TABLE ANGAJATI;

DROP TABLE DEPARTAMENTE;

ALTER TABLE CAMERE
DROP CONSTRAINT CAMERE_ID_cladire_FK
DROP CONSTRAINT CAMERE_ID_tip_FK;
DROP TABLE CAMERE;

DROP TABLE TIP_CAMERA;

ALTER TABLE CLADIRE
DROP CONSTRAINT CLADIRE_ID_campus_FK;
DROP TABLE CLADIRE;

DROP TABLE CAMPUS;



















