/* let car = new Promise(function (resolve, reject) {
    fuel_fullTank = true;
    if (fuel_fullTank)
        resolve();
    else
        reject();
});

car.then(function(){
    document.write("le resevoir de carburant est plein . Bonne conduite  ");
}).catch(function(){
    document.write("le resrvoir de carburant n'est pas vide ")
}) */

var msg=""; 

let reservoir_vide = function (msg) {
    return new Promise(function (resolve, reject) {
        resolve(msg+"la voiture n'a pas assez de carburant .");
    });
}

let moteur = function (msg) {
    return new Promise(function (resolve, reject) {
        resolve(msg+"le moteur surchauffe .");

    })
}



let voyage = function (msg) {
    return new Promise(function (resolve, reject) {
        resolve(msg+"la voiture n'est pas sur pour voyager .");
    });
}


reservoir_vide("").then(function (result) {
    return moteur(result);
}).then(function (result) {
    return voyage(result);
}).then(function (result) {
    console.log(result+"FAIT !");
});