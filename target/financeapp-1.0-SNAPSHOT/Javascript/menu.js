const registrarReceitaButton = document.getElementById("registrar-receita");
const consultarReceitaButton = document.getElementById("consultar-receita");
const registrarDespesaButton = document.getElementById("registrar-despesa");
const consultarDespesaButton = document.getElementById("consultar-despesa");

registrarReceitaButton.addEventListener("click", () => {
   let addReceitaForm = document.getElementById("registrar-receita-form");
   addReceitaForm.submit();
});

consultarReceitaButton.addEventListener("click", () => {
   let consultarReceitaForm = document.getElementById("consultar-receita-form");
   consultarReceitaForm.submit();
});

registrarDespesaButton.addEventListener("click", () => {
   let registrarDespesaForm = document.getElementById("registrar-despesa-form");
   registrarDespesaForm.submit();
});

consultarDespesaButton.addEventListener("click", () => {
   let consultarDespesaForm = document.getElementById("consultar-despesa-form");
  consultarDespesaForm.submit();
});


