function ajouterElement(list=[],elmt="") {

 list.push(elmt);

 return list;
}



var t=[];
t.push(prompt("Donner var1 :"));

var x=prompt("Donner var2 :")


// x=document.getElementById('entree');

    t=ajouterElement(t,x);

        
        document.write(t);
        
    