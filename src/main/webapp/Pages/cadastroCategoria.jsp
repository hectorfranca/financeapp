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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/cadastroCategoria.css"/>       
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    </head>
    <body>
        <jsp:useBean id="categoria" class="Beans.CategoriaBean" scope="request"></jsp:useBean>     
        <jsp:include page="/Components/header.jsp"/>
        
        <div class="container-primario">
            <div class="container-secundario"> 
                <h2 class="container-secundario__titulo">Cadastro de Entradas</h2>
                <form action="${pageContext.request.contextPath}/SaveCategoriaServlet" method="POST">
                    <div class="form-item">
                        <label for="input-nome">Nome</label>         
                        <input type="text" class="form-control" id="input-nome" name="nome" 
                               value="<%= categoria.getNome() != null ? categoria.getNome() : "" %>" required>
                        
                        <% if (categoria.getId() != null) {  %>
                            <input type="hidden" name="id" value="<%= categoria.getId() %>">
                        <% } %>
                    </div>                                                                             
                     <div class="form-button">
                        <a class="form-button__caixa form-button--efeito" 
                                onclick="document.getElementsByTagName('form')[0].submit()">
                            <span class="form-button__caixa__titulo">Registrar</span>
                        </a>                    
                        <a class="form-button__caixa form-button--efeito"
                                href="${pageContext.request.contextPath}/index.jsp">
                            <span class="form-button__caixa__titulo">Cancelar</span>
                        </a>
                    </div>
                </form>
            </div>      
        </div>
            
        <jsp:include page="/Components/footer.jsp"/>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
