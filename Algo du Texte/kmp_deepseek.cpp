#include <iostream>
#include <string>
#include <vector>

using namespace std;

vector<int> LPS(const string& P) {
    int m = P.length();
    vector<int> lps(m, 0);
    int j = 0, i = 1;

    while (i < m) {
        if (P[i] == P[j]) {
            lps[i] = j + 1;
            i++;
            j++;
        } else {
            if (j == 0) {
                lps[i] = 0;
                i++;
            } else {
                j = lps[j - 1];
            }
        }
    }
    return lps;
}

int KMP(const string& T, const string& P) {
    int trouve = -1;
    vector<int> lps = LPS(P);
    int i = 0, j = 0, n = T.length(), m = P.length();

    while (i < n) {
        if (T[i] == P[j]) {
            i++;
            j++;
            if (j == m) {
                trouve = i - j;
                return trouve;
            }
        } else {
            if (j == 0) {
                i++;
            } else {
                j = lps[j - 1];
            }
        }
    }

    return trouve;
}

int main() {
    string mot, text;
    cout << "Donner un text : ";
    getline(cin, text);

    cout << "Donner un mot : ";
    getline(cin, mot);

    int t = KMP(text, mot);

    if (t != -1)
        cout << "Mot trouve a l'indice : " << t << endl;
    else
        cout << "Mot non trouve" << endl;

    return 0;
}