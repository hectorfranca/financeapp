const itemLista = document.getElementsByClassName('item-lista');
const conteudoValor = document.getElementsByClassName("item-lista__valor__conteudo");
const valorTotal = document.getElementsByClassName("valor-total-item__valor")[0];

let tipo = document.getElementsByClassName("tipo-registro")[0];

// Valor na cor verde para receitas e vermelho para despesas
if (typeof(tipo) != "undefined") {
    if (tipo.value == "R") {
        for (let valor of conteudoValor) {
            valor.style.color = "green";   
        }
        
        valorTotal.style.color = "green";
    } else {
        for (let valor of conteudoValor) {
            valor.style.color = "red";   
        }
        
        valorTotal.style.color = "red";
    }
}

// Cor dos itens intercaladas
intercalarFundoItem();

function intercalarFundoItem() {
    for (let c = 0; c < itemLista.length; c++) {
        if ((c % 2) == 0) {
            itemLista[c].style.backgroundColor = "white";
        } else {
            itemLista[c].style.backgroundColor = "#FFFACD";
        }
    }
}
