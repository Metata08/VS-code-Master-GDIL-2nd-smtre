#include <iostream>
#include <string>
#include <string.h>

using namespace std;

int *LPS(string P)
{
    int m = P.length();
    int *lps = (int *)malloc(m * sizeof(int));
    lps[0] = 0;
    int j = 0, i = 1;

    while (i < m)
    {
        if (P[i] == P[j])
        {
            lps[i] = j + 1;
            i++;
            j++;
        }
        else
        {
            if (j == 0)
            {
                lps[i] = 0;
                i++;
            }
            else if (j != 0)
            {
                j = lps[j - 1];
            }
        }
    }
    return lps;
}



int KMP(string T, string P)
{
    int trouve = -1;
    int *lps ;
    lps= LPS(P);
    int i = 0, j = 0, n = T.length(), m = P.length();

    while (i < n)
    {

        if (T.at(i) == P.at(j))
        {
            i++;
            j++;
        }
        else if (j == 0)
        {
            i++;
        }
        else if (j == m)
        {
            trouve = i - j;
            return trouve;
        }
        else if (j != 0)
        {
            j = lps[j];
        }
        
    }

    return trouve;
}


int main()
{
    string mot, text;
    int *tab_lps;
    cout << "Donner un text : ";
    cin >> text;

    cout << "Donner un mot : ";
    cin >> mot;

    int t = KMP(text, mot);

    if (t != -1)
        cout << "Mot trouve a l'indice :" << t << endl;
    else
        cout << "Mot non trouve" << endl;


    return 0;
}