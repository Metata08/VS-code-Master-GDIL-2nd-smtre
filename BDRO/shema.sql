CREATE TABLE "MG4"."CLIENT" (
    "CODECLIENT" NUMBER,
    "NOM"        VARCHAR2(25 BYTE) NOT NULL ENABLE,
    "PRENOM"     VARCHAR2(25 BYTE) NOT NULL ENABLE,
    "ADRESSE"    VARCHAR2(35 BYTE),
    "TELEPHONE"  "MG4"."TELEPHONE_VARRAY",
        PRIMARY KEY ( "CODECLIENT" )
            USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
                STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
                DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
            TABLESPACE "USERS" ENABLE
)
SEGMENT CREATION IMMEDIATE
PCTFREE 10
PCTUSED 40
INITRANS 1
MAXTRANS 255 NOCOMPRESS
LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
    FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
TABLESPACE "USERS";


CREATE TABLE "MG4"."COMPTEGENERIQUETABLE" OF "MG4"."COMPTEGENERIQUE" (
    CONSTRAINT "PK_COMPTE"
        PRIMARY KEY ( "CODECOMPTE" )
            USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 TABLESPACE "USERS" ENABLE,
    CONSTRAINT "FK_CLIENT"
        FOREIGN KEY ( "REFERENCECLIENT" )
            REFERENCES "MG4"."CLIENT" ( "CODECLIENT" )
        ENABLE
) OIDINDEX ( PCTFREE 10 INITRANS 2 MAXTRANS 255 TABLESPACE "USERS" )
SEGMENT CREATION DEFERRED
PCTFREE 10
PCTUSED 40
INITRANS 1
MAXTRANS 255 NOCOMPRESS
LOGGING
TABLESPACE "USERS"
NESTED TABLE TREAT(sys_nc_rowinfo$ AS "MG4"."CompteChequetable")."SIGNATURES" STORE AS "SYSNTT1-TK-N9KB_ST+ZOJF7F0U4B" (
PCTFREE 10
PCTUSED 40
INITRANS 1
MAXTRANS 255
LOGGING NOCOMPRESS
TABLESPACE "USERS" ) RETURN AS VALUE;

CREATE TABLE "MG4"."COMPTEEPARGNETABLE" OF "MG4"."CompteEpargnetable" (
    CONSTRAINT "PK_COMPTE_EPARGNE"
        PRIMARY KEY ( "CODECOMPTE" )
            USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
                STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
                DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
            TABLESPACE "USERS" ENABLE
) OIDINDEX ( PCTFREE 10 INITRANS 2 MAXTRANS 255
    STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
    FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
TABLESPACE "USERS" )
SEGMENT CREATION IMMEDIATE
PCTFREE 10
PCTUSED 40
INITRANS 1
MAXTRANS 255 NOCOMPRESS
LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
    FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
TABLESPACE "USERS";

CREATE TABLE "MG4"."COMPTECHEQUETABLE" OF "MG4"."CompteChequetable" (
    CONSTRAINT "PK_COMPTE_CHEQUE"
        PRIMARY KEY ( "CODECOMPTE" )
            USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
                STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
                DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
            TABLESPACE "USERS" ENABLE
) OIDINDEX ( PCTFREE 10 INITRANS 2 MAXTRANS 255
    STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
    FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
TABLESPACE "USERS" )
SEGMENT CREATION IMMEDIATE
PCTFREE 10
PCTUSED 40
INITRANS 1
MAXTRANS 255 NOCOMPRESS
LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
    FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
TABLESPACE "USERS"
NESTED TABLE "SIGNATURES" STORE AS "TAB_SIGNATURES" (
PCTFREE 10
PCTUSED 40
INITRANS 1
MAXTRANS 255
LOGGING NOCOMPRESS
TABLESPACE "USERS" ) RETURN AS VALUE;

CREATE TABLE "MG4"."MVT" (
    "CODECLIENT"    NUMBER NOT NULL ENABLE,
    "CODECOMPTE"    VARCHAR2(20 BYTE) NOT NULL ENABLE,
    "DATEOPERATION" DATE DEFAULT sysdate,
    "MONTANT"       NUMBER NOT NULL ENABLE,
    CONSTRAINT "PK_MVT"
        PRIMARY KEY ( "CODECLIENT",
                      "CODECOMPTE",
                      "DATEOPERATION" )
            USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255
                STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
                DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
            TABLESPACE "USERS" ENABLE,
    CONSTRAINT "FK_MVT_CLIENT" FOREIGN KEY ( "CODECLIENT" )
        REFERENCES "MG4"."CLIENT" ( "CODECLIENT" )
    ENABLE
)
SEGMENT CREATION IMMEDIATE
PCTFREE 10
PCTUSED 40
INITRANS 1
MAXTRANS 255 NOCOMPRESS
LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
    FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
TABLESPACE "USERS";

CREATE OR REPLACE EDITIONABLE TRIGGER "MG4"."VERIF_CODECOMPTE" BEFORE
    INSERT ON mvt
    FOR EACH ROW
DECLARE
    v_count1 NUMBER;
    v_count2 NUMBER;
BEGIN
    -- Vérifier si le codecompte existe dans compteepargnetable
    SELECT
        COUNT(*)
    INTO v_count1
    FROM
        compteepargnetable
    WHERE
        codecompte = :new.codecompte;

    -- Vérifier si le codecompte existe dans comptechequetable
    SELECT
        COUNT(*)
    INTO v_count2
    FROM
        comptechequetable
    WHERE
        codecompte = :new.codecompte;

    -- Si le codecompte n'existe pas dans les deux tables, lever une erreur
    IF (
        v_count1 = 0
        AND v_count2 = 0
    ) THEN
        raise_application_error(-20102, 'Ce compte n''existe pas dans les tables comptechequetable et compteepargnetable !');
    END IF;

END;
/

ALTER TRIGGER "MG4"."VERIF_CODECOMPTE" ENABLE;

