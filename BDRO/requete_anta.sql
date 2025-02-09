/* 1) Afficher liste des clients sans leur numéro de téléphone.*/

    SELECT nom, prenom, adresse
    FROM Client;

/* 2) Afficher la liste des clients avec la liste de leur numéro de téléphone.*/

    SELECT c.nom, c.prenom, nmbt.*
    FROM Client c, TABLE(c.numerotelephone) nmbt;

/* 3) Afficher la liste des comptes chèques (numéro, solde, date d'ouverture, nombre d'opérations CB)*/

    SELECT CC.CodeCompte,CC.solde,CC.DateOuverture,CC.NbOperations
    FROM CompteChequetable CC;

/* 4) Afficher la liste des comptes épargnes (numéro, solde, date d'ouverture, taux d'intérêt).*/

    SELECT ce.CodeCompte,ce.solde,ce.DateOuverture,ce.tauxInt
    FROM CompteEpargnetable ce;

/* 5) Afficher la liste des comptes cheque du client de numéro 4 (jointure implicite dans le WHERE).*/

    SELECT codecompte
    FROM CompteChequetable CC
    where CC.RefClient = (SELECT REF(c) FROM Client c where c.CodeClient = 4);
/* 6) Même requête pour tous ses comptes (courant et épargne)*/

    (SELECT CC.codecompte 
    FROM CompteChequetable CC
    where CC.RefClient = (SELECT REF(c) FROM Client c where c.CodeClient = 4))
    	union
    (SELECT ce.codecompte 
    FROM CompteEpargnetable ce
    where ce.RefClient = (SELECT REF(c) FROM Client c where c.CodeClient = 4));

/* 7) Liste des clients et numéro des comptes courants de solde inférieur à 0 FCFA donné (client à decouvert).*/

    SELECT c.CodeClient,c.nom,c.prenom,CC.CodeCompte
    FROM Client c, CompteChequetable CC
    where CC.solde < 0 and REF(c) = CC.RefClient;

/* 8) Numéro, nom et adresse des clients titulaires d’au moins un compte épargne.*/

    SELECT c.CodeClient,c.nom,c.adresse
    FROM Client c
    where REF(c) in (SELECT ce.RefClient FROM CompteEpargnetable ce
                     where ce.tauxInt is not null);

/* 9)  Numéro, nom et adresse des clients titulaires d’un seul compte d’epargne.*/

    SELECT c.CodeClient,c.nom,c.adresse
    FROM Client c
    where REF(c) in (SELECT ce.RefClient FROM CompteEpargnetable ce
                    group by ce.RefClient
                    having count(ce.CodeCompte) = 1);

/* 10) Pour chaque client (numéro, nom), afficher le nombre de compte épargne qu’il possède.*/

    SELECT c.CodeClient,c.nom,count(ce.CodeCompte)
    FROM Client c,CompteEpargnetable ce
    where REF(c) = ce.RefClient
    group by ce.RefClient,c.CodeClient,c.nom;    

    