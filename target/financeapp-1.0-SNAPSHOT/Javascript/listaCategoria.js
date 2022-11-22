const itemEntradas = document.getElementsByClassName('itemEntradas');
const seletorEntradas = document.getElementsByClassName("seletorEntradas")[0];
const listaEntradas = document.getElementsByClassName("listaEntradas")[0];
const btnExcluir = document.getElementById("btnExcluir");
const btnEditar = document.getElementById("btnEditar");

let categoriaSelecionada = {
    id: null,
    nome: null
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
            || e.target.parentNode.parentNode == item) {
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
            
            // Dados da categoria selecionada
            categoriaSelecionada.id = item.getElementsByClassName("idCategoria")[0].value;
            categoriaSelecionada.nome = item.getElementsByClassName("nomeCategoria")[0].value; 
            
            seletorEntradas.getElementsByClassName("itemSelecionado")[0].textContent = categoriaSelecionada.nome;
        }
    });
}

// Esconder o menu de opcoes 
document.addEventListener("click", e => {
    if (e.target.parentNode != listaEntradas
        && e.target.parentNode.parentNode != listaEntradas
        && e.target.parentNode.parentNode.parentNode != listaEntradas
        
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
    window.location.href = "/financeapp/GoToFormCategoriaServlet?id=" + categoriaSelecionada.id
        + "&nome=" + categoriaSelecionada.nome;
});

btnExcluir.addEventListener("click", () => {
    window.location.href = "/financeapp/DeleteCategoriaServlet?id=" + categoriaSelecionada.id;
});

