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
const voltarButton = document.getElementById("voltar-button");
const message = document.getElementsByClassName("message")[0];
const confirmacaoContainer = document.getElementById("confirmacao-container");

if (typeof message !== "undefined") {
    setTimeout(() => {
        message.classList.add("hidden");
    }, 5000);
}

let tipo = document.getElementsByClassName("tipo-registro")[0];

let itemSelecionado = {
    id: null,
    nome: null,
    categoria: null,
    data: null,
    valor: null,
    tipo: null
};

// Valor na cor verde para receitas e vermelho para despesas
if (typeof(tipo) !== "undefined") {
    if (tipo.value === "R") {
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
        if (e.target === item
            || e.target.parentNode === item
            || e.target.parentNode.parentNode === item
            || e.target.parentNode.parentNode.parentNode === item) {
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

voltarButton.addEventListener("click", () => {
   let voltarForm = document.getElementById("voltar-form") ;
   
   voltarForm.submit();
});

// Esconder o menu de opcoes 
document.addEventListener("click", e => {
    if ((e.target.tagName === "HTML" && typeof lista !== "undefined")
        || (e.target.parentNode !== lista
        && e.target.parentNode.parentNode !== lista
        && e.target.parentNode.parentNode.parentNode !== lista
        && e.target.parentNode.parentNode.parentNode.parentNode !== lista
        
        && e.target !== seletor
        && e.target.parentNode !== seletor
        && e.target.parentNode.parentNode !== seletor
        && e.target.parentNode.parentNode.parentNode !== seletor
        && typeof lista !== "undefined")) {
        seletor.classList.add("hidden");
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
    let idRegistro = document.getElementById("editar-id-registro");
    let nomeRegistro = document.getElementById("editar-nome-registro");
    let dataRegistro = document.getElementById("editar-data-registro");
    let categoriaRegistro = document.getElementById("editar-categoria-registro");
    let valorRegistro = document.getElementById("editar-valor-registro");
    let tipoRegistro = document.getElementById("editar-tipo-registro");
    let dataInicialForm = document.getElementById("editar-data-inicial");
    let dataFinalForm = document.getElementById("editar-data-final");
    let tipoListaForm = document.getElementById("editar-tipo-lista");
    let isOnRegister = document.getElementById("editar-is-on-register");
    
    idRegistro.value = itemSelecionado.id;
    nomeRegistro.value = itemSelecionado.nome;
    dataRegistro.value = itemSelecionado.data;
    categoriaRegistro.value = itemSelecionado.categoria;
    valorRegistro.value = itemSelecionado.valor;
    tipoRegistro.value = itemSelecionado.tipo;
    dataInicialForm.value = dataInicial.value;
    dataFinalForm.value = dataFinal.value;
    tipoListaForm.value = tipoLista.value;
    isOnRegister.value = "1";
    
    let editarRegistroForm = document.getElementById("editar-registro-form");
    
    editarRegistroForm.submit();
});

excluirButton.addEventListener("click", () => {
    confirmacaoContainer.classList.remove("hidden");
    
    document.getElementsByClassName("container-primario__container-secundario")[0].classList.add("hidden");
    voltarButton.classList.add("hidden");
    total.classList.add("hidden");
    seletor.classList.add("hidden");
    
    let confirmarExlusaoButton = document.getElementById("confirmar-exclusao-button");
    let cancelarExlusaoButton = document.getElementById("cancelar-exclusao-button");
    
    confirmarExlusaoButton.addEventListener("click", () => {             
        let idRegistro = document.getElementById("excluir-id-registro");
        let tipoRegistro = document.getElementById("excluir-tipo-registro");
        let dataInicialForm = document.getElementById("excluir-data-inicial");
        let dataFinalForm = document.getElementById("excluir-data-final");
        let tipoListaForm = document.getElementById("excluir-tipo-lista");

        idRegistro.value = itemSelecionado.id;
        tipoRegistro.value = itemSelecionado.tipo;
        dataInicialForm.value = dataInicial.value;
        dataFinalForm.value = dataFinal.value;
        tipoListaForm.value = tipoLista.value;

        let excluirRegistroForm = document.getElementById("excluir-registro-form");

        excluirRegistroForm.submit();
        
        confirmacaoContainer.classList.add("hidden");
    });
    
    cancelarExlusaoButton.addEventListener("click", () => {
        document.getElementsByClassName("container-primario__container-secundario")[0].classList.remove("hidden");
        voltarButton.classList.remove("hidden");
        total.classList.remove("hidden");
        seletor.classList.remove("hidden");
        confirmacaoContainer.classList.add("hidden");
    });
    
});

function intercalarFundoItem() {
    for (let c = 0; c < itemLista.length; c++) {
        if ((c % 2) === 0) {
            itemLista[c].style.backgroundColor = "white";
        } else {
            itemLista[c].style.backgroundColor = "#FFFACD";
        }
    }
}
