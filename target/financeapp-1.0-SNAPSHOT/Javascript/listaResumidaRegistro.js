const itemEntradas = document.getElementsByClassName('itemEntradas');
const valorRegistroSpan = document.getElementsByClassName("valorRegistroSpan");

let tipo = document.getElementsByClassName("tipoRegistro")[0];

// Valor na cor verde para receitas e vermelho para despesas
if (typeof(tipo) != "undefined") {
    if (tipo.value == "R") {
        for (let valor of valorRegistroSpan) {
            valor.style.color = "green";   
        }
    } else {
        for (let valor of valorRegistroSpan) {
            valor.style.color = "red";   
        }
    }
}

// Cor dos itens intercaladas
for (let c = 0; c < itemEntradas.length; c++) {
    if ((c % 2) == 0) {
        itemEntradas[c].style.backgroundColor = "white";
    } else {
        itemEntradas[c].style.backgroundColor = "#FFFACD";
    }
}

