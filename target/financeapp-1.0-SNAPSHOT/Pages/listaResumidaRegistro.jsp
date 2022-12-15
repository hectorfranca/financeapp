<%@page import="java.text.DecimalFormat"%>
<%@page import="Beans.RegistroBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FinanceApp - Registros Resumidos</title>
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/logo.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/Components/header.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/Components/footer.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/listaResumidaRegistro.css"/>       
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    </head>
    <body>
        <jsp:useBean id="colecaoRegistro" class="Beans.ColecaoRegistroBean" scope="request"></jsp:useBean>
        
        <jsp:include page="/Components/header.jsp"/>
        
        <div class="container-primario">
            <a class="back-button__caixa back-button--efeito"
                href="javascript:history.back()">
                    <span class="back-button__caixa__titulo">Voltar</span>
            </a>
            <div class="container-primario__container-secundario">
                <% if (request.getParameter("tipo").equals("R")) { %>
                    <h1 class="container-primario__container-secundario__titulo">Relatório de Receitas</h1> 
                <% } else { %>
                    <h1 class="container-primario__container-secundario__titulo">Relatório de Despesas</h1>
                <% } %>  
                <h2 class="container-primario__container-secundario__subtitulo">Lista Resumida</h2>              
                <div class="data-filter">
                    <span>
                        <%= request.getAttribute("dataInicial") %>
                        a
                        <%= request.getAttribute("dataFinal") %>
                    <span>
                </div>             
                <% if (colecaoRegistro.getRegistros().size() > 0) { %>
                    <div class="container-primario__container-secundario__lista">
                
                    <% DecimalFormat decimalFormat = new DecimalFormat("R$ #,##0.00");
                
                    for (RegistroBean registro : colecaoRegistro.getRegistros()) { %>
                        <div class="item-lista">
                            <div class="item-lista__nome">
                                <span><%= registro.getNome() %></span>
                            </div>                         
                            <div class="item-lista__valor">
                                <span class="item-lista__valor__conteudo"><%= decimalFormat.format(registro.getValor()) %></span>
                            </div>                         
                        </div>                       
                    <% } %> 
                    </div> 
                    <input type="hidden" class="tipo-registro" value="<%= colecaoRegistro.getRegistros().get(0).getTipo() %>"/>
                <% } else { %>
                    <p>Nenhum registro cadastrado.</p>
                <% } %>
            </div>
        </div>

        <jsp:include page="/Components/footer.jsp"/>
               
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>     
        <script src="${pageContext.request.contextPath}/Javascript/listaResumidaRegistro.js"></script>
    </body>
</html>
