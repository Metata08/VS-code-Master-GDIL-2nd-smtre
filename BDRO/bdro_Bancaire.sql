create or replace type telephone_varray as
   varray(5) of varchar(12);

create or replace type t_signature as object (
      codeclient     number,
      droitsurcompte char(1)
)

create or replace type t_signature_table as
   table of t_signature;

create or replace table client (
   codeclient number primary key,
   nom        varchar2(25) not null,
   prenom     varchar2(25) not null,
   adresse    varchar2(35),
   telephone  telephone_varray
);

create or replace type comptegenerique as object (
      codecompte      varchar2(20),
      solde           number,
      dateouverture   date,
      referenceclient number
) not instantiable not final;

create or replace table comptegeneriquetable of comptegenerique (
   constraint pk_compte PRIMARY key (codecompte), 
   constraint fk_client foreign key ( referenceclient )
      references client ( codeclient )
);


create or replace type compteepargne under comptegenerique (
   tauxint number
);


create or replace table compteepargnetable of compteepargne (
   constraint pk_compte_epargne primary key ( codecompte )
);


create or replace type comptecheque under comptegenerique (
      nombreoperation number,
      signatures      t_signature_table
);


create or replace table comptechequetable of comptecheque (
   constraint pk_compte_cheque primary key ( codecompte )
)
nested table signatures store as tab_signatures;



create table mvt (
   codeclient    number not null,
   codecompte    varchar2(20) not null,
   dateoperation date default sysdate,
   montant       number not null,
   constraint fk_mvt_client foreign key ( codeclient )
      references client ( codeclient ),
      constraint pk_mvt primary key  (codeclient,codecompte,dateoperation)

);

drop table mvt ;


commit;




INSERT INTO Client VALUES (1, 'Jean', 'Dupont', '10 Rue des Fleurs', telephone_varray('0123456789', '0987654321', '0112233445', '0678912345', '0654321987'));
INSERT INTO Client VALUES (2, 'Alice', 'Martin', '25 Boulevard Haussmann', telephone_varray('0132456789', '0978654321', '0112345678', '0678123456', '0654781234'));
INSERT INTO Client VALUES (3, 'Robert', 'Durand', '7 Rue de Lyon', telephone_varray('0154321987', '0912345678', '0113344556', '0678923451', '0645781234'));
INSERT INTO Client VALUES (4, 'Sophie', 'Lemoine', '18 Avenue de Paris', telephone_varray('0198765432', '0932456712', '0123345567', '0678123498', '0645123789'));
INSERT INTO Client VALUES (5, 'Pierre', 'Moreau', '4 Rue de Bretagne', telephone_varray('0178123456', '0923456789', '0123445566', '0678951234', '0645432187'));
INSERT INTO Client VALUES (6, 'Marie', 'Dubois', '30 Rue Lafayette', null);



INSERT INTO compteepargnetable VALUES (1001, 15000, TO_DATE('2025-01-01', 'YYYY-MM-DD'), 1, 1.5);
INSERT INTO compteepargnetable VALUES (1002, 30000, TO_DATE('2025-01-02', 'YYYY-MM-DD'), 2, 2.0);
INSERT INTO compteepargnetable VALUES (1003, 5000, TO_DATE('2025-01-03', 'YYYY-MM-DD'), 3, 1.8);
INSERT INTO compteepargnetable VALUES (1004, 20000, TO_DATE('2025-01-04', 'YYYY-MM-DD'), 4, 1.7);

INSERT INTO comptechequetable VALUES (2002, 8000, TO_DATE('2025-01-06', 'YYYY-MM-DD'), 2, 8, t_signature_table());
INSERT INTO comptechequetable VALUES (2001, 12000, TO_DATE('2025-01-05', 'YYYY-MM-DD'), 1, 10, t_signature_table());
INSERT INTO comptechequetable VALUES (2003, 0, TO_DATE('2025-01-07', 'YYYY-MM-DD'), 3, 0, t_signature_table());
INSERT INTO comptechequetable VALUES (2004, 500, TO_DATE('2025-01-08', 'YYYY-MM-DD'), 4, 5, t_signature_table());
INSERT INTO comptechequetable VALUES (2005, 7000, TO_DATE('2025-01-09', 'YYYY-MM-DD'), 5, 7, t_signature_table());
INSERT INTO comptechequetable VALUES (2006, -200, TO_DATE('2025-01-10', 'YYYY-MM-DD'), 6, 3, t_signature_table());


INSERT INTO mvt VALUES (2, 1001, TO_DATE('2025-01-12', 'YYYY-MM-DD'), 1000);
INSERT INTO mvt VALUES (3, 1003, TO_DATE('2025-01-13', 'YYYY-MM-DD'), -500);
INSERT INTO mvt VALUES (4, 1005, TO_DATE('2025-01-14', 'YYYY-MM-DD'), 2000);


CREATE OR REPLACE TRIGGER verif_codeCompte 
BEFORE INSERT ON mvt
FOR EACH ROW 
DECLARE
    v_count1 NUMBER;
    v_count2 NUMBER;
BEGIN
    -- Vérifier si le codecompte existe dans compteepargnetable
    SELECT COUNT(*) INTO v_count1 
    FROM compteepargnetable
    WHERE codecompte = :NEW.codecompte;
    
    -- Vérifier si le codecompte existe dans comptechequetable
    SELECT COUNT(*) INTO v_count2 
    FROM comptechequetable
    WHERE codecompte = :NEW.codecompte;

    -- Si le codecompte n'existe pas dans les deux tables, lever une erreur
    IF (v_count1 = 0 AND v_count2 = 0) THEN
        RAISE_APPLICATION_ERROR(-20102, 'Ce compte n''existe pas dans les tables comptechequetable et compteepargnetable !');
    END IF;
END;
/
