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
            <div class="container-primario__container-secundario"> 
                <h2 class="container-primario__container-secundario__titulo">Cadastro de Categoria</h2>
                <form id="registrar-form" action="${pageContext.request.contextPath}/SalvarCategoria" method="POST">
                    <div class="form-item">
                        <label class="label-nome" for="input-nome">Nome</label>         
                        <input type="text" class="form-control" id="input-nome" name="nome-categoria" maxlength="25"
                               value="<%= categoria.getNome() != null ? categoria.getNome() : "" %>" required>
                        <input type="hidden" name="tipo" value="<%= request.getParameter("tipo") %>">
                        <input type="hidden" name="isOnRegister" value="<%= request.getParameter("isOnRegister") %>">
                        <% if (categoria.getId() != null) {  %>
                            <input type="hidden" name="id-categoria" value="<%= categoria.getId() %>">
                        <% } %>
                        
                        <% if (request.getParameter("id") != null) { %>
                            <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
                            <input type="hidden" name="nome" value="<%= request.getParameter("nome") %>">
                            <input type="hidden" name="data" value="<%= request.getParameter("data") %>">
                            <input type="hidden" name="categoria" value="<%= request.getParameter("categoria") %>">
                            <input type="hidden" name="valor" value="<%= request.getParameter("valor") %>">
                            <input type="hidden" name="dataInicial" value="<%= request.getParameter("dataInicial") %>">
                            <input type="hidden" name="dataFinal" value="<%= request.getParameter("dataFinal") %>">
                            <input type="hidden" name="tipoLista" value="<%= request.getParameter("tipoLista") %>">
                        <% } %>
                    </div> 
                </form>
                <div class="form-button">
                   <a class="form-button__registrar form-button__caixa form-button--efeito">
                       <span class="form-button__caixa__titulo">Registrar</span>
                   </a>               
                   <% if (request.getParameter("isOnRegister") != null 
                           && request.getParameter("isOnRegister").equals("1")) { %>
                        <form id="voltar-form" action="${pageContext.request.contextPath}/CadastrarRegistro" method="POST">
                            <input type="hidden" name="tipo" value="<%= request.getParameter("tipo") %>">
                            <input type="hidden" name="isOnRegister" value="<%= request.getParameter("isOnRegister") %>">
                            <% if (request.getParameter("id") != null) { %>
                            <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
                            <input type="hidden" name="nome" value="<%= request.getParameter("nome") %>">
                            <input type="hidden" name="data" value="<%= request.getParameter("data") %>">
                            <input type="hidden" name="categoria" value="<%= request.getParameter("categoria") %>">
                            <input type="hidden" name="valor" value="<%= request.getParameter("valor") %>">
                            <input type="hidden" name="dataInicial" value="<%= request.getParameter("dataInicial") %>">
                            <input type="hidden" name="dataFinal" value="<%= request.getParameter("dataFinal") %>">
                            <input type="hidden" name="tipoLista" value="<%= request.getParameter("tipoLista") %>">
                            <% } %>
                            
                            <a id="voltar-button" class="form-button__caixa form-button--efeito">
                               <span class="form-button__caixa__titulo">Voltar</span>
                            </a>
                        </form>
                   <% } else { %>                        
                       <a class="form-button__caixa form-button--efeito"
                               href="${pageContext.request.contextPath}/ListarCategorias">
                           <span class="form-button__caixa__titulo">Voltar</span>
                       </a>
                   <% } %>
               </div>
            </div>      
        </div>
            
        <jsp:include page="/Components/footer.jsp"/>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/Javascript/cadastroCategoria.js"></script>
    </body>
</html>