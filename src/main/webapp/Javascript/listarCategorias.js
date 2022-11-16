const itemDespesas = document.getElementsByClassName('itemDespesas');

for (let c = 0; c < itemDespesas.length; c++) {
    if ((c % 2) == 0) {
        itemDespesas[c].style.backgroundColor = "white";
    } else {
        itemDespesas[c].style.backgroundColor = "#FFFACD";
    }
}


