<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FinanceApp - Cadastro Categoria</title>
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/logo.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/Components/header.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/Components/footer.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/login.css"/>       
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    </head>
    <body>  
        <% if (session.getAttribute("id") != null && session.getAttribute("nome") != null 
                && session.getAttribute("email") != null) {
            response.sendRedirect(request.getContextPath() + "/Pages/menu.jsp");
        } %>
        
        <jsp:include page="/Components/header.jsp"/>
        
        <div class="container-primario">
            <div class="container-primario__container-secundario"> 
                <h2 class="container-primario__container-secundario__titulo">Login</h2>
                <form id="login-form" action="${pageContext.request.contextPath}/Login" method="POST">
                    <div class="form-item">
                        <label for="nome-email">Nome ou E-mail</label>         
                        <input type="text" id="nome-email" class="form-control" name="nome-email">
                    </div>
                    <div class="form-item">
                        <label for="senha">Senha</label>         
                        <input type="password" id="senha" class="form-control" name="senha">
                    </div>
                </form>
                <div class="form-button">
                    <a id="login-form-button" class="form-button__caixa form-button--efeito">
                        <span class="form-button__caixa__titulo">Entrar</span>
                    </a>               
                  
                    <a class="form-button__caixa form-button--efeito" 
                       href="${pageContext.request.contextPath}/Pages/registrar.jsp">
                       <span class="form-button__caixa__titulo">Registrar</span>
                    </a>
                </div>
            </div>
        </div>
            
        <jsp:include page="/Components/footer.jsp"/>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/Javascript/login.js"></script>
    </body>
</html>
