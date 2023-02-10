const loginFormButton = document.getElementById("login-form-button");
const labelEmail = document.getElementsByClassName("label-email")[0];
const inputEmail = document.getElementById("input-email");
const labelSenha = document.getElementsByClassName("label-senha")[0];
const inputSenha = document.getElementById("input-senha");
const message = document.getElementsByClassName("message")[0];

if (typeof message !== "undefined") {
    let statusMessage = document.getElementById("status-message");
    
    if (statusMessage.value === "success")
        message.style.color = "green";
    
    setTimeout(() => {
        message.classList.add("hidden");
    }, 5000);
}

loginFormButton.addEventListener("click", () => {
    let loginForm = document.getElementById("login-form");
   
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
    } else {
        labelSenha.classList.remove("required-field-titulo");
        inputSenha.classList.remove("required-field-caixa");
    }
    
    if (validaEmail() && validaSenha()) {
        loginForm.submit();
    }
});

function validaEmail() {
    if (inputEmail.value !== ''
        && /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(inputEmail.value)) {
            return true;
    }
    
    return false;
}

function validaSenha() {
    if (inputSenha.value !== '') {
            return true;
    }
    
    return false;
}

