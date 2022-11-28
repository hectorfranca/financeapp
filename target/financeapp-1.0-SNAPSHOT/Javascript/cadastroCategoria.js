const form = document.getElementsByTagName("form")[0];
const registrarButton = document.getElementsByClassName("form-button__registrar")[0];
const inputNome = document.getElementById("input-nome");

registrarButton.addEventListener("click", () => {
    let labelNome = document.getElementsByClassName("label-nome")[0];
        
    if (inputNome.value == '') {      
        labelNome.classList.add("required-field-titulo");
        inputNome.classList.add("required-field-caixa");
    } else {
        form.submit();
    }
});