const registrarFormButton = document.getElementById("registrar-form-button");
const labelNome = document.getElementsByClassName("label-nome")[0];
const inputNome = document.getElementById("input-nome");
const labelEmail = document.getElementsByClassName("label-email")[0];
const inputEmail = document.getElementById("input-email");
const labelSenha = document.getElementsByClassName("label-senha")[0];
const inputSenha = document.getElementById("input-senha");
const labelSenhaConfirmacao = document.getElementsByClassName("label-senha-confirmacao")[0];
const inputSenhaConfirmacao = document.getElementById("input-senha-confirmacao");

registrarFormButton.addEventListener("click", () => {
   let registrarForm = document.getElementById("registrar-form");
   
    if (inputNome.value == '') {      
        labelNome.classList.add("required-field-titulo");
        inputNome.classList.add("required-field-caixa");
    } else {
        labelNome.classList.remove("required-field-titulo");
        inputNome.classList.remove("required-field-caixa");
    }
    
    if (inputEmail.value == '') {      
        labelEmail.classList.add("required-field-titulo");
        inputEmail.classList.add("required-field-caixa");
    } else {
        labelEmail.classList.remove("required-field-titulo");
        inputEmail.classList.remove("required-field-caixa");
    }
    
    if (inputSenha.value == '') {      
        labelSenha.classList.add("required-field-titulo");
        inputSenha.classList.add("required-field-caixa");
    } else {
        labelSenha.classList.remove("required-field-titulo");
        inputSenha.classList.remove("required-field-caixa");
    }
    
    if (inputSenhaConfirmacao.value == '' || inputSenhaConfirmacao.value != inputSenha.value) {      
        labelSenhaConfirmacao.classList.add("required-field-titulo");
        inputSenhaConfirmacao.classList.add("required-field-caixa");
    } else {
        labelSenhaConfirmacao.classList.remove("required-field-titulo");
        inputSenhaConfirmacao.classList.remove("required-field-caixa");
    }  
    
    if (inputNome.value != '' && inputEmail.value != '' && inputSenha.value != '' 
            && inputSenhaConfirmacao.value == inputSenha.value) {
        registrarForm.submit();
    }
});


