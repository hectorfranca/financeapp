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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/Components/footer.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/listaCategoria.css"/>       
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    </head>
    <body>
        <jsp:useBean id="colecaoCategoria" class="Beans.ColecaoCategoriaBean" scope="request"></jsp:useBean>       
        <jsp:include page="/Components/header.jsp"/>
        
        <button class="addButton" 
                onclick="window.location.href='${pageContext.request.contextPath}/Pages/cadastroCategoria.jsp'"></button> 
        
        <div class="container">
            <div class="containerPrincipal">
                <div class="titulo">
                    <h1 class="paginaTitulo">Categorias</h1>
                </div>
                <div id="listaEntradas" class="listaEntradas">
                <% if (colecaoCategoria.getCategorias().size() > 0) {               
                    for (CategoriaBean categoria : colecaoCategoria.getCategorias()) { %>
                        <div class="itemEntradas">
                            <div class="containerNome">
                                <span><%= categoria.getNome() %></span>
                            </div> 
                            <input type="hidden" class="idCategoria" value="<%= categoria.getId() %>"/>                       
                            <input type="hidden" class="nomeCategoria" value="<%= categoria.getNome() %>"/> 
                        </div>                                        
                <%  } 
                }
                %>
                </div>  
            </div>
        </div>
                
        <div id="seletorEntradas" class="seletorEntradas fixed-bottom hidden-menu">
            <div class="seletorItem">
                <span>Selecionado:</span>
            </div> 
            <div class="seletorItem">
                <span class="itemSelecionado">Supermercado</span>
            </div> 
            <div class="seletorItem">
                <button id="btnEditar" type="submit" class="btnEditar active">
                    <img src="${pageContext.request.contextPath}/img/editar.png">    
                </button>
            </div>
            <div class="seletorItem">
                <button id="btnExcluir" class="btnExcluir active">
                    <img src="${pageContext.request.contextPath}/img/excluir.png">    
                </button>
            </div>
        </div>   

        <jsp:include page="/Components/footer.jsp"/>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>     
        <script src="${pageContext.request.contextPath}/Javascript/listaCategoria.js"></script>
    </body>
</html>
