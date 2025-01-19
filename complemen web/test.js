calculerResultat(a,b,(operator)=>{
    switch(operator) {
        case '+':
            return a + b;
        case '-':
            return a - b;
        case '*':
            return a * b;
        case '/':
            if(b === 0) {
                throw new Error("Division par zéro");
            }
            return a / b;
        default:
            throw new Error("Opérateur inconnu");
    }
});

var a=1;
var b=2;
var x=calculerResultat()

console.log(x);