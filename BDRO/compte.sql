-- Comptes Épargne
INSERT INTO CompteEpargnetable (CodeCompte, solde, DateOuverture, referenceClient, tauxInt)
VALUES ('CE101', 500000, SYSDATE, 2, 2.5);

INSERT INTO CompteEpargnetable (CodeCompte, solde, DateOuverture, referenceClient, tauxInt)
VALUES ('CE102', 300000, SYSDATE, 4, 3.0);

INSERT INTO CompteEpargnetable (CodeCompte, solde, DateOuverture, referenceClient, tauxInt)
VALUES ('CE103', 450000, SYSDATE, 3, 2.8);


INSERT INTO CompteEpargnetable (CodeCompte, solde, DateOuverture, referenceClient, tauxInt)
VALUES ('CE108', 500000, SYSDATE, 2, 2.5);

INSERT INTO CompteEpargnetable (CodeCompte, solde, DateOuverture, referenceClient, tauxInt)
VALUES ('CE128', 300000, SYSDATE, 4, 3.0);

INSERT INTO CompteEpargnetable (CodeCompte, solde, DateOuverture, referenceClient, tauxInt)
VALUES ('CE158', 450000, SYSDATE, 3, 2.8);

-- Comptes Chèques (avec `NESTED TABLE` vide pour les signatures)
INSERT INTO CompteChequetable (CodeCompte, solde, DateOuverture, referenceClient, nombreOperation, signatures)
VALUES ('CC201', 200000, SYSDATE, 1, 5, t_signature_table());

INSERT INTO CompteChequetable (CodeCompte, solde, DateOuverture, referenceClient, nombreOperation, signatures)
VALUES ('CC202', 150000, SYSDATE, 2, 3, t_signature_table());

INSERT INTO CompteChequetable (CodeCompte, solde, DateOuverture, referenceClient, nombreOperation, signatures)
VALUES ('CC203', 100000, SYSDATE, 3, 4, t_signature_table());

INSERT INTO CompteChequetable (CodeCompte, solde, DateOuverture, referenceClient, nombreOperation, signatures)
VALUES ('CC204', 50000, SYSDATE, 4, 2, t_signature_table());
