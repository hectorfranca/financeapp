<%-- 
    Author     : Hector
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="Beans.RegistroBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Finance App - Registros</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/listarRegistros.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    </head>
    <body>
        <jsp:useBean id="colecaoRegistro" class="Beans.ColecaoRegistroBean" scope="request"></jsp:useBean>
        <%! DecimalFormat decimalFormat = new DecimalFormat("R$ #,##0.00"); %>
        
        <header class="header fixed-top">
            <button type="button" class="btn btn-danger"
                    onclick="window.location.href='${pageContext.request.contextPath}/index.jsp'">
                    Voltar ao menu
            </button>
            <% if (request.getAttribute("tipo") == "R") { %>
            <h1 class="headerTitulo">Receitas</h1>
            <% } else { %>
            <h1 class="headerTitulo">Despesas</h1>
            <% } %>
            <button type="submit" class="btnAdd">Adicionar</button>       
        </header>
        <div id="listaDespesas" class="listaDespesas">
        <% 
        if (colecaoRegistro.getRegistros().size() > 0) {
            for (RegistroBean registro : colecaoRegistro.getRegistros()) { %>
            <div class="itemDespesas">
                <div class="conteudoDespesas">
                    <span class="itemNome"><%= registro.getNome() %></span>
                    <span class="spanTipo"><%= registro.getCategoria().getNome() %></span>
                </div>
                <div class="precoDespesas">
                    <span class="valorDespesas"><%= decimalFormat.format(registro.getValor()) %></span>
                </div>
                 <div class="itemBotoes">
                    <a class="btnEditar" href="#">Editar</a>
                    <a class="btnExcluir" href=
                       "DeleteRegistroServlet?id=<%= registro.getId() %>&tipo=<%= registro.getTipo() %>">Excluir</a>
                </div> 
                <input class="tipoRegistro" type="hidden" name="tipo" value="<%= registro.getTipo() %>"/>
            </div>
        <% }
        } else { %>
            <p class="text-center mt-5">Nenhuma registro salvo.</p>
        <% } %>
        </div>
        <footer class="fixed-bottom">
            <div class="containerFooter">
                <h4 class="tituloFooter">Financeapp</h4>
                <span class="tituloFooterSpan">&#169;All rigths reserved</span>
            </div>  
        </footer>
        <script src="${pageContext.request.contextPath}/Javascript/listarRegistros.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </<body>
</html>
