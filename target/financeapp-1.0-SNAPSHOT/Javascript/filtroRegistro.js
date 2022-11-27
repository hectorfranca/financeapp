const consultarButton = document.getElementsByClassName("form-button__caixa")[0];
const dateInicial = document.getElementsByClassName("date-inicial")[0];
const dateFinal = document.getElementsByClassName("date-final")[0];
const radioCompleta = document.getElementsByClassName("radio-completa")[0];
const radioResumida = document.getElementsByClassName("radio-resumida")[0];
const form = document.getElementsByTagName('form')[0];

consultarButton.addEventListener("click", () => {
    if ((radioCompleta.checked || radioResumida.checked)
            && (dateInicial.value != '') && (dateFinal.value != '')) {       
        form.submit();
    }
});