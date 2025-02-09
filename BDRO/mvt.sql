



-- Opérations des comptes épargnes (faites par les titulaires)
INSERT INTO mvt (codeClient, CodeCompte, dateOperation, montant)
VALUES (2, 'CE101', SYSDATE - 10, 50000); -- Dépôt

INSERT INTO mvt (codeClient, CodeCompte, dateOperation, montant)
VALUES (4, 'CE102', SYSDATE - 8, -20000); -- Retrait

INSERT INTO mvt (codeClient, CodeCompte, dateOperation, montant)
VALUES (3, 'CE103', SYSDATE - 7, 70000); -- Dépôt

INSERT INTO mvt (codeClient, CodeCompte, dateOperation, montant)
VALUES (2, 'CE104', SYSDATE - 5, -15000); -- Retrait

INSERT INTO mvt (codeClient, CodeCompte, dateOperation, montant)
VALUES (4, 'CE108', SYSDATE - 3, 80000); -- Dépôt

INSERT INTO mvt (codeClient, CodeCompte, dateOperation, montant)
VALUES (3, 'CE128', SYSDATE - 2, -30000); -- Retrait

-- Opérations des comptes chèques (faites par le titulaire ou un signataire)
INSERT INTO mvt (codeClient, CodeCompte, dateOperation, montant)
VALUES (1, 'CC201', SYSDATE - 9, 100000); -- Dépôt du titulaire

INSERT INTO mvt (codeClient, CodeCompte, dateOperation, montant)
VALUES (2, 'CC202', SYSDATE - 6, -50000); -- Retrait du titulaire

INSERT INTO mvt (codeClient, CodeCompte, dateOperation, montant)
VALUES (3, 'CC203', SYSDATE - 4, 25000); -- Dépôt du titulaire

INSERT INTO mvt (codeClient, CodeCompte, dateOperation, montant)
VALUES (4, 'CC204', SYSDATE - 2, -10000); -- Retrait du titulaire

-- Opérations sur les comptes avec signataires
INSERT INTO mvt (codeClient, CodeCompte, dateOperation, montant)
VALUES (1, 'CC203', SYSDATE - 1, -20000); -- Retrait par le signataire (codeClient 1)

INSERT INTO mvt (codeClient, CodeCompte, dateOperation, montant)
VALUES (2, 'CC203', SYSDATE, 50000); -- Dépôt par le signataire (codeClient 2)

INSERT INTO mvt (codeClient, CodeCompte, dateOperation, montant)
VALUES (3, 'CC204', SYSDATE - 1, -15000); -- Retrait par le signataire (codeClient 3)

INSERT INTO mvt (codeClient, CodeCompte, dateOperation, montant)
VALUES (4, 'CC204', SYSDATE, 60000); -- Dépôt par le signataire (codeClient 4)

COMMIT;


INSERT INTO mvt (codeClient, CodeCompte, montant)
VALUES (88, 'CC148', 30000);

COMMIT;
