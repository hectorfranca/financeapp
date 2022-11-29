const lista = document.getElementsByClassName("container-primario__container-secundario__lista")[0];
const itemLista = document.getElementsByClassName('item-lista');
const seletor = document.getElementsByClassName("seletor")[0];
const excluirButton = document.getElementById("excluir-button");
const editarButton = document.getElementById("editar-button");

let itemSelecionado = {
    id: null,
    nome: null
}

// Cor dos itens intercaladas
intercalarFundoItem();

// Exibir o menu de opcoes
for (let item of itemLista) {
    item.addEventListener("click", e => {
        if (e.target == item
            || e.target.parentNode == item
            || e.target.parentNode.parentNode == item) {
            seletor.classList.add("show");
            seletor.classList.remove("hidden");
            lista.style.marginBottom = "50px";
            
            // Realce de cor do item selecionado
            for (let item of itemLista) {
                item.style.backgroundColor = "white";
                item.style.transform = "scale(1)";
            }
            
            item.style.backgroundColor = "#FFDAB9";
            item.style.transform = "scale(1.05)";
            
            // Dados da categoria selecionada
            itemSelecionado.id = item.getElementsByClassName("id-categoria")[0].value;
            itemSelecionado.nome = item.getElementsByClassName("nome-categoria")[0].value; 
            
            seletor.getElementsByClassName("seletor-item__selecionado")[0].textContent = itemSelecionado.nome;
        }
    });
}

// Esconder o menu de opcoes 
document.addEventListener("click", e => {
    if (e.target.tagName == "HTML"
        || (e.target.parentNode != lista
        && e.target.parentNode.parentNode != lista
        && e.target.parentNode.parentNode.parentNode != lista

        && e.target != seletor
        && e.target.parentNode != seletor
        && e.target.parentNode.parentNode != seletor
        && e.target.parentNode.parentNode.parentNode != seletor)) {
        seletor.classList.add("hidden");
        seletor.classList.remove("show");
        lista.style.marginBottom = "0px";   

        // Realce de cor do item selecionado
        for (let item of itemLista) {
            item.style.backgroundColor = "white";
            item.style.transform = "scale(1)";
        }

        intercalarFundoItem();
    }
}); 

editarButton.addEventListener("click", () => { 
    window.location.href = "/financeapp/GoToFormCategoriaServlet?id=" + itemSelecionado.id
        + "&nome=" + itemSelecionado.nome;
});

excluirButton.addEventListener("click", () => {
    window.location.href = "/financeapp/DeleteCategoriaServlet?id=" + itemSelecionado.id;
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
