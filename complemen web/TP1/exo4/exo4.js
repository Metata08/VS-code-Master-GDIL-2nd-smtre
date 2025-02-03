function diviser(n1, n2, f, f_erreur) {
    let resultat;
    if (n2 == 0) {
        return f_erreur;      
    }
    else {
        resultat = f(n1, n2)
        return resultat;
    }

}


var a = prompt('Donner un nombre comme numerateur :');
var b = prompt("Donner un nombre comme denominateur :");

var resultat = diviser(a, b, (a, b) => {
    return a / b;
}, () => "ERREUR !!!  division Impossible (ERrOR)")

document.write("RESULTAT : " + resultat);