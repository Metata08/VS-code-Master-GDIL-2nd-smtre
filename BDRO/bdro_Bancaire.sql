create or replace type telephone_varray as
   varray(5) of varchar(9);

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
   constraint pk_compte primary key ( codecompte ),
   constraint fk_client foreign key ( referenceclient )
      references client ( codeclient )
);


create or replace type CompteEpargnetable under comptegenerique (
   tauxint number
);


create table compteepargnetable of CompteEpargnetable (
   constraint pk_compte_epargne primary key ( codecompte )
);


create or replace type CompteChequetable under comptegenerique (
      nombreoperation number,
      signatures      t_signature_table
);


create table comptechequetable of CompteChequetable (
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
   constraint pk_mvt primary key ( codeclient,
                                   codecompte,
                                   dateoperation )
);



commit;



insert into client values ( 1,
                            'Jean',
                            'Dupont',
                            '10 Rue des Fleurs',
                            telephone_varray(
                               '0123456789',
                               '0987654321',
                               '0112233445',
                               '0678912345',
                               '0654321987'
                            ) );
insert into client values ( 2,
                            'Alice',
                            'Martin',
                            '25 Boulevard Haussmann',
                            telephone_varray(
                               '0132456789',
                               '0978654321',
                               '0112345678',
                               '0678123456',
                               '0654781234'
                            ) );
insert into client values ( 3,
                            'Robert',
                            'Durand',
                            '7 Rue de Lyon',
                            telephone_varray(
                               '0154321987',
                               '0912345678',
                               '0113344556',
                               '0678923451',
                               '0645781234'
                            ) );
insert into client values ( 4,
                            'Sophie',
                            'Lemoine',
                            '18 Avenue de Paris',
                            telephone_varray(
                               '0198765432',
                               '0932456712',
                               '0123345567',
                               '0678123498',
                               '0645123789'
                            ) );

insert into client values ( 5,
                            'Pierre',
                            'Moreau',
                            '4 Rue de Bretagne',
                            telephone_varray(
                               '0178123456',
                               '0923456789',
                               '0123445566',
                               '0678951234',
                               '0645432187'
                            ) );
insert into client values ( 6,
                            'Marie',
                            'Dubois',
                            '30 Rue Lafayette',
                            null );



insert into compteepargnetable values ( 1001,
                                        15000,
                                        to_date('2025-01-01','YYYY-MM-DD'),
                                        1,
                                        1.5 );
insert into compteepargnetable values ( 1002,
                                        30000,
                                        to_date('2025-01-02','YYYY-MM-DD'),
                                        2,
                                        2.0 );
insert into compteepargnetable values ( 1003,
                                        5000,
                                        to_date('2025-01-03','YYYY-MM-DD'),
                                        3,
                                        1.8 );
insert into compteepargnetable values ( 1004,
                                        20000,
                                        to_date('2025-01-04','YYYY-MM-DD'),
                                        4,
                                        1.7 );

insert into comptechequetable values ( 2002,
                                       8000,
                                       to_date('2025-01-06','YYYY-MM-DD'),
                                       2,
                                       8,
                                       t_signature_table() );
insert into comptechequetable values ( 2001,
                                       12000,
                                       to_date('2025-01-05','YYYY-MM-DD'),
                                       1,
                                       10,
                                       t_signature_table() );
insert into comptechequetable values ( 2003,
                                       0,
                                       to_date('2025-01-07','YYYY-MM-DD'),
                                       3,
                                       0,
                                       t_signature_table() );
insert into comptechequetable values ( 2004,
                                       500,
                                       to_date('2025-01-08','YYYY-MM-DD'),
                                       4,
                                       5,
                                       t_signature_table() );
insert into comptechequetable values ( 2005,
                                       7000,
                                       to_date('2025-01-09','YYYY-MM-DD'),
                                       5,
                                       7,
                                       t_signature_table() );
insert into comptechequetable values ( 2006,
                                       - 200,
                                       to_date('2025-01-10','YYYY-MM-DD'),
                                       6,
                                       3,
                                       t_signature_table() );


insert into mvt values ( 2,
                         1001,
                         to_date('2025-01-12','YYYY-MM-DD'),
                         1000 );
insert into mvt values ( 3,
                         1003,
                         to_date('2025-01-13','YYYY-MM-DD'),
                         - 500 );
insert into mvt values ( 4,
                         1005,
                         to_date('2025-01-14','YYYY-MM-DD'),
                         2000 );


create or replace trigger verif_codecompte before
   insert on mvt
   for each row
declare
   v_count2 number;
begin
   
    
    -- Vérifier si le codecompte existe dans comptechequetable
   select count(*)
     into v_count2
     from comptechequetable
    where codecompte = :new.codecompte;

    -- Si le codecompte n'existe pas dans les deux tables, lever une erreur
   if ( v_count2 = 0 ) then
      raise_application_error(
         -20102,
         'Ce compte n''existe pas dans les tables comptechequetable et compteepargnetable !'
      );
   end if;
end;
/