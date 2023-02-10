const redefinirSenhaFormButton = document.getElementById("redefinir-senha-form-button");
const labelSenha = document.getElementsByClassName("label-senha")[0];
const inputSenha = document.getElementById("input-senha");
const labelSenhaConfirmacao = document.getElementsByClassName("label-senha-confirmacao")[0];
const inputSenhaConfirmacao = document.getElementById("input-senha-confirmacao");

if (redefinirSenhaFormButton != null) {
    redefinirSenhaFormButton.addEventListener("click", () => {
        let redefinirSenhaForm = document.getElementById("redefinir-senha-form");

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

        if (inputSenha.value != '' && inputSenhaConfirmacao.value == inputSenha.value) {
            redefinirSenhaForm.submit();
        }
    });
}


