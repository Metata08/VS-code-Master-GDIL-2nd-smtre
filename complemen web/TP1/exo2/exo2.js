function ajouterElement(list=[],elmt="") {

 list.push(elmt);
 return list;
}


var x="a_ma_place";
var t=["je","suis"];

// x=document.getElementById('entree');

    t=ajouterElement(t,x);

        
        document.write( t);
        
    