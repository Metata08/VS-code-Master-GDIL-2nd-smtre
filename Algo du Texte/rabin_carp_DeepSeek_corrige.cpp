#include <iostream>
#include <string>
#include <cmath>
using namespace std;

const int base = 10;

// Structure pour stocker un symbole et sa valeur
typedef struct {
    int val;
    char car;
} bloc_tab_val, *tab_valeur;

// Fonction pour créer la table des valeurs
tab_valeur creerTab_valeur(int nbre) {
    tab_valeur t_val = new bloc_tab_val[nbre];

    cout << "Donner les symboles suivis de leurs valeurs :" << endl;
    for (int i = 0; i < nbre; i++) {
        cout << "Donner le symbole : ";
        cin >> t_val[i].car;

        cout << "Donner la valeur : ";
        cin >> t_val[i].val;
    }

    return t_val;
}

// Fonction pour retourner la valeur associée à un symbole
int retourner_val(char c, tab_valeur tab, int nbre_val) {
    for (int i = 0; i < nbre_val; i++) {
        if (c == tab[i].car) {
            return tab[i].val;
        }
    }
    return -1;  // Retourne -1 si le symbole n'est pas trouvé
}

// Fonction de hachage pour une chaîne
int hachage(string ch, tab_valeur tab, int nbre_val) {
    int l = ch.length();
    int somme = 0;

    for (int i = 0; i < l; i++) {
        int puissance = l - 1 - i;  // Puissance décroissante
        somme += retourner_val(ch[i], tab, nbre_val) * pow(base, puissance);
    }
    return somme;
}

// Algorithme de Rabin-Karp
int rabin_carp(string T, string P, tab_valeur tab, int nbre) {
    int n = T.length(), m = P.length();
    int hp = hachage(P, tab, nbre);  // Hachage du motif

    for (int i = 0; i <= n - m; i++) {  // Parcours du texte
        string sous_chaine = T.substr(i, m);  // Sous-chaîne de longueur m
        int hs = hachage(sous_chaine, tab, nbre);  // Hachage de la sous-chaîne

        if (hs == hp) {  // Si les hachages correspondent
            if (sous_chaine == P) {  // Vérification exacte
                cout << "Correspondance trouvee a la position : " << i << endl;
                return i;
            }
        }
    }

    cout << "Aucune correspondance trouvee." << endl;
    return -1;
}

// Nombre de symboles
const int nbreSymboles = 3;

int main() {
    // Création de la table des valeurs
    tab_valeur t = creerTab_valeur(nbreSymboles);

    // Saisie du texte et du motif
    string texte, motif;
    cout << "Donner un texte : ";
    cin >> texte;
    cout << "Donner la chaine a rechercher : ";
    cin >> motif;

    // Recherche avec Rabin-Karp
    int resultat = rabin_carp(texte, motif, t, nbreSymboles);

    // Libération de la mémoire
    delete[] t;

    return 0;  // Retourne 0 pour indiquer une exécution réussie
}