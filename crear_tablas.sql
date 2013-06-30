DROP TABLE TRABAJA_COMO_ESPECIALISTA CASCADE CONSTRAINTS;

CREATE TABLE TRABAJA_COMO_ESPECIALISTA (
       codigo_E             INTEGER NOT NULL,
       aldea_lab            VARCHAR2(20) NOT NULL,
       codigo_lab           INTEGER NOT NULL,
       CHECK (codigo_E>'0'),
       CHECK (codigo_lab>'0')	
);


ALTER TABLE TRABAJA_COMO_ESPECIALISTA
       ADD  ( PRIMARY KEY (codigo_E, aldea_lab, codigo_lab) ) ;


DROP TABLE SOBORNA CASCADE CONSTRAINTS;

CREATE TABLE SOBORNA (
       cod_campesino        INTEGER NOT NULL,
       cod_espia            INTEGER NOT NULL,
       n_sobornos_a_campesino INTEGER NOT NULL,
       CHECK (cod_campesino>'0'),
       CHECK (cod_espia>'0'),	
       CHECK (n_sobornos_a_campesino>='0')
);

ALTER TABLE SOBORNA
       ADD  ( PRIMARY KEY (cod_campesino, cod_espia) ) ;


DROP TABLE CAPTURA CASCADE CONSTRAINTS;

CREATE TABLE CAPTURA (
       cod_P                INTEGER NOT NULL,
       codigo_E             INTEGER NOT NULL,
       CHECK (cod_P>'0'),
       CHECK (codigo_E>'0')
);


ALTER TABLE CAPTURA
       ADD  ( PRIMARY KEY (cod_P, codigo_E) ) ;


DROP TABLE SICARIO CASCADE CONSTRAINTS;

CREATE TABLE SICARIO (
       codigo_E             INTEGER NOT NULL,
       apodo                VARCHAR2(20) NOT NULL,
       CHECK (codigo_E>'0')
);


ALTER TABLE SICARIO
       ADD  ( PRIMARY KEY (codigo_E) ) ;


DROP TABLE POLICIA CASCADE CONSTRAINTS;

CREATE TABLE POLICIA (
       cod_P                INTEGER NOT NULL,
       nombre               VARCHAR2(20) NULL,
       edad                 INTEGER NULL,
       descripcion          VARCHAR2(20) NULL,
       CHECK (cod_P>'0')
);


ALTER TABLE POLICIA
       ADD  ( PRIMARY KEY (cod_P) ) ;


DROP TABLE DISTRIBUYE_EN CASCADE CONSTRAINTS;

CREATE TABLE DISTRIBUYE_EN (
       distribuidor         INTEGER NOT NULL,
       pais                 VARCHAR2(20) NOT NULL,
       cHECK (distribuidor>'0')	
);


ALTER TABLE DISTRIBUYE_EN
       ADD  ( PRIMARY KEY (distribuidor, pais) ) ;


DROP TABLE PAIS CASCADE CONSTRAINTS;

CREATE TABLE PAIS (
       nombre_pais          VARCHAR2(20) NOT NULL
);


ALTER TABLE PAIS
       ADD  ( PRIMARY KEY (nombre_pais) ) ;


DROP TABLE CELDA CASCADE CONSTRAINTS;

CREATE TABLE CELDA (
       codigo_lab           INTEGER NOT NULL,
       cod_celda            INTEGER NOT NULL,
       aldea_lab            VARCHAR2(20) NOT NULL,
       metros               INTEGER NOT NULL,
       cod_P                INTEGER NOT NULL,
       CHECK (codigo_lab>'0'),
       CHECK (cod_celda>'0'),	
       CHECK (metros BETWEEN 1 AND 8),
       CHECK (cod_P>'0')
);


ALTER TABLE CELDA
       ADD  ( PRIMARY KEY (codigo_lab, cod_celda, aldea_lab) ) ;


DROP TABLE DENUNCIA CASCADE CONSTRAINTS;

CREATE TABLE DENUNCIA (
       cod_espia            INTEGER NOT NULL,
       codigo_campesino     INTEGER NOT NULL,
       codigo_especialista  INTEGER NOT NULL,
       CHECK (cod_espia>'0'),
       CHECK (codigo_campesino>'0'),
       CHECK (codigo_especialista>'0')	
);


ALTER TABLE DENUNCIA
       ADD  ( PRIMARY KEY (cod_espia, codigo_campesino, 
              codigo_especialista) ) ;


DROP TABLE CAMPESINO CASCADE CONSTRAINTS;

CREATE TABLE CAMPESINO (
       codigo_E             INTEGER NOT NULL,
       laboratorio          VARCHAR2(20) NOT NULL,
       codigo_labo          INTEGER NOT NULL,
       aldea_labo           VARCHAR2(20) NOT NULL,
       CHECK (codigo_E>'0'),
       CHECK (codigo_labo>'0'),	
       CHECK (laboratorio=aldea_labo)
);


ALTER TABLE CAMPESINO
       ADD  ( PRIMARY KEY (codigo_E) ) ;


DROP TABLE LABORATORIO CASCADE CONSTRAINTS;

CREATE TABLE LABORATORIO (
       aldea_lab            VARCHAR2(20) NOT NULL,
       codigo_lab           INTEGER NOT NULL,
       kg_mes               INTEGER NOT NULL,
       responsable          VARCHAR2(20) NOT NULL,
       CHECK (codigo_lab>'0'),
       CHECK (kg_mes>'0')
);


ALTER TABLE LABORATORIO
       ADD  ( PRIMARY KEY (aldea_lab, codigo_lab) ) ;


DROP TABLE GEOAN CASCADE CONSTRAINTS;

CREATE TABLE GEOAN (
       cod_P                INTEGER NOT NULL,
       categoria            INTEGER NOT NULL,
       jefe                 VARCHAR2(20) NULL,
       sicario              VARCHAR2(20) NULL,
       CHECK (cod_P>'0'),
       CHECK (categoria BETWEEN 1 AND 3)
);


ALTER TABLE GEOAN
       ADD  ( PRIMARY KEY (cod_P) ) ;


DROP TABLE ESPIA CASCADE CONSTRAINTS;

CREATE TABLE ESPIA (
       cod_P                INTEGER NOT NULL,
       n_sobornos_total     INTEGER NOT NULL,
       CHECK (cod_P>'0'),
       CHECK (n_sobornos_total>='0')
);


ALTER TABLE ESPIA
       ADD  ( PRIMARY KEY (cod_P) ) ;


DROP TABLE ESPECIALISTA CASCADE CONSTRAINTS;

CREATE TABLE ESPECIALISTA (
       codigo_E             INTEGER NOT NULL,
       rama_e               VARCHAR2(20) NOT NULL,
       aldea_esp            VARCHAR2(20) NOT NULL,
       CHECK (codigo_E>'0')
);


ALTER TABLE ESPECIALISTA
       ADD  ( PRIMARY KEY (codigo_E) ) ;


DROP TABLE EMPLEADO_LABORATORIO CASCADE CONSTRAINTS;

CREATE TABLE EMPLEADO_LABORATORIO (
       codigo_E             INTEGER NOT NULL,
       nombre               VARCHAR2(20) NOT NULL,
       apellido             VARCHAR2(20) NOT NULL,
       CHECK (codigo_E>'0')
);


ALTER TABLE EMPLEADO_LABORATORIO
       ADD  ( PRIMARY KEY (codigo_E) ) ;


DROP TABLE EMPLEADO CASCADE CONSTRAINTS;

CREATE TABLE EMPLEADO (
       codigo_E             INTEGER NOT NULL,
       CHECK (codigo_E>'0')
);


ALTER TABLE EMPLEADO
       ADD  ( PRIMARY KEY (codigo_E) ) ;


DROP TABLE DISTRIBUIDOR CASCADE CONSTRAINTS;

CREATE TABLE DISTRIBUIDOR (
       codigo_E             INTEGER NOT NULL,
       nombre               VARCHAR2(20) NOT NULL,
       telefono             VARCHAR2(20) NOT NULL,
       CHECK (codigo_E>'0')
);


ALTER TABLE DISTRIBUIDOR
       ADD  ( PRIMARY KEY (codigo_E) ) ;


DROP TABLE ALDEA CASCADE CONSTRAINTS;

CREATE TABLE ALDEA (
       aldea                VARCHAR2(20) NOT NULL,
       localizacion         VARCHAR2(20) NOT NULL,
       num_hab              INTEGER NULL,
       CHECK (num_hab>='0')
);


ALTER TABLE ALDEA
       ADD  ( PRIMARY KEY (aldea) ) ;


ALTER TABLE TRABAJA_COMO_ESPECIALISTA
       ADD  ( FOREIGN KEY (codigo_E)
                             REFERENCES ESPECIALISTA
                             ON DELETE SET NULL ) ;


ALTER TABLE TRABAJA_COMO_ESPECIALISTA
       ADD  ( FOREIGN KEY (aldea_lab, codigo_lab)
                             REFERENCES LABORATORIO
                             ON DELETE SET NULL ) ;


ALTER TABLE SOBORNA
       ADD  ( FOREIGN KEY (cod_espia)
                             REFERENCES ESPIA
                             ON DELETE SET NULL ) ;


ALTER TABLE SOBORNA
       ADD  ( FOREIGN KEY (cod_campesino)
                             REFERENCES CAMPESINO
                             ON DELETE SET NULL ) ;


ALTER TABLE CAPTURA
       ADD  ( FOREIGN KEY (cod_P)
                             REFERENCES GEOAN
                             ON DELETE SET NULL ) ;


ALTER TABLE CAPTURA
       ADD  ( FOREIGN KEY (codigo_E)
                             REFERENCES SICARIO
                             ON DELETE SET NULL ) ;


ALTER TABLE SICARIO
       ADD  ( FOREIGN KEY (codigo_E)
                             REFERENCES EMPLEADO
                             ON DELETE CASCADE ) ;


ALTER TABLE DISTRIBUYE_EN
       ADD  ( FOREIGN KEY (distribuidor)
                             REFERENCES DISTRIBUIDOR
                             ON DELETE SET NULL ) ;


ALTER TABLE DISTRIBUYE_EN
       ADD  ( FOREIGN KEY (pais)
                             REFERENCES PAIS
                             ON DELETE SET NULL ) ;


ALTER TABLE CELDA
       ADD  ( FOREIGN KEY (aldea_lab, codigo_lab)
                             REFERENCES LABORATORIO ) ;


ALTER TABLE CELDA
       ADD  ( FOREIGN KEY (cod_P)
                             REFERENCES ESPIA ) ;


ALTER TABLE DENUNCIA
       ADD  ( FOREIGN KEY (cod_espia)
                             REFERENCES ESPIA
                             ON DELETE SET NULL ) ;


ALTER TABLE DENUNCIA
       ADD  ( FOREIGN KEY (codigo_campesino)
                             REFERENCES CAMPESINO
                             ON DELETE SET NULL ) ;


ALTER TABLE DENUNCIA
       ADD  ( FOREIGN KEY (codigo_especialista)
                             REFERENCES ESPECIALISTA
                             ON DELETE SET NULL ) ;


ALTER TABLE CAMPESINO
       ADD  ( FOREIGN KEY (codigo_E)
                             REFERENCES EMPLEADO_LABORATORIO
                             ON DELETE CASCADE ) ;


ALTER TABLE CAMPESINO
       ADD  ( FOREIGN KEY (aldea_labo)
                             REFERENCES ALDEA ) ;


ALTER TABLE CAMPESINO
       ADD  ( FOREIGN KEY (aldea_labo, codigo_labo)
                             REFERENCES LABORATORIO ) ;


ALTER TABLE LABORATORIO
       ADD  ( FOREIGN KEY (aldea_lab)
                             REFERENCES ALDEA ) ;


ALTER TABLE GEOAN
       ADD  ( FOREIGN KEY (cod_P)
                             REFERENCES POLICIA
                             ON DELETE CASCADE ) ;


ALTER TABLE ESPIA
       ADD  ( FOREIGN KEY (cod_P)
                             REFERENCES POLICIA
                             ON DELETE CASCADE ) ;


ALTER TABLE ESPECIALISTA
       ADD  ( FOREIGN KEY (codigo_E)
                             REFERENCES EMPLEADO_LABORATORIO
                             ON DELETE CASCADE ) ;


ALTER TABLE ESPECIALISTA
       ADD  ( FOREIGN KEY (aldea_esp)
                             REFERENCES ALDEA ) ;


ALTER TABLE EMPLEADO_LABORATORIO
       ADD  ( FOREIGN KEY (codigo_E)
                             REFERENCES EMPLEADO
                             ON DELETE CASCADE ) ;


ALTER TABLE DISTRIBUIDOR
       ADD  ( FOREIGN KEY (codigo_E)
                             REFERENCES EMPLEADO
                             ON DELETE CASCADE ) ;