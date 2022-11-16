const itemDespesas = document.getElementsByClassName('itemDespesas');
const valorDespesas = document.getElementsByClassName("valorDespesas");

let tipo = document.getElementsByClassName("tipoRegistro")[0].value;

if (tipo == "R") {
    for (let valor of valorDespesas) {
        valor.style.color = "green";   
    }
}

for (let c = 0; c < itemDespesas.length; c++) {
    if ((c % 2) == 0) {
        itemDespesas[c].style.backgroundColor = "white";
    } else {
        itemDespesas[c].style.backgroundColor = "#FFFACD";
    }
}