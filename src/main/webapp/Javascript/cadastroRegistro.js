const form = document.getElementsByTagName('form')[0];
const registrarButton = document.getElementsByClassName("form-button__registrar")[0];
const inputNome = document.getElementById("input-nome");
const inputValor = document.getElementById("input-valor");

registrarButton.addEventListener("click", () => {
    let labelNome = document.getElementsByClassName("label-nome")[0];
    let labelValor = document.getElementsByClassName("label-valor")[0];
        
    if (inputNome.value == '') {      
        labelNome.classList.add("required-field-titulo");
        inputNome.classList.add("required-field-caixa");
    } else {
        labelNome.classList.remove("required-field-titulo");
        inputNome.classList.remove("required-field-caixa");
    }
    
    if (inputValor.value == '') {      
        labelValor.classList.add("required-field-titulo");
        inputValor.classList.add("required-field-caixa");
    } else {
        labelValor.classList.remove("required-field-titulo");
        inputValor.classList.remove("required-field-caixa");
    }
    
    if (inputNome.value != '' && inputValor.value != '') {       
        form.submit();
    }
});