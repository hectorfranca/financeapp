const salvarRegistroForm = document.getElementById('salvar-registro-form');
const registrarButton = document.getElementsByClassName("form-button__registrar")[0];
const inputNome = document.getElementById("input-nome");
const inputCategoria = document.getElementById("input-categoria");
const inputData = document.getElementById("input-data");
const inputValor = document.getElementById("input-valor");
const addCategoriaButton = document.getElementsByClassName("button-add-categoria")[0];
const voltarButtonForm = document.getElementById("voltar-button-form");
const message = document.getElementsByClassName("message")[0];

if (typeof message !== "undefined") {
    setTimeout(() => {
        message.classList.add("hidden");
    }, 5000);
}

if (voltarButtonForm !== null) {
    voltarButtonForm.addEventListener("click", () => {
       let voltarForm = document.getElementById("voltar-form");
       voltarForm.submit();
    });
}

addCategoriaButton.addEventListener("click", () => {
   let addCategoriaForm = document.getElementById("add-categoria-form");
   addCategoriaForm.submit();
});

registrarButton.addEventListener("click", () => {
    let labelNome = document.getElementsByClassName("label-nome")[0];
    let labelCategoria = document.getElementsByClassName("label-categoria")[0];
    let labelData = document.getElementsByClassName("label-data")[0];
    let labelValor = document.getElementsByClassName("label-valor")[0];
        
    if (!validaNome()) {      
        labelNome.classList.add("required-field-titulo");
        inputNome.classList.add("required-field-caixa");
    } else {
        labelNome.classList.remove("required-field-titulo");
        inputNome.classList.remove("required-field-caixa");
    }
    
    if (!validaCategoria()) {      
        labelCategoria.classList.add("required-field-titulo");
        inputCategoria.classList.add("required-field-caixa");
    } else {
        labelCategoria.classList.remove("required-field-titulo");
        inputCategoria.classList.remove("required-field-caixa");
    }
    
    if (!validaData()) {      
        labelData.classList.add("required-field-titulo");
        inputData.classList.add("required-field-caixa");
    } else {
        labelData.classList.remove("required-field-titulo");
        inputData.classList.remove("required-field-caixa");
    }
    
    if (!validaValor()) {      
        labelValor.classList.add("required-field-titulo");
        inputValor.classList.add("required-field-caixa");
    } else {
        labelValor.classList.remove("required-field-titulo");
        inputValor.classList.remove("required-field-caixa");
    }
    
    if (validaNome() && validaCategoria() && validaData() && validaValor()) {       
        salvarRegistroForm.submit();
    }
});

function validaNome() {
    if (inputNome.value !== '') {
        return true;
    }
    
    return false;
}

function validaCategoria() {
    if (inputCategoria.value !== '') {
        return true;
    }
    
    return false;
}

function validaData() {
    if (inputData.value !== '') {
        return true;
    }
    
    return false;
}

function validaValor() {
    if (inputValor.value !== '') {
        return true;
    }
    
    return false;
}