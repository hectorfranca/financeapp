const itemEntradas = document.getElementsByClassName('itemEntradas');
const valorRegistroSpan = document.getElementsByClassName("valorRegistroSpan");
const seletorEntradas = document.getElementsByClassName("seletorEntradas")[0];
const listaEntradas = document.getElementsByClassName("listaEntradas")[0];
const btnExcluir = document.getElementById("btnExcluir");
const btnEditar = document.getElementById("btnEditar");

let tipo = document.getElementsByClassName("tipoRegistro")[0].value;

let registroSelecionado = {
    id: null,
    nome: null,
    categoria: null,
    data: null,
    valor: null,
    tipo: null
}

// Valor na cor verde para receitas e vermelho para despesas
if (tipo == "R") {
    for (let valor of valorRegistroSpan) {
        valor.style.color = "green";   
    }
} else {
    for (let valor of valorRegistroSpan) {
        valor.style.color = "red";   
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

// Exibir o menu de opcoes
for (let item of itemEntradas) {
    item.addEventListener("click", e => {
        if (e.target == item
            || e.target.parentNode == item
            || e.target.parentNode.parentNode == item
            || e.target.parentNode.parentNode.parentNode == item) {
            seletorEntradas.classList.add("show-menu");
            seletorEntradas.classList.remove("hidden-menu");
            listaEntradas.style.marginBottom = "50px";
            
            // Realce de cor do item selecionado
            for (let item of itemEntradas) {
                item.style.backgroundColor = "white";
                item.style.transform = "scale(1)";
            }
            
            item.style.backgroundColor = "#FFDAB9";
            item.style.transform = "scale(1.05)";
            
            // Dados do registro selecionado
            registroSelecionado.id = item.getElementsByClassName("idRegistro")[0].value;
            registroSelecionado.nome = item.getElementsByClassName("nomeRegistro")[0].value;
            registroSelecionado.categoria = item.getElementsByClassName("categoriaRegistro")[0].value;
            registroSelecionado.data = item.getElementsByClassName("dataRegistro")[0].value;
            registroSelecionado.valor = item.getElementsByClassName("valorRegistro")[0].value;
            registroSelecionado.tipo = item.getElementsByClassName("tipoRegistro")[0].value;    
            
            let nomeSelecionado = item.getElementsByClassName("nomeRegistro")[0].value;   
            seletorEntradas.getElementsByClassName("itemSelecionado")[0].textContent = nomeSelecionado;
        }
    });
}

// Esconder o menu de opcoes 
document.addEventListener("click", e => {
    if (e.target.parentNode != listaEntradas
        && e.target.parentNode.parentNode != listaEntradas
        && e.target.parentNode.parentNode.parentNode != listaEntradas
        && e.target.parentNode.parentNode.parentNode.parentNode != listaEntradas
        
        && e.target != seletorEntradas
        && e.target.parentNode != seletorEntradas
        && e.target.parentNode.parentNode != seletorEntradas
        && e.target.parentNode.parentNode.parentNode != seletorEntradas) {
        seletorEntradas.classList.add("hidden-menu");
        seletorEntradas.classList.remove("show-menu");
        listaEntradas.style.marginBottom = "0px";   
        
        // Realce de cor do item selecionado
        for (let item of itemEntradas) {
            item.style.backgroundColor = "white";
            item.style.transform = "scale(1)";
        }
    }
}); 

btnEditar.addEventListener("click", () => { 
    window.location.href ="/financeapp/GoToFormRegistroServlet?id=" + registroSelecionado.id
        + "&nome=" + registroSelecionado.nome + "&categoria=" + registroSelecionado.categoria
        + "&data=" + registroSelecionado.data + "&valor=" + registroSelecionado.valor
        + "&tipo=" + registroSelecionado.tipo;
});

btnExcluir.addEventListener("click", () => {
    window.location.href = `/financeapp/DeleteRegistroServlet?id=${registroSelecionado.id}`;
});

