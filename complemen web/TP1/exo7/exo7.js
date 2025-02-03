
// factorielle 
/* 
premiere fonction 
var resultat = n => {
        if (n == 0 || n == 1) {
            return 1;
        }
        else {
            let fact = 1;
            let i = n;

            while (i != 1) {
                fact *= i;
                i -= 1;
            }
            return fact;

        }
    } */
// console.log(resultat(2))

// deuxieme fonction flechee 
var facto = (n) => n == 0 || n == 1 ? 1 : n*facto(n-1);
var nbre=parseInt(prompt("donner un nombre :"));

console.log("La factorielle de "+nbre+" est  = "+facto(nbre))


// creer fonction polynomiale

var polynome = (a, b, c) => {
    return  a +"x^2 + "+b+"x + "+c;
}

var a, b, c;
a =parseInt( prompt("Donner un nombre pour a :"));
b = parseInt( prompt("Donner un nombre pour b :"));
c = parseInt( prompt("Donner un nombre pour c :"));
console.log(polynome(a,b,c))