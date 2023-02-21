<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FinanceApp - Registrar</title>
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/logo.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/Components/header.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/Components/footer.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/registrar.css"/>       
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    </head>
    <body>
        <%
            if (session.getAttribute("id") != null && session.getAttribute("nome") != null 
                && session.getAttribute("email") != null) {
                response.sendRedirect(request.getContextPath() + "/Pages/menu.jsp");
            } 
        %>
        
        <jsp:include page="/Components/header.jsp"/>
        
        <div class="container-primario">
            <div class="container-primario__container-secundario"> 
                <h2 class="container-primario__container-secundario__titulo">Cadastro</h2>
                <span>(<span class="required-field-titulo">*</span>) são campos obrigatórios.</span><br>              
                <div>
                    <p>1- O nome de usuário deve conter de 4 a 20 caracteres.</p>
                    <p>2- A senha deve conter de 6 a 16 caracteres.</p>
                </div>               
                <% if (request.getAttribute("registrationMessage") != null) { %>
                    <span class="message"><%= request.getAttribute("registrationMessage") %></span>
                <% } %>
                
                <form id="registrar-form" action="${pageContext.request.contextPath}/Registrar" method="POST">
                    <div class="form-item">
                        <label class="label-nome" for="nome">Nome (<span class="required-field-titulo">*</span>)</label>         
                        <input id="input-nome" type="text" id="nome" class="form-control" name="nome" minlength="4" maxlength="20" required>
                    </div>
                    <div class="form-item">
                        <label class="label-email" for="email">E-mail (<span class="required-field-titulo">*</span>)</label>         
                        <input id="input-email" type="email" id="email" class="form-control" name="email" maxlength="100" required>
                    </div>
                    <div class="form-item">
                        <label class="label-senha" for="senha">Senha (<span class="required-field-titulo">*</span>)</label>         
                        <input id="input-senha" type="password" id="senha" class="form-control" name="senha" minlength="6" maxlength="16" required>
                    </div>
                    <div class="form-item">
                        <label class="label-senha-confirmacao" for="senha-confirmacao">Confirmar Senha (<span class="required-field-titulo">*</span>)</label>         
                        <input id="input-senha-confirmacao" type="password" id="senha-confirmacao" class="form-control" name="senha-confirmacao" minlength="6" maxlength="16" required>
                    </div>
                </form>
                <div class="form-button">
                    <a id="registrar-form-button" class="form-button__caixa form-button--efeito">
                        <span class="form-button__caixa__titulo">Registrar</span>
                    </a>               
                  
                    <a class="form-button__caixa form-button--efeito"
                       href="${pageContext.request.contextPath}/Pages/login.jsp">
                       <span class="form-button__caixa__titulo">Voltar</span>
                    </a>
               </div>
            </div>
        </div>
            
        <jsp:include page="/Components/footer.jsp"/>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/Javascript/registrar.js"></script>
    </body>
</html>
