DECLARE
    signatairesCC203 t_signature_table := t_signature_table(t_signature(1, 'R'), t_signature(2, 'D'));
    signatairesCC204 t_signature_table := t_signature_table(t_signature(3, 'R'), t_signature(4, 'D'));
BEGIN
    UPDATE CompteChequetable SET Signatures = signatairesCC203 WHERE CodeCompte = 'CC203';
    UPDATE CompteChequetable SET Signatures = signatairesCC204 WHERE CodeCompte = 'CC204';
    COMMIT;
END;
/


