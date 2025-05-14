#include "soapCalculatorSoapProxy.h"
#include "CalculatorSoap.nsmap"
#include <iostream>

using namespace std;
int main()
{
    // Créer une instance du proxy
    CalculatorSoapProxy calculator;

    // Définir les paramètres de l'opération Add
    _tempuri__Add element;
    element.intA = 5;
    element.intB = 10;

    _tempuri__AddResponse result;

    // Appeler la méthode Add
    if (calculator.Add(&element, result) == SOAP_OK)
    {
        cout << "Résultat de l'addition : " << calculator.Add(&element, result) << endl;
    }
    else
    {
        // Gestion des erreurs
        cerr << "Erreur lors de l'appel du service web : " << calculator.soap_fault_string() << endl;
    }

    // Nettoyer
    calculator.destroy();
    return 0;
}