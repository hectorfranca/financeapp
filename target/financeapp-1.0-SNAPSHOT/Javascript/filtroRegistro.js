const consultarButton = document.getElementsByClassName("form-button__caixa")[0];
const dateInicial = document.getElementsByClassName("date-inicial")[0];
const dateFinal = document.getElementsByClassName("date-final")[0];
const radioCompleta = document.getElementsByClassName("radio-completa")[0];
const radioResumida = document.getElementsByClassName("radio-resumida")[0];
const form = document.getElementsByTagName('form')[0];

consultarButton.addEventListener("click", () => {
    let optionTitulo = document.getElementsByClassName("form-option__caixa__titulo")[0];
    let optionCaixa = document.getElementsByClassName("form-option")[0];  
    let dataInicialTitulo = document.getElementsByClassName("form-calendario__inicial__titulo")[0];
    let dataInicialCaixa = document.getElementsByClassName("form-calendario__inicial")[0];
    let dataFinalTitulo = document.getElementsByClassName("form-calendario__final__titulo")[0];
    let dataFinalCaixa = document.getElementsByClassName("form-calendario__final")[0];
        
    if (!radioCompleta.checked && !radioResumida.checked) {      
        optionTitulo.classList.add("required-field-titulo");
        optionCaixa.classList.add("required-field-caixa");
    } else {
        optionTitulo.classList.remove("required-field-titulo");
        optionCaixa.classList.remove("required-field-caixa");
    }
    
    if (dateInicial.value === '') {      
        dataInicialTitulo.classList.add("required-field-titulo");
        dataInicialCaixa.classList.add("required-field-caixa");
    } else {
        dataInicialTitulo.classList.remove("required-field-titulo");
        dataInicialCaixa.classList.remove("required-field-caixa");
    }
    
    if (dateFinal.value === '') {      
        dataFinalTitulo.classList.add("required-field-titulo");
        dataFinalCaixa.classList.add("required-field-caixa");
    } else {
        dataFinalTitulo.classList.remove("required-field-titulo");
        dataFinalCaixa.classList.remove("required-field-caixa");
    }
    
    if ((radioCompleta.checked || radioResumida.checked)
            && (dateInicial.value !== '') && (dateFinal.value !== '')) {       
        form.submit();
    }
});