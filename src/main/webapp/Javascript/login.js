const loginFormButton = document.getElementById("login-form-button");
const labelNome = document.getElementsByClassName("label-nome")[0];
const inputNome = document.getElementById("input-nome");
const labelSenha = document.getElementsByClassName("label-senha")[0];
const inputSenha = document.getElementById("input-senha");

loginFormButton.addEventListener("click", () => {
    let loginForm = document.getElementById("login-form");
   
    if (inputNome.value == '') {      
        labelNome.classList.add("required-field-titulo");
        inputNome.classList.add("required-field-caixa");
    } else {
        labelNome.classList.remove("required-field-titulo");
        inputNome.classList.remove("required-field-caixa");
    }
    
    if (inputSenha.value == '') {      
        labelSenha.classList.add("required-field-titulo");
        inputSenha.classList.add("required-field-caixa");
    } else {
        labelSenha.classList.remove("required-field-titulo");
        inputSenha.classList.remove("required-field-caixa");
    }
    
    if (inputNome.value != '' && inputSenha.value != '') {
        loginForm.submit();
    }
});


