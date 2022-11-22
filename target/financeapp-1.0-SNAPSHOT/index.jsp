<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FinanceApp</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/Components/header.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/Components/footer.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/index.css"/>     
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    </head>
    <body>        
        <jsp:include page="/Components/header.jsp"/>
        
        <div class="containerPrincipal">
            <div  class="subTitulo">
                <a>O seu app de finanças totalmente descomplicado!</a>  
            </div>
            <div class="btn">
                <a class=" caixaBtn btn-efeito " data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                    <h3 class="contBtnTitulo">Entradas</h3>  
                </a> 
            </div>
            <div class="collapse" id="collapseExample">
                <div class="btn">
                    <a class=" subCaixaBtn btn-efeito" 
                        href="GoToFormRegistroServlet?tipo=R">
                        <h3 class="contBtnTitulo">Cadastro</h3>  
                    </a> 
                </div>
                <div class="btn">
                    <a class="subCaixaBtn btn-efeito" href="${pageContext.request.contextPath}/Pages/filtroRegistro.jsp">
                        <h3 class="contBtnTitulo">Relatório</h3>   
                    </a>
                </div>
            </div>
            <div class="btn entrada-item">
                <a class="caixaBtn btn-efeito" data-toggle="collapse" href="#collapseExample2" role="button" aria-expanded="false" aria-controls="collapseExample">
                    <h3 class="contBtnTitulo">Despesas</h3>   
                </a>
            </div>
            <div class="collapse" id="collapseExample2">
                <div class="btn entrada-item">
                    <a class=" subCaixaBtn btn-efeito" href="cadRegistroDespesas.html">
                        <h3 class="contBtnTitulo">Cadastro</h3>  
                    </a> 
                </div>
                <div class="btn">
                    <a class="subCaixaBtn btn-efeito" href="filtroDespesasTela.html">
                        <h3 class="contBtnTitulo">Relatório</h3>   
                    </a>
                </div>
            </div>
            <div class="btn btnConfig">
                <a class="caixaBtn btn-efeito" data-toggle="collapse" href="#collapseExample3" role="button" aria-expanded="false" aria-controls="collapseExample">
                    <h3 class="contBtnTitulo">Sistemas</h3>   
                </a>
            </div>
            <div class="collapse" id="collapseExample3">
                <div class="btn">
                    <a class="subCaixaBtn btn-efeito" href="listaCategoria.html">
                        <h3 class="contBtnTitulo">Categorias Cadastradas</h3>  
                    </a> 
                </div>
                <div class="btn">
                    <a class="subCaixaBtn btn-efeito" href="#">
                        <h3 class="contBtnTitulo">Contate-nos</h3>   
                    </a>
                </div>
            </div>              
        </div>

        <jsp:include page="/Components/footer.jsp"/>
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
                integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
                crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
                integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
                crossorigin="anonymous"></script>
    </body>
</html>