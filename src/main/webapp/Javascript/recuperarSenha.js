const recuperarSenhaFormButton = document.getElementById("recuperar-senha-form-button");
const labelEmail = document.getElementsByClassName("label-email")[0];
const inputEmail = document.getElementById("input-email");

if (recuperarSenhaFormButton !== null) {
    recuperarSenhaFormButton.addEventListener("click", () => {
        let recuperarSenhaForm = document.getElementById("recuperar-senha-form");

        if (inputEmail.value === '') {      
            labelEmail.classList.add("required-field-titulo");
            inputEmail.classList.add("required-field-caixa");
        } else {
            labelEmail.classList.remove("required-field-titulo");
            inputEmail.classList.remove("required-field-caixa");
        }

        if (inputEmail.value !== '') {
            recuperarSenhaForm.submit();
        }
    });
}


