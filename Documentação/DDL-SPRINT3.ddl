CREATE TABLE ito1.dispositivo (
    id_dispositivo NUMBER NOT NULL,
    codigo         VARCHAR2(15 BYTE),
    nome           VARCHAR2(200 BYTE),
    tipo           VARCHAR2(100 BYTE),
    status         NUMBER(1),
    id_usuario     NUMBER
);

CREATE UNIQUE INDEX ito1.idx_dispositivo_codigo ON
    ito1.dispositivo (
        codigo
    ASC );

CREATE INDEX ito1.idx_dispositivo_codigo_user ON
    ito1.dispositivo (
        codigo
    ASC,
        id_usuario
    ASC );

ALTER TABLE ito1.dispositivo ADD CONSTRAINT dispositivo_pk PRIMARY KEY ( id_dispositivo );

CREATE TABLE ito1.localizacao (
    id_localizacao  VARCHAR2(38 BYTE) NOT NULL,
    latitude        NUMBER,
    longitude       NUMBER,
    data_hora       TIMESTAMP,
    data_referencia DATE,
    id_dispositivo  NUMBER
);

CREATE INDEX ito1.idx_localizacao_disp_ref ON
    ito1.localizacao (
        id_dispositivo
    ASC,
        data_referencia
    ASC );

ALTER TABLE ito1.localizacao ADD CONSTRAINT localizacao_pk PRIMARY KEY ( id_localizacao );

CREATE TABLE ito1.login (
    id    NUMBER NOT NULL,
    nome  VARCHAR2(200 BYTE) NOT NULL,
    email VARCHAR2(200 BYTE) NOT NULL,
    senha VARCHAR2(500 BYTE) NOT NULL
);

ALTER TABLE ito1.login ADD CONSTRAINT login_pk PRIMARY KEY ( id );

ALTER TABLE ito1.login ADD CONSTRAINT login_email_un UNIQUE ( email );

CREATE TABLE ito1.sessao_geometrica (
    id_sessao        NUMBER(*, 0) NOT NULL,
    nome             VARCHAR2(50 BYTE),
    status           NUMBER(1),
    tipo             VARCHAR2(10 BYTE),
    longitude_centro NUMBER(17, 15),
    latitude_centro  NUMBER(17, 15),
    raio             NUMBER(25, 15)
);

ALTER TABLE ito1.sessao_geometrica
    ADD CHECK ( status IN ( 0, 1 ) );

CREATE INDEX eduardo.idx_nome_sessao ON
    ito1.sessao_geometrica ( nlssort("NOME", 'nls_sort=''BINARY_AI''') );

ALTER TABLE ito1.sessao_geometrica ADD CONSTRAINT sessao_geometrica_pk PRIMARY KEY ( id_sessao );

CREATE TABLE ito1.usuario (
    id_usuario NUMBER NOT NULL,
    nome       VARCHAR2(200 BYTE),
    cargo      VARCHAR2(100 BYTE),
    senha      VARCHAR2(500 BYTE),
    cpf        VARCHAR2(11 BYTE)
);

CREATE INDEX ito1.idx_usuario_login ON
    ito1.usuario (
        cpf
    ASC,
        senha
    ASC );

ALTER TABLE ito1.usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( id_usuario );

ALTER TABLE ito1.localizacao
    ADD CONSTRAINT fk_id_dispositivo
        FOREIGN KEY ( id_dispositivo )
            REFERENCES ito1.dispositivo ( id_dispositivo )
                ON DELETE CASCADE;

ALTER TABLE ito1.dispositivo
    ADD CONSTRAINT fk_id_usuario
        FOREIGN KEY ( id_usuario )
            REFERENCES ito1.usuario ( id_usuario );

CREATE SEQUENCE ito1.seq_iddispositivo START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER ito1.trg_iddispositivo BEFORE
    INSERT ON ito1.dispositivo
    FOR EACH ROW
    WHEN ( new.id_dispositivo IS NULL )
BEGIN
    :new.id_dispositivo := ito1.seq_iddispositivo.nextval;
END;
/

CREATE SEQUENCE ito1.login_id_seq START WITH 1 CACHE 20;

CREATE OR REPLACE TRIGGER ito1.login_id_trg BEFORE
    INSERT ON ito1.login
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := ito1.login_id_seq.nextval;
END;
/

CREATE SEQUENCE ito1.seq_id_sessao START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER ito1.trg_id_sessao BEFORE
    INSERT ON ito1.sessao_geometrica
    FOR EACH ROW
    WHEN ( new.id_sessao IS NULL )
BEGIN
    :new.id_sessao := ito1.seq_id_sessao.nextval;
END;
/