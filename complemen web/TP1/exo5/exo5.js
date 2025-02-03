function nombrePairs(...nbres) {
    var tab = [];
    for (let i = 0; i < nbres.length; i++) {
        if (nbres[i] % 2 == 0)
            tab.push(nbres[i]);
    }
    return tab;
}

var entree = [];

do {
    var x = prompt("Donner un nombre :");
    if (x === 'f')
        break;

    // Convertir l'entrée en nombre et vérifier si c'est un nombre valide
    var nombre = parseInt(x);
    if (!isNaN(nombre)) {
        entree.push(nombre);
    } else {
        alert("Veuillez entrer un nombre valide.");
    }

} while (true);

// Utiliser l'opérateur de décomposition pour passer les éléments du tableau comme arguments individuels

document.write("les Nombres pairs :  ");
document.writeln(nombrePairs(...entree));