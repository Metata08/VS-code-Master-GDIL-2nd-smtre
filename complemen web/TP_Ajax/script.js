
 
    
    document.getElementById("bnt-fruit").addEventListener("click", function() {
        let xhr = new XMLHttpRequest();
        xhr.withCredentials(true);
        xhr.open("GET", "fruits.json", true);
        xhr.setRequestHeader("Access-Control-Allow-origin", "*"); //
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                let fruits = JSON.parse(xhr.responseText);
                let fruitList = document.getElementById("affiche");
                fruitList.innerHTML = "";
                fruits.forEach(fruit => {
                    let li = document.createElement("li");
                    li.textContent = `${fruit.nom} - ${fruit.quantité}`;
                    fruitList.appendChild(li);
                });
            }
        };
        xhr.send();
    });
     