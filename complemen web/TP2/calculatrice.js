let expression = '0';

function ajouterCaractere(caractere) {

    if (/[\+\-\*\/]$/.test(expression) && /[\+\-\*\/]/.test(caractere)) {
        return;
    }

    expression += caractere;
    afficherExpression();
}

function effacer() {
    expression = '';
    afficherExpression();
}

function effacerUn() {
    expression = expression.slice(0, -1); // Supprime le dernier caractère
    afficherExpression();
}

function calculer() {
    try {
        if (!expression) {
            afficherResultat('Erreur');
            return;
        }

        if (/\/\s*0(?!\d)/.test(expression)) {
            afficherResultat('Erreur: Division par zéro');
            return;
        }

        let result = eval(expression); // Évalue l'expression
        afficherResultat(result);
        expression = result.toString();
       
    } catch (error) {
        afficherResultat('Erreur');
    }
}

function afficherExpression() {
    document.getElementById('resultat').value = expression || '0';
}

function afficherResultat(resultat) {
    document.getElementById('resultat').value = resultat;
}
