--------------------------------------------------------
--  Arquivo criado - sábado-setembro-28-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_IDDISPOSITIVO
--------------------------------------------------------

   CREATE SEQUENCE  "ITO1"."SEQ_IDDISPOSITIVO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 35 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table DISPOSITIVO
--------------------------------------------------------

  CREATE TABLE "ITO1"."DISPOSITIVO" 
   (	"ID_DISPOSITIVO" NUMBER, 
	"CODIGO" VARCHAR2(15 BYTE) COLLATE "USING_NLS_COMP", 
	"NOME" VARCHAR2(200 BYTE) COLLATE "USING_NLS_COMP", 
	"TIPO" VARCHAR2(100 BYTE) COLLATE "USING_NLS_COMP", 
	"STATUS" NUMBER(1,0), 
	"ID_USUARIO" NUMBER
   )  DEFAULT COLLATION "USING_NLS_COMP" ;
--------------------------------------------------------
--  DDL for Table LOCALIZACAO
--------------------------------------------------------

  CREATE TABLE "ITO1"."LOCALIZACAO" 
   (	"ID_LOCALIZACAO" VARCHAR2(38 BYTE) COLLATE "USING_NLS_COMP", 
	"LONGITUDE" NUMBER, 
	"LATITUDE" NUMBER, 
	"DATA_HORA" TIMESTAMP (6), 
	"DATA_REFERENCIA" DATE, 
	"ID_DISPOSITIVO" NUMBER
   )  DEFAULT COLLATION "USING_NLS_COMP" 
  PARTITION BY RANGE ("DATA_REFERENCIA") INTERVAL (INTERVAL '1' DAY) 
  SUBPARTITION BY LIST ("ID_DISPOSITIVO") 
  SUBPARTITION TEMPLATE ( 
    SUBPARTITION "SUBP_1" VALUES ( 1 ), 
    SUBPARTITION "SUBP_2" VALUES ( 2 ), 
    SUBPARTITION "SUBP_3" VALUES ( 3 ), 
    SUBPARTITION "SUBP_4" VALUES ( 4 ), 
    SUBPARTITION "SUBP_5" VALUES ( 5 ), 
    SUBPARTITION "SUBP_6" VALUES ( 6 ), 
    SUBPARTITION "SUBP_7" VALUES ( 7 ), 
    SUBPARTITION "SUBP_8" VALUES ( 8 ), 
    SUBPARTITION "SUBP_9" VALUES ( 9 ), 
    SUBPARTITION "SUBP_10" VALUES ( 10 ), 
    SUBPARTITION "SUBP_11" VALUES ( 11 ), 
    SUBPARTITION "SUBP_12" VALUES ( 12 ), 
    SUBPARTITION "SUBP_13" VALUES ( 13 ), 
    SUBPARTITION "SUBP_14" VALUES ( 14 ), 
    SUBPARTITION "SUBP_15" VALUES ( 15 ), 
    SUBPARTITION "SUBP_16" VALUES ( 16 ), 
    SUBPARTITION "SUBP_17" VALUES ( 17 ), 
    SUBPARTITION "SUBP_18" VALUES ( 18 ), 
    SUBPARTITION "SUBP_19" VALUES ( 19 ), 
    SUBPARTITION "SUBP_20" VALUES ( 20 ), 
    SUBPARTITION "SUBP_21" VALUES ( 21 ), 
    SUBPARTITION "SUBP_22" VALUES ( 22 ), 
    SUBPARTITION "SUBP_23" VALUES ( 23 ), 
    SUBPARTITION "SUBP_24" VALUES ( 24 ), 
    SUBPARTITION "SUBP_25" VALUES ( 25 ), 
    SUBPARTITION "SUBP_26" VALUES ( 26 ), 
    SUBPARTITION "SUBP_27" VALUES ( 27 ), 
    SUBPARTITION "SUBP_28" VALUES ( 28 ), 
    SUBPARTITION "SUBP_29" VALUES ( 29 ), 
    SUBPARTITION "SUBP_30" VALUES ( 30 ), 
    SUBPARTITION "SUBP_31" VALUES ( 31 ), 
    SUBPARTITION "SUBP_32" VALUES ( 32 ), 
    SUBPARTITION "SUBP_33" VALUES ( 33 ), 
    SUBPARTITION "SUBP_34" VALUES ( 34 ), 
    SUBPARTITION "SUBP_35" VALUES ( 35 ), 
    SUBPARTITION "SUBP_36" VALUES ( 36 ), 
    SUBPARTITION "SUBP_37" VALUES ( 37 ), 
    SUBPARTITION "SUBP_38" VALUES ( 38 ), 
    SUBPARTITION "SUBP_39" VALUES ( 39 ), 
    SUBPARTITION "SUBP_40" VALUES ( 40 ), 
    SUBPARTITION "SUBP_41" VALUES ( 41 ), 
    SUBPARTITION "SUBP_42" VALUES ( 42 ), 
    SUBPARTITION "SUBP_43" VALUES ( 43 ), 
    SUBPARTITION "SUBP_44" VALUES ( 44 ), 
    SUBPARTITION "SUBP_45" VALUES ( 45 ), 
    SUBPARTITION "SUBP_46" VALUES ( 46 ), 
    SUBPARTITION "SUBP_47" VALUES ( 47 ), 
    SUBPARTITION "SUBP_48" VALUES ( 48 ), 
    SUBPARTITION "SUBP_49" VALUES ( 49 ), 
    SUBPARTITION "SUBP_50" VALUES ( 50 ) ) 
 (PARTITION "P1"  VALUES LESS THAN (TO_DATE(' 2000-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) ) ;
--------------------------------------------------------
--  DDL for Table USUARIO
--------------------------------------------------------

  CREATE TABLE "ITO1"."USUARIO" 
   (	"ID_USUARIO" NUMBER, 
	"NOME" VARCHAR2(200 BYTE) COLLATE "USING_NLS_COMP", 
	"CARGO" VARCHAR2(100 BYTE) COLLATE "USING_NLS_COMP", 
	"SENHA" VARCHAR2(500 BYTE) COLLATE "USING_NLS_COMP", 
	"CPF" VARCHAR2(11 BYTE) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" ;
--------------------------------------------------------
--  DDL for Index IDX_DISPOSITIVO_CODIGO
--------------------------------------------------------

  CREATE UNIQUE INDEX "ITO1"."IDX_DISPOSITIVO_CODIGO" ON "ITO1"."DISPOSITIVO" ("CODIGO") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_DISPOSITIVO_CODIGO_USER
--------------------------------------------------------

  CREATE INDEX "ITO1"."IDX_DISPOSITIVO_CODIGO_USER" ON "ITO1"."DISPOSITIVO" ("CODIGO", "ID_USUARIO") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_LOCALIZACAO_DISP
--------------------------------------------------------

  CREATE INDEX "ITO1"."IDX_LOCALIZACAO_DISP" ON "ITO1"."LOCALIZACAO" ("ID_DISPOSITIVO", "DATA_REFERENCIA", "DATA_HORA") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_LOCALIZACAO_DISP_REF
--------------------------------------------------------

  CREATE INDEX "ITO1"."IDX_LOCALIZACAO_DISP_REF" ON "ITO1"."LOCALIZACAO" ("ID_DISPOSITIVO", "DATA_REFERENCIA") 
   LOCAL
 (PARTITION "P1" NOCOMPRESS 
 ( SUBPARTITION "P1_SUBP_1" , 
  SUBPARTITION "P1_SUBP_2" , 
  SUBPARTITION "P1_SUBP_3" , 
  SUBPARTITION "P1_SUBP_4" , 
  SUBPARTITION "P1_SUBP_5" , 
  SUBPARTITION "P1_SUBP_6" , 
  SUBPARTITION "P1_SUBP_7" , 
  SUBPARTITION "P1_SUBP_8" , 
  SUBPARTITION "P1_SUBP_9" , 
  SUBPARTITION "P1_SUBP_10" , 
  SUBPARTITION "P1_SUBP_11" , 
  SUBPARTITION "P1_SUBP_12" , 
  SUBPARTITION "P1_SUBP_13" , 
  SUBPARTITION "P1_SUBP_14" , 
  SUBPARTITION "P1_SUBP_15" , 
  SUBPARTITION "P1_SUBP_16" , 
  SUBPARTITION "P1_SUBP_17" , 
  SUBPARTITION "P1_SUBP_18" , 
  SUBPARTITION "P1_SUBP_19" , 
  SUBPARTITION "P1_SUBP_20" , 
  SUBPARTITION "P1_SUBP_21" , 
  SUBPARTITION "P1_SUBP_22" , 
  SUBPARTITION "P1_SUBP_23" , 
  SUBPARTITION "P1_SUBP_24" , 
  SUBPARTITION "P1_SUBP_25" , 
  SUBPARTITION "P1_SUBP_26" , 
  SUBPARTITION "P1_SUBP_27" , 
  SUBPARTITION "P1_SUBP_28" , 
  SUBPARTITION "P1_SUBP_29" , 
  SUBPARTITION "P1_SUBP_30" , 
  SUBPARTITION "P1_SUBP_31" , 
  SUBPARTITION "P1_SUBP_32" , 
  SUBPARTITION "P1_SUBP_33" , 
  SUBPARTITION "P1_SUBP_34" , 
  SUBPARTITION "P1_SUBP_35" , 
  SUBPARTITION "P1_SUBP_36" , 
  SUBPARTITION "P1_SUBP_37" , 
  SUBPARTITION "P1_SUBP_38" , 
  SUBPARTITION "P1_SUBP_39" , 
  SUBPARTITION "P1_SUBP_40" , 
  SUBPARTITION "P1_SUBP_41" , 
  SUBPARTITION "P1_SUBP_42" , 
  SUBPARTITION "P1_SUBP_43" , 
  SUBPARTITION "P1_SUBP_44" , 
  SUBPARTITION "P1_SUBP_45" , 
  SUBPARTITION "P1_SUBP_46" , 
  SUBPARTITION "P1_SUBP_47" , 
  SUBPARTITION "P1_SUBP_48" , 
  SUBPARTITION "P1_SUBP_49" , 
  SUBPARTITION "P1_SUBP_50" ) ) ;
--------------------------------------------------------
--  DDL for Index IDX_DISPOSITIVO_CODIGO_USER
--------------------------------------------------------

  CREATE INDEX "ITO1"."IDX_DISPOSITIVO_CODIGO_USER" ON "ITO1"."DISPOSITIVO" ("CODIGO", "ID_USUARIO") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_DISPOSITIVO_CODIGO
--------------------------------------------------------

  CREATE UNIQUE INDEX "ITO1"."IDX_DISPOSITIVO_CODIGO" ON "ITO1"."DISPOSITIVO" ("CODIGO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C0022911
--------------------------------------------------------

  CREATE UNIQUE INDEX "ITO1"."SYS_C0022911" ON "ITO1"."DISPOSITIVO" ("ID_DISPOSITIVO") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_LOCALIZACAO_DISP_REF
--------------------------------------------------------

  CREATE INDEX "ITO1"."IDX_LOCALIZACAO_DISP_REF" ON "ITO1"."LOCALIZACAO" ("ID_DISPOSITIVO", "DATA_REFERENCIA") 
   LOCAL
 (PARTITION "P1" NOCOMPRESS 
 ( SUBPARTITION "P1_SUBP_1" , 
  SUBPARTITION "P1_SUBP_2" , 
  SUBPARTITION "P1_SUBP_3" , 
  SUBPARTITION "P1_SUBP_4" , 
  SUBPARTITION "P1_SUBP_5" , 
  SUBPARTITION "P1_SUBP_6" , 
  SUBPARTITION "P1_SUBP_7" , 
  SUBPARTITION "P1_SUBP_8" , 
  SUBPARTITION "P1_SUBP_9" , 
  SUBPARTITION "P1_SUBP_10" , 
  SUBPARTITION "P1_SUBP_11" , 
  SUBPARTITION "P1_SUBP_12" , 
  SUBPARTITION "P1_SUBP_13" , 
  SUBPARTITION "P1_SUBP_14" , 
  SUBPARTITION "P1_SUBP_15" , 
  SUBPARTITION "P1_SUBP_16" , 
  SUBPARTITION "P1_SUBP_17" , 
  SUBPARTITION "P1_SUBP_18" , 
  SUBPARTITION "P1_SUBP_19" , 
  SUBPARTITION "P1_SUBP_20" , 
  SUBPARTITION "P1_SUBP_21" , 
  SUBPARTITION "P1_SUBP_22" , 
  SUBPARTITION "P1_SUBP_23" , 
  SUBPARTITION "P1_SUBP_24" , 
  SUBPARTITION "P1_SUBP_25" , 
  SUBPARTITION "P1_SUBP_26" , 
  SUBPARTITION "P1_SUBP_27" , 
  SUBPARTITION "P1_SUBP_28" , 
  SUBPARTITION "P1_SUBP_29" , 
  SUBPARTITION "P1_SUBP_30" , 
  SUBPARTITION "P1_SUBP_31" , 
  SUBPARTITION "P1_SUBP_32" , 
  SUBPARTITION "P1_SUBP_33" , 
  SUBPARTITION "P1_SUBP_34" , 
  SUBPARTITION "P1_SUBP_35" , 
  SUBPARTITION "P1_SUBP_36" , 
  SUBPARTITION "P1_SUBP_37" , 
  SUBPARTITION "P1_SUBP_38" , 
  SUBPARTITION "P1_SUBP_39" , 
  SUBPARTITION "P1_SUBP_40" , 
  SUBPARTITION "P1_SUBP_41" , 
  SUBPARTITION "P1_SUBP_42" , 
  SUBPARTITION "P1_SUBP_43" , 
  SUBPARTITION "P1_SUBP_44" , 
  SUBPARTITION "P1_SUBP_45" , 
  SUBPARTITION "P1_SUBP_46" , 
  SUBPARTITION "P1_SUBP_47" , 
  SUBPARTITION "P1_SUBP_48" , 
  SUBPARTITION "P1_SUBP_49" , 
  SUBPARTITION "P1_SUBP_50" ) ) ;
--------------------------------------------------------
--  DDL for Index IDX_LOCALIZACAO_DISP
--------------------------------------------------------

  CREATE INDEX "ITO1"."IDX_LOCALIZACAO_DISP" ON "ITO1"."LOCALIZACAO" ("ID_DISPOSITIVO", "DATA_REFERENCIA", "DATA_HORA") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C0022913
--------------------------------------------------------

  CREATE UNIQUE INDEX "ITO1"."SYS_C0022913" ON "ITO1"."LOCALIZACAO" ("ID_LOCALIZACAO") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_USUARIO_LOGIN
--------------------------------------------------------

  CREATE INDEX "ITO1"."IDX_USUARIO_LOGIN" ON "ITO1"."USUARIO" ("CPF", "SENHA") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C0022910
--------------------------------------------------------

  CREATE UNIQUE INDEX "ITO1"."SYS_C0022910" ON "ITO1"."USUARIO" ("ID_USUARIO") 
  ;
--------------------------------------------------------
--  DDL for Trigger TRG_IDDISPOSITIVO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ITO1"."TRG_IDDISPOSITIVO" 
BEFORE INSERT ON ITO1.dispositivo
FOR EACH ROW
BEGIN
    IF :new.id_dispositivo IS NULL THEN
        SELECT ITO1.seq_idDispositivo.NEXTVAL INTO :new.id_dispositivo FROM dual;
    END IF;
END;
/
ALTER TRIGGER "ITO1"."TRG_IDDISPOSITIVO" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_IDDISPOSITIVO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ITO1"."TRG_IDDISPOSITIVO" 
BEFORE INSERT ON ITO1.dispositivo
FOR EACH ROW
BEGIN
    IF :new.id_dispositivo IS NULL THEN
        SELECT ITO1.seq_idDispositivo.NEXTVAL INTO :new.id_dispositivo FROM dual;
    END IF;
END;
/
ALTER TRIGGER "ITO1"."TRG_IDDISPOSITIVO" ENABLE;
--------------------------------------------------------
--  DDL for Procedure CREATE_USER_WITH_QUOTA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ADMIN"."CREATE_USER_WITH_QUOTA" (
    p_username IN VARCHAR2,
    p_password IN VARCHAR2
) IS
BEGIN
    -- Criar o usuário
    EXECUTE IMMEDIATE 'CREATE USER ' || p_username || ' IDENTIFIED BY "' || p_password || '"';

    -- Conceder a role 'dev_inine' ao usuário
    EXECUTE IMMEDIATE 'GRANT dev_inine TO ' || p_username;

    -- Definir a cota ilimitada no tablespace 'data'
    EXECUTE IMMEDIATE 'ALTER USER ' || p_username || ' QUOTA UNLIMITED ON data';

    DBMS_OUTPUT.PUT_LINE('Usuário ' || p_username || ' criado com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao criar o usuário: ' || SQLERRM);
END;

/
--------------------------------------------------------
--  Constraints for Table DISPOSITIVO
--------------------------------------------------------

  ALTER TABLE "ITO1"."DISPOSITIVO" ADD PRIMARY KEY ("ID_DISPOSITIVO")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table LOCALIZACAO
--------------------------------------------------------

  ALTER TABLE "ITO1"."LOCALIZACAO" ADD PRIMARY KEY ("ID_LOCALIZACAO")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table USUARIO
--------------------------------------------------------

  ALTER TABLE "ITO1"."USUARIO" ADD PRIMARY KEY ("ID_USUARIO")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DISPOSITIVO
--------------------------------------------------------

  ALTER TABLE "ITO1"."DISPOSITIVO" ADD CONSTRAINT "FK_ID_USUARIO" FOREIGN KEY ("ID_USUARIO")
	  REFERENCES "ITO1"."USUARIO" ("ID_USUARIO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table LOCALIZACAO
--------------------------------------------------------

  ALTER TABLE "ITO1"."LOCALIZACAO" ADD CONSTRAINT "FK_ID_DISPOSITIVO" FOREIGN KEY ("ID_DISPOSITIVO")
	  REFERENCES "ITO1"."DISPOSITIVO" ("ID_DISPOSITIVO") ON DELETE CASCADE ENABLE;