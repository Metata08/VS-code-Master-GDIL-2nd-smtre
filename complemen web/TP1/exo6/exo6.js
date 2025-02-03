function minimum(...nbres)
{
    let min=nbres[0];
    for (let i = 1; i < nbres.length; i++) {
        if (min>nbres[i]) {
            min=nbres[i];     
        }
    }
    return min;
}

var tab=[];

do {
    var n=prompt("Donner un nombre :");
    if(n=='f')
        break;
    var nombre=parseInt(n);
    if(!isNaN(nombre))
        tab.push(nombre);
    else{
        alert("Veillez entrer un nombre valide .");
    }
} while (true);

document.write("le minmum  :  ");
document.writeln(minimum(...tab));