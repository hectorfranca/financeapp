<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FinanceApp</title>
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/logo.png">
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
        
        <div class="container">
            <h1 class="container__titulo">O seu app de finanças totalmente descomplicado!</h1>  
            <div class="btn-primario">
                <a class="btn-primario__caixa btn-primario--efeito " data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                    <span class="btn-primario__caixa__titulo">Receitas</span>  
                </a>
            </div>
            <div class="collapse" id="collapseExample">
                <form action="${pageContext.request.contextPath}/GoToFormRegistroServlet" method="POST" id="registrar-receita-form" class="btn-secundario">
                    <input type="hidden" name="tipo" value="R">
                    <a id="registrar-receita" class="btn-secundario__caixa btn-secundario--efeito">
                        <span class="btn-secundario__caixa__titulo">Registrar</span> 
                    </a>
                </form>
                <form action="${pageContext.request.contextPath}/GoToFiltroRegistroServlet" method="POST" id="consultar-receita-form" class="btn-secundario">
                    <input type="hidden" name="tipo" value="R">
                    <a id="consultar-receita" class="btn-secundario__caixa btn-secundario--efeito">
                        <span class="btn-secundario__caixa__titulo">Consultar</span>   
                    </a>
                </form>
            </div>
            <div class="btn-primario">
                <a class="btn-primario__caixa btn-primario--efeito" data-toggle="collapse" href="#collapseExample2" role="button" aria-expanded="false" aria-controls="collapseExample">
                    <span class="btn-primario__caixa__titulo">Despesas</span>   
                </a>
            </div>
            <div class="collapse" id="collapseExample2">
                <form action="${pageContext.request.contextPath}/GoToFormRegistroServlet" method="POST" id="registrar-despesa-form" class="btn-secundario entrada-item">
                    <input type="hidden" name="tipo" value="D">
                    <a id="registrar-despesa" class="btn-secundario__caixa btn-secundario--efeito">
                        <span class="btn-secundario__caixa__titulo">Registrar</span>
                    </a>
                </form>
                <form action="${pageContext.request.contextPath}/GoToFiltroRegistroServlet" method="POST" id="consultar-despesa-form" class="btn-secundario">
                    <input type="hidden" name="tipo" value="D">
                    <a id="consultar-despesa" class="btn-secundario__caixa btn-secundario--efeito">
                        <span class="btn-secundario__caixa__titulo">Consultar</span>
                    </a>
                </form>
            </div>
            <div class="btn-primario">
                <a class="btn-primario__caixa btn-primario--efeito" data-toggle="collapse" href="#collapseExample3" role="button" aria-expanded="false" aria-controls="collapseExample">
                    <span class="btn-primario__caixa__titulo">Sistema</span>   
                </a>
            </div>
            <div class="collapse" id="collapseExample3">
                <div class="btn-secundario">
                    <a class="btn-secundario__caixa btn-secundario--efeito" href="${pageContext.request.contextPath}/ListCategoriaServlet">
                        <span class="btn-secundario__caixa__titulo">Categorias</span>  
                    </a> 
                </div>
                <div class="btn-secundario">
                    <a class="btn-secundario__caixa btn-secundario--efeito" href="${pageContext.request.contextPath}/Pages/contato.jsp">
                        <span class="btn-secundario__caixa__titulo">Contato</span>
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
        <script src="${pageContext.request.contextPath}/Javascript/index.js"></script>
    </body>
</html>