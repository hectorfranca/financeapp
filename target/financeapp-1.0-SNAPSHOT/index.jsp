<%-- 
    Author     : Hector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FinanceApp</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/index.css"/>
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    </head>
    <body>  
        <header class="titulo fixed-top">
            <img class="Logo" src="${pageContext.request.contextPath}/img/logo.png" alt="FotoDinheiro"/>
            <h1 class="subTitulo">
                Financeapp - o seu app de entradas e saídas <br> 
                totalmente descomplicado!
            </h1>    
        </header>
        <div class="container">
            <div class="buttonX">
                <button class="caixaButton">
                    Registro de<br>
                    Despesas
                </button>
            </div>                                 
            <div class="buttonX">
                <button class="caixaButton">
                    Registro de<br>
                    Entradas
                </button>
            </div>                             
            <div class="buttonX">
                <button class="caixaButton" onclick="window.location.href='ListRegistroServlet?tipo=D'">
                    Relatório de<br>
                    Despesas
                </button>
            </div>                      
            <div class="buttonX">
                <button class="caixaButton" onclick="window.location.href='ListRegistroServlet?tipo=R'">
                    Relatório de<br>
                    Entradas
                </button>
            </div>               
            <div class="buttonX">
                <button class="caixaButton" onclick="window.location.href='ListCategoriaServlet'">
                    Alterar configurações<br>
                    do Sistema
                </button>
            </div>
        </div>
        <footer class="fixed-bottom">
            <div class="containerFooter">
                <h4 class="tituloFooter">Financeapp</h4>
                <span class="tituloFooterSpan">&#169;All rigths reserved</span>
            </div>
        </footer>
            
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>