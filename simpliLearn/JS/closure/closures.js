/* let a=10;

function my_fonction(){
    let b=20;
    document.write(a+b);

}

my_fonction() */

var a=10;
function fist_function(){
    var b=20;
    function second_function(){
        var c=20+ a+b;
        return c;
    
    }
    return second_function();

}

var sum= fist_function();

document.write("La somme est : "+ sum+'<br>');