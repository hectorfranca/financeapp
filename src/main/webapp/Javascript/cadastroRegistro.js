const form = document.getElementsByTagName('form')[0];
const registrarButton = document.getElementsByClassName("form-button__registrar")[0];
const inputNome = document.getElementById("input-nome");
const inputCategoria = document.getElementById("input-categoria");
const inputData = document.getElementById("input-data");
const inputValor = document.getElementById("input-valor");

registrarButton.addEventListener("click", () => {
    let labelNome = document.getElementsByClassName("label-nome")[0];
    let labelCategoria = document.getElementsByClassName("label-categoria")[0];
    let labelData = document.getElementsByClassName("label-data")[0];
    let labelValor = document.getElementsByClassName("label-valor")[0];
        
    if (inputNome.value == '') {      
        labelNome.classList.add("required-field-titulo");
        inputNome.classList.add("required-field-caixa");
    } else {
        labelNome.classList.remove("required-field-titulo");
        inputNome.classList.remove("required-field-caixa");
    }
    
    if (inputCategoria.value == '') {      
        labelCategoria.classList.add("required-field-titulo");
        inputCategoria.classList.add("required-field-caixa");
    } else {
        labelCategoria.classList.remove("required-field-titulo");
        inputCategoria.classList.remove("required-field-caixa");
    }
    
    if (inputData.value == '') {      
        labelData.classList.add("required-field-titulo");
        inputData.classList.add("required-field-caixa");
    } else {
        labelData.classList.remove("required-field-titulo");
        inputData.classList.remove("required-field-caixa");
    }
    
    if (inputValor.value == '') {      
        labelValor.classList.add("required-field-titulo");
        inputValor.classList.add("required-field-caixa");
    } else {
        labelValor.classList.remove("required-field-titulo");
        inputValor.classList.remove("required-field-caixa");
    }
    
    if (inputNome.value != '' && inputCategoria.value != ''
            && inputData.value != '' && inputValor.value != '') {       
        form.submit();
    }
});