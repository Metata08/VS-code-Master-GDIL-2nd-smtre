/* 1) Afficher liste des clients sans leur numéro de téléphone.*/

    SELECT nom, prenom, adresse
    FROM Client;

/* 2) Afficher la liste des clients avec la liste de leur numéro de téléphone.*/

SELECT codeClient, nom, prenom, adresse, 
       LISTAGG(t.COLUMN_VALUE, ', ') WITHIN GROUP (ORDER BY t.COLUMN_VALUE) AS numeros
FROM Client Cl, TABLE(Cl.telephone) t
GROUP BY codeClient, nom, prenom, adresse;




/* 3) Afficher la liste des comptes chèques (numéro, solde, date d'ouverture, nombre d'opérations CB)*/

SELECT CodeCompte, solde, DateOuverture, nombreOperation 
FROM CompteChequetable
ORDER BY CodeCompte;


/* 4) Afficher la liste des comptes épargnes (numéro, solde, date d'ouverture, taux d'intérêt).*/

    SELECT codecompte,solde,DateOuverture,tauxInt
    FROM CompteEpargnetable ;


/* 5) Afficher la liste des comptes cheque du client de numéro 4 (jointure implicite dans le WHERE).*/


SELECT Cc.CodeCompte, Cc.solde, Cc.DateOuverture, Cc.nombreOperation
FROM CompteChequetable Cc, Client Cl
WHERE Cc.referenceClient = Cl.codeClient
AND Cl.codeClient = 4;


/* 6) Même requête pour tous ses comptes (courant et épargne)*/


SELECT Ce.CodeCompte, Ce.solde, Ce.DateOuverture
FROM CompteEpargnetable Ce, Client Cl
WHERE Ce.referenceClient = Cl.codeClient
AND Cl.codeClient = 4
UNION
SELECT Cc.CodeCompte, Cc.solde, Cc.DateOuverture
FROM CompteChequetable Cc, Client Cl
WHERE Cc.referenceClient = Cl.codeClient
AND Cl.codeClient = 4;

/* 7) Liste des clients et numéro des comptes courants(cheque) de solde inférieur à 0 FCFA donné (client à decouvert).*/

SELECT Cl.codeClient, Cl.nom, Cl.prenom, Cc.CodeCompte, Cc.solde
FROM Client Cl, CompteChequetable Cc
WHERE Cl.codeClient = Cc.referenceClient
AND Cc.solde < 0;



/* 8) Numéro, nom et adresse des clients titulaires d’au moins un compte épargne.*/

SELECT DISTINCT Cl.codeClient, Cl.nom, Cl.prenom, Cl.adresse
FROM Client Cl, CompteEpargnetable Ce
WHERE Cl.codeClient = Ce.referenceClient;

/* 9)  Numéro, nom et adresse des clients titulaires d’un seul compte d’epargne.*/

SELECT Cl.codeClient, Cl.nom, Cl.prenom, Cl.adresse
FROM Client Cl, CompteEpargnetable Ce
WHERE Cl.codeClient = Ce.referenceClient
GROUP BY Cl.codeClient, Cl.nom, Cl.prenom, Cl.adresse
HAVING COUNT(Ce.CodeCompte) = 1;


/* 10) Pour chaque client (numéro, nom), afficher le nombre de compte épargne qu’il possède.*/

        SELECT Cl.codeClient, Cl.nom, Cl.prenom, COUNT(Ce.CodeCompte) as nbreCompte 
        FROM Client Cl,CompteEpargnetable Ce 
        WHERE  Cl.codeClient = Ce.referenceClient
        GROUP BY Cl.codeClient, Cl.nom, Cl.prenom;

     
-- 11. Même requête pour afficher aussi les clients n'ayant pas de compte épargne.


        SELECT Cl.codeClient, Cl.nom, Cl.prenom, COALESCE(COUNT(Ce.CodeCompte), 0) AS nbComptesEpargne
        FROM Client Cl
       LEFT JOIN CompteEpargnetable Ce  ON Cl.codeClient = Ce.referenceClient
        GROUP BY Cl.codeClient, Cl.nom, Cl.prenom;


    -- 12. Numéro, nom et nombre de compte épargne du titulaire ayant le plus de comptes épargne.


    SELECT Cl.codeClient, Cl.nom, COUNT(Ce.CodeCompte) AS nbComptesEpargne
    FROM Client Cl
    JOIN CompteEpargnetable Ce ON Cl.codeClient = Ce.referenceClient
    GROUP BY Cl.codeClient, Cl.nom
    ORDER BY nbComptesEpargne DESC
    FETCH FIRST 1 ROWS ONLY;



    -- 13. Liste des clients (numéro et nom) qui ont fait des opérations (date et montant) sur le compte courant de numéro 10.
        
        
        SELECT DISTINCT Cl.codeClient, Cl.nom, Cl.prenom, m.dateOperation, m.montant
        FROM Client Cl, mvt m
        WHERE Cl.codeClient = m.codeClient
        AND m.CodeCompte = 'CC204';

    -- 14. Liste des opérations sur le compte courant 8 (numéro de compte, date et montant) qui on été faites par un client propriétaire du compte modifié .


        SELECT m.CodeCompte, m.dateOperation, m.montant
        FROM mvt m
        JOIN CompteChequetable cc ON m.CodeCompte = cc.CodeCompte
        WHERE m.CodeCompte = 'CC203'
        AND m.codeClient = cc.referenceClient;

    -- 15.  Même requête pour les opérations qui ont été faites par les clients non propriétaire du compte modifié.


        SELECT m.CodeCompte, m.dateOperation, m.montant
        FROM mvt m
        JOIN CompteChequetable cc ON m.CodeCompte = cc.CodeCompte
        WHERE m.CodeCompte = 'CC203'
        AND m.codeClient <> cc.referenceClient;
