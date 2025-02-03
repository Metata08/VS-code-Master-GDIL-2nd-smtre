#include <iostream>
#include <string>
#include <cmath>
const int base = 10;
using namespace std;

typedef struct
{
    int val;
    char car;
} bloc_tab_val, *tab_valeur;

// fonction de creation de la table des valeurs correspondant au symbole
tab_valeur creerTab_valeur(int nbre)
{
    tab_valeur t_val = new bloc_tab_val[nbre];

    cout << "Donner les symboles suivis de la valeurs" << endl;
    for (int i = 0; i < nbre; i++)
    {
        // il faut mettre le bloque de comntrole
        cout << "donner le symbole :";

        cin >> t_val[i].car;

        cout << "donner la valeur : ";

        cin >> t_val[i].val;
    }

    return t_val;
}

int retourner_val(char c, tab_valeur tab, int nbre_val)
{
    int val=-100000;
    for (int i = 0; i < nbre_val; i++)

    {
        if (c == tab[i].car)
            return tab[i].val;
    }
    return val;
}

int hachage(string ch, tab_valeur tab, int nbre_val)
{

    int l = ch.length();
    int somme = 0;

    for (int i = 0; i < l; i++)
    {
        somme = somme + retourner_val(ch[i], tab, nbre_val) * pow(base, l - 1);
    }
    return somme;
}

int rabin_carp(string T, string P, tab_valeur tab, int nbre)
{
    int n = T.length(), m = P.length();
    int hp = hachage(P, tab, nbre);
    int hs;
    for (int i = 0; i < n - m; i++)
    {
        hs = hachage(T.substr(i, i + m - 1),tab,nbre);
        if (hs == hp)
        {
            if (T.compare(P))
            {
                cout << "Correspondance trouvee";
                return i;
            }
        }
    }
    return -1;
}

const int nbreSymbles = 3;

int main()
{
    tab_valeur t = creerTab_valeur(nbreSymbles);
    string texte, patern;
    cout << "Donner un texte :";
    cin >> texte;
    cout << "Donner la chaine  :";
    cin >> patern;

    cout << " Rabin-Carp :" << rabin_carp(texte, patern, t, nbreSymbles) <<endl;

    return 1;
}