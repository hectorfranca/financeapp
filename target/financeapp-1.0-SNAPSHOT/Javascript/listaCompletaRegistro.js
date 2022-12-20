const itemLista = document.getElementsByClassName('item-lista');
const conteudoValor = document.getElementsByClassName("item-lista__valor__conteudo");
const total = document.getElementsByClassName("valor-total")[0];
const valorTotal = document.getElementsByClassName("valor-total-item__valor")[0];
const seletor = document.getElementsByClassName("seletor")[0];
const lista = document.getElementsByClassName("container-primario__container-secundario__lista")[0];
const excluirButton = document.getElementById("excluir-button");
const editarButton = document.getElementById("editar-button");
const dataInicial = document.getElementsByClassName("data-inicial")[0];
const dataFinal = document.getElementsByClassName("data-final")[0];
const tipoLista = document.getElementsByClassName("tipo-lista")[0];

let tipo = document.getElementsByClassName("tipo-registro")[0];

let itemSelecionado = {
    id: null,
    nome: null,
    categoria: null,
    data: null,
    valor: null,
    tipo: null
}

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

// Exibir o menu de opcoes
for (let item of itemLista) {
    item.addEventListener("click", e => {
        if (e.target == item
            || e.target.parentNode == item
            || e.target.parentNode.parentNode == item
            || e.target.parentNode.parentNode.parentNode == item) {
            seletor.classList.add("show");
            seletor.classList.remove("hidden");
            lista.style.marginBottom = "50px";
            total.style.marginBottom = "100px";
            
            // Realce de cor do item selecionado
            for (let item of itemLista) {
                item.style.backgroundColor = "white";
                item.style.transform = "scale(1)";
            }
            
            item.style.backgroundColor = "#FFDAB9";
            item.style.transform = "scale(1.05)";
            
            // Dados do registro selecionado
            itemSelecionado.id = item.getElementsByClassName("id-registro")[0].value;
            itemSelecionado.nome = item.getElementsByClassName("nome-registro")[0].value;
            itemSelecionado.categoria = item.getElementsByClassName("categoria-registro")[0].value;
            itemSelecionado.data = item.getElementsByClassName("data-registro")[0].value;
            itemSelecionado.valor = item.getElementsByClassName("valor-registro")[0].value;
            itemSelecionado.tipo = item.getElementsByClassName("tipo-registro")[0].value;    
              
            seletor.getElementsByClassName("seletor-item__selecionado")[0].textContent = itemSelecionado.nome;
        }
    });
}

// Esconder o menu de opcoes 
document.addEventListener("click", e => {
    if ((e.target.tagName == "HTML" && typeof lista != "undefined")
        || (e.target.parentNode != lista
        && e.target.parentNode.parentNode != lista
        && e.target.parentNode.parentNode.parentNode != lista
        && e.target.parentNode.parentNode.parentNode.parentNode != lista
        
        && e.target != seletor
        && e.target.parentNode != seletor
        && e.target.parentNode.parentNode != seletor
        && e.target.parentNode.parentNode.parentNode != seletor
        && typeof lista != "undefined")) {
        seletor.classList.add("hidden");
        seletor.classList.remove("show");
        lista.style.marginBottom = "0px";
        total.style.marginBottom = "50px";
        
        // Realce de cor do item selecionado
        for (let item of itemLista) {
            item.style.backgroundColor = "white";
            item.style.transform = "scale(1)";
        }
        
        intercalarFundoItem();
    }
}); 

editarButton.addEventListener("click", () => { 
    window.location.href = "/financeapp/GoToFormRegistroServlet?id=" + itemSelecionado.id
        + "&nome=" + itemSelecionado.nome + "&categoria=" + itemSelecionado.categoria
        + "&data=" + itemSelecionado.data + "&valor=" + itemSelecionado.valor
        + "&tipo=" + itemSelecionado.tipo
        + "&dataInicial=" + dataInicial.value + "&dataFinal=" + dataFinal.value
        + "&tipoLista=" + tipoLista.value + "&isOnListRegister=1";
});

excluirButton.addEventListener("click", () => {
    window.location.href = "/financeapp/DeleteRegistroServlet?id=" + itemSelecionado.id
        + "&tipo=" + itemSelecionado.tipo
        + "&dataInicial=" + dataInicial.value + "&dataFinal=" + dataFinal.value
        + "&tipoLista=" + tipoLista.value;
});

function intercalarFundoItem() {
    for (let c = 0; c < itemLista.length; c++) {
        if ((c % 2) == 0) {
            itemLista[c].style.backgroundColor = "white";
        } else {
            itemLista[c].style.backgroundColor = "#FFFACD";
        }
    }
}
