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

int main()
{
    string mot;
    int *tab_lps;
    cout << "Donner un mot : ";
    cin >> mot;
    tab_lps = LPS(mot);
    cout << "LPS : ";
    for (int i = 0; i < mot.length(); i++)
    {
        cout << " "<<tab_lps[i];
    }
    cout<<endl;
    return 0;
}