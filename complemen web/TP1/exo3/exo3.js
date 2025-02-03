function compterVoyelles(chaine) {
    let compteur = 0;


    for (let i = 0; i < chaine.length; i++) {
        switch (chaine[i]) {
            case 'a':
                compteur++;

                break;
            case 'e':
                compteur++;

                break;
            case 'o':
                compteur++;

                break;
            case 'i':
                compteur++;

                break;
            case 'o':
                compteur++;

                break;
            case 'u':
                compteur++;

                break;

            default:
                break;
        }


    }
    return compteur;
}



var mot = prompt("Donner une chaine : ");

document.write("le nombre de voyelles du mot est de :" + compterVoyelles(mot));