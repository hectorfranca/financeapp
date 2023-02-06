const loginFormButton = document.getElementById("login-form-button");
const labelEmail = document.getElementsByClassName("label-email")[0];
const inputEmail = document.getElementById("input-email");
const labelSenha = document.getElementsByClassName("label-senha")[0];
const inputSenha = document.getElementById("input-senha");
const message = document.getElementsByClassName("message")[0];

if (typeof message != "undefined") {
    setTimeout(() => {
        message.classList.add("hidden");
    }, 5000);
}

loginFormButton.addEventListener("click", () => {
    let loginForm = document.getElementById("login-form");
   
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
    
    if (inputEmail.value != '' && inputSenha.value != '') {
        loginForm.submit();
    }
});


