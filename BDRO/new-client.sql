INSERT INTO Client (codeClient, nom, prenom, adresse, telephone)
VALUES (88, 'Diouf', 'Modou', 'Sor – Saint-Louis', telephone_varray('775514416'));

INSERT INTO CompteChequetable (CodeCompte, solde, DateOuverture, referenceClient, nombreOperation, Signatures)
VALUES ('CC148', 0, SYSDATE, 88, 0, t_Signature_Table());
