const registrarForm = document.getElementById("registrar-form");
const registrarButton = document.getElementsByClassName("form-button__registrar")[0];
const inputNome = document.getElementById("input-nome");
const voltarButton = document.getElementById("voltar-button");

if (voltarButton !== null) {
    voltarButton.addEventListener("click", () => {
        let voltarForm = document.getElementById("voltar-form");

        voltarForm.submit();
    });
}

registrarButton.addEventListener("click", () => {
    let labelNome = document.getElementsByClassName("label-nome")[0];
        
    if (inputNome.value === '') {      
        labelNome.classList.add("required-field-titulo");
        inputNome.classList.add("required-field-caixa");
    } else {
        registrarForm.submit();
    }
});