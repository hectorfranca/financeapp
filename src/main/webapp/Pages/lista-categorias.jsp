<%@page import="Beans.CategoriaBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FinanceApp - Registros</title>
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/logo.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/Components/header.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/Components/session.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/Components/footer.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/listaCategoria.css"/>       
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    </head>
    <body>
        <%
            if (session.getAttribute("id") == null || session.getAttribute("nome") == null 
                || session.getAttribute("email") == null) {
                response.sendRedirect(request.getContextPath() + "/Pages/login.jsp");
            } 
        %>
        
        <jsp:useBean id="colecaoCategoria" class="Beans.ColecaoCategoriaBean" scope="request"></jsp:useBean>  
        
        <jsp:include page="/Components/header.jsp"/>
        <jsp:include page="/Components/session.jsp"/>
        
        <div class="container-primario">
            <div class="container-primario__container-secundario">
                <div class="header-content">
                    <a class="back-button__caixa back-button--efeito"
                        href="${pageContext.request.contextPath}/Pages/menu.jsp">
                            <span class="back-button__caixa__titulo">Voltar</span>
                    </a>                           
                    <h1 class="header-content__titulo">Categorias</h1>                   
                    <button class="header-content__add-button"
                        onclick="window.location.href='${pageContext.request.contextPath}/Pages/cadastro-categoria.jsp'">
                    </button>
                </div>
                    
                <% if (request.getAttribute("categoriaMessage") != null) { %>
                    <span class="message"><%= request.getAttribute("categoriaMessage") %></span>
                <% } %>
                
                <% if (colecaoCategoria.getCategorias().size() > 0) { %>
                    <div class="container-primario__container-secundario__lista">            
                    <% for (CategoriaBean categoria : colecaoCategoria.getCategorias()) { %>
                        <div class="item-lista">
                            <div class="item-lista__nome">
                                <span><%= categoria.getNome() %></span>
                            </div> 
                            <input type="hidden" class="id-categoria" value="<%= categoria.getId() %>"/>                       
                            <input type="hidden" class="nome-categoria" value="<%= categoria.getNome() %>"/> 
                        </div> 
                    <% } %>
                    </div>
                <% } else { %>
                    <p>Nenhuma categoria cadastrada.</p>
                <% } %>
            </div>
        </div>
                
        <div class="seletor hidden">
            <div class="seletor-item">
                <span>Selecionado:</span>
            </div> 
            <div class="seletor-item">
                <span class="seletor-item__selecionado">Supermercado</span>
            </div>
            <form action="${pageContext.request.contextPath}/CadastrarCategoria" method="POST" class="editar-form seletor-item">
                <input type="hidden" id="editar-id-categoria" name="id-categoria"/>
                <input type="hidden" id="editar-nome-categoria" name="nome-categoria"/>
                <button id="editar-button" class="editar-button">
                    <img src="${pageContext.request.contextPath}/img/editar.png">    
                </button>
            </form>
            <form action="${pageContext.request.contextPath}/ExcluirCategoria" method="POST" class="excluir-form seletor-item">
                <input type="hidden" id="excluir-id-categoria" name="id-categoria"/>
                <button id="excluir-button" class="excluir-button active">
                    <img src="${pageContext.request.contextPath}/img/excluir.png">    
                </button>
            </form>
        </div>   

        <jsp:include page="/Components/footer.jsp"/>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>     
        <script src="${pageContext.request.contextPath}/Javascript/listaCategoria.js"></script>
    </body>
</html>
