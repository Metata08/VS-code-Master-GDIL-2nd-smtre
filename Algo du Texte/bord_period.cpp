#include <iostream>
#include <string>

using namespace std;

string border(string ch)
{
    string prefixe = "";
    string suffixe = "";

    // Si la longueur du mot est paire
    if (ch.length() % 2 == 0)
    {
        prefixe = ch.substr(0, ch.length() / 2);
        suffixe = ch.substr(ch.length() / 2);
    }
    // Si la longueur du mot est impaire
    else
    {
        prefixe = ch.substr(0, ch.length() / 2);
        suffixe = ch.substr((ch.length() / 2) + 1);
    }

    // Tant que le premier caractère de prefixe et suffixe ne correspond pas
    // et que prefixe n'est pas vide
    while (prefixe.length() > 0 && prefixe != suffixe)
    {
        prefixe.pop_back();
        suffixe.erase(0, 1);
    }

    // Si prefixe est vide, retourner "epsilon"
    if (prefixe.length() == 0)
    {
        return "epsilon";
    }

    // Retourner le bord trouvé
    return prefixe;
}

int period(string ch)
{
    int n = ch.length(); // Longueur du mot

    // Parcourir toutes les longueurs possibles de motifs (de 1 à n)
    for (int p = 1; p <= n; p++)
    {
        bool isPeriod = true;

        // Vérifier si le motif de longueur p se répète
        for (int i = 0; i < n; i++)
        {
            if (ch[i] != ch[i % p])
            {
                isPeriod = false;
                break;
            }
        }

        // Si un motif répétitif est trouvé, retourner sa longueur
        if (isPeriod)
        {
            return p;
        }
    }

    // Si aucun motif répétitif n'est trouvé, la période est la longueur du mot
    return n;
}
int main()
{
    string mot;
    cout << "Donner un mot :";
    cin >> mot;
    cout << "Le bord de \"" << mot << "\" est : " << border(mot) << endl;
    cout << "La période de \"" << mot << "\" est : " << period(mot) << endl;
    return 0;
}