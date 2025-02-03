create or replace type telephone_varray as
   varray(5) of varchar(12);

create or replace type t_signature as object (
      codeclient     number,
      droitsurcompte char(1)
)

create or replace type t_signature_table as
   table of t_signature;

create table client (
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

create table comptegeneriquetable of comptegenerique (
   constraint pk_compte PRIMARY key (codecompte), 
   constraint fk_client foreign key ( referenceclient )
      references client ( codeclient )
);


create or replace type compteepargne under comptegenerique (
   tauxint number
);


create table compteepargnetable of compteepargne (
   constraint pk_compte_epargne primary key ( codecompte )
);


create or replace type comptecheque under comptegenerique (
      nombreoperation number,
      signatures      t_signature_table
);


create table comptechequetable of comptecheque (
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
   constraint fk_mvt_compte foreign key ( codecompte )
      references comptegeneriquetable ( codecompte )
);
