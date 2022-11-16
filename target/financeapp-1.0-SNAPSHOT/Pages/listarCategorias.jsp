<%-- 
    Author     : Hector
--%>

<%@page import="Beans.CategoriaBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Finance App - Categorias</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/listarCategorias.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    </head>
    <body>
        <jsp:useBean id="colecaoCategoria" class="Beans.ColecaoCategoriaBean" scope="request"></jsp:useBean>
        
        <header class="header fixed-top">
            <button type="button" class="btn btn-danger"
                    onclick="window.location.href='${pageContext.request.contextPath}/index.jsp'">
                    Voltar ao menu
            </button>
            <h1 class="headerTitulo">Categorias</h1>
            <button type="submit" class="btnAdd">Adicionar</button>       
        </header>
        <div id="listaDespesas" class="listaDespesas">
        <% for (CategoriaBean categoria : colecaoCategoria.getCategorias()) { %>
            <div class="itemDespesas">
                <div class="itemNome">
                    <span class="itemNome"><%= categoria.getNome() %></span>
                </div>
                <div class="itemBotoes">
                    <a class="btnEditar" href="#">Editar</a>
                    <a class="btnExcluir" href=
                        "DeleteCategoriaServlet?id=<%= categoria.getId() %>">Excluir</a>
                </div>
            </div>
        <% } %>                       
        </div>
        <footer class="fixed-bottom">
            <div class="containerFooter">
                <h4 class="tituloFooter">Financeapp</h4>
                <span class="tituloFooterSpan">&#169;All rigths reserved</span>
            </div>
        </footer>
  
        <script src="${pageContext.request.contextPath}/Javascript/listarCategorias.js"></script>     
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
