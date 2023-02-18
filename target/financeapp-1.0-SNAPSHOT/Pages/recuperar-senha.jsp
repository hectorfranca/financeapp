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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/recuperar-senha.css"/>       
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    </head>
    <body>        
        <jsp:include page="/Components/header.jsp"/>
        
        <div class="container-primario">
            <div class="container-primario__container-secundario"> 
                <h2 class="container-primario__container-secundario__titulo">Recuperar senha</h2>
                
                <% if (request.getAttribute("emailMessage") != null) { %>
                    <%= request.getAttribute("emailMessage") %>
                    
                    <div class="form-button">
                        <a class="form-button__caixa form-button--efeito" 
                           href="${pageContext.request.contextPath}/Pages/login.jsp">
                           <span class="form-button__caixa__titulo">Voltar</span>
                        </a>
                    </div>
                <% } else { %>               
                    <span>(<span class="required-field-titulo">*</span>) são campos obrigatórios.</span>

                    <form id="recuperar-senha-form" action="${pageContext.request.contextPath}/RecoverPassword" method="POST">
                        <div class="form-item">
                            <label class="label-email" for="input-email">E-mail (<span class="required-field-titulo">*</span>)</label>         
                            <input id="input-email" type="text" class="form-control" name="email" maxlength="100" required>
                        </div>
                    </form>
                    <div class="form-button">
                        <a id="recuperar-senha-form-button" class="form-button__caixa form-button--efeito">
                            <span class="form-button__caixa__titulo">Enviar</span>
                        </a>            

                        <a class="form-button__caixa form-button--efeito" 
                           href="${pageContext.request.contextPath}/Pages/login.jsp">
                           <span class="form-button__caixa__titulo">Voltar</span>
                        </a>
                    </div>                     
                <% } %>
            </div>
        </div>
            
        <jsp:include page="/Components/footer.jsp"/>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/Javascript/recuperarSenha.js"></script>
    </body>
</html>