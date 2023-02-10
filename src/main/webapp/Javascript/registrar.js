const registrarFormButton = document.getElementById("registrar-form-button");
const labelNome = document.getElementsByClassName("label-nome")[0];
const inputNome = document.getElementById("input-nome");
const labelEmail = document.getElementsByClassName("label-email")[0];
const inputEmail = document.getElementById("input-email");
const labelSenha = document.getElementsByClassName("label-senha")[0];
const inputSenha = document.getElementById("input-senha");
const labelSenhaConfirmacao = document.getElementsByClassName("label-senha-confirmacao")[0];
const inputSenhaConfirmacao = document.getElementById("input-senha-confirmacao");
const message = document.getElementsByClassName("message")[0];

if (typeof message !== "undefined") {
    setTimeout(() => {
        message.classList.add("hidden");
    }, 5000);
}

registrarFormButton.addEventListener("click", () => {
   let registrarForm = document.getElementById("registrar-form");
   
    if (!validaNome()) {    
        labelNome.classList.add("required-field-titulo");
        inputNome.classList.add("required-field-caixa");
    } else {
        labelNome.classList.remove("required-field-titulo");
        inputNome.classList.remove("required-field-caixa");
    }
    
    if (!validaEmail()) {      
        labelEmail.classList.add("required-field-titulo");
        inputEmail.classList.add("required-field-caixa");
    } else {
        labelEmail.classList.remove("required-field-titulo");
        inputEmail.classList.remove("required-field-caixa");
    }
    
    if (!validaSenha()) {      
        labelSenha.classList.add("required-field-titulo");
        inputSenha.classList.add("required-field-caixa");
        labelSenhaConfirmacao.classList.add("required-field-titulo");
        inputSenhaConfirmacao.classList.add("required-field-caixa");
    } else {
        labelSenha.classList.remove("required-field-titulo");
        inputSenha.classList.remove("required-field-caixa");
        labelSenhaConfirmacao.classList.remove("required-field-titulo");
        inputSenhaConfirmacao.classList.remove("required-field-caixa");
    }
    
    if (validaNome() && validaEmail() && validaSenha()) {
        registrarForm.submit();
    }
});

function validaNome() {
    if (inputNome.value !== '' && inputNome.value.length >= 4 && inputNome.value.length <= 20) {
        return true;
    }
    
    return false;
}

function validaEmail() {
    if (inputEmail.value !== '' && inputEmail.value.length <= 100
            && /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(inputEmail.value)) {
        return true;
    }
    
    return false;
}

function validaSenha() {
    if (inputSenha.value !== '' && inputSenha.value.length >= 6 && inputSenha.value.length <= 16
            && inputSenhaConfirmacao.value === inputSenha.value) {
        return true;
    }
    
    return false;
}

