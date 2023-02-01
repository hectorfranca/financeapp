<%@page import="Beans.RegistroResumidoBean"%>
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/Components/session.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/Components/footer.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/listaResumidaRegistro.css"/>       
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    </head>
    <body>
        <% if (session.getAttribute("id") == null || session.getAttribute("nome") == null 
                || session.getAttribute("email") == null) {
            response.sendRedirect(request.getContextPath() + "/Pages/login.jsp");
        } %>
        
        <jsp:useBean id="colecaoRegistro" class="Beans.ColecaoRegistroBean" scope="request"></jsp:useBean>
        <jsp:useBean id="colecaoRegistroResumido" class="Beans.ColecaoRegistroResumidoBean" scope="request"></jsp:useBean>
        
        <%
            DecimalFormat decimalFormat = new DecimalFormat("R$ #,##0.00");
            float valorTotal = 0;
        %>
        
        <jsp:include page="/Components/header.jsp"/>
        <jsp:include page="/Components/session.jsp"/>
        
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
                <% if ((colecaoRegistro.getRegistros() != null && colecaoRegistro.getRegistros().size() > 0)
                        || (colecaoRegistroResumido.getRegistros() != null 
                        && colecaoRegistroResumido.getRegistros().size() > 0)) { %>
                    <div class="container-primario__container-secundario__lista">               
                    <% if (colecaoRegistro.getRegistros() != null) {
                        for (RegistroBean registro : colecaoRegistro.getRegistros()) { 
                            valorTotal += registro.getValor(); %>
                            <div class="item-lista">
                                <div class="item-lista__nome">
                                    <span><%= registro.getNome() %></span>
                                </div>                         
                                <div class="item-lista__valor">
                                    <span class="item-lista__valor__conteudo"><%= decimalFormat.format(registro.getValor()) %></span>
                                </div>                         
                            </div>                       
                        <% } 
                    } else {
                        for (RegistroResumidoBean registro : colecaoRegistroResumido.getRegistros()) { 
                            valorTotal += registro.getValor(); %>
                            <div class="item-lista">
                                <div class="item-lista__nome">
                                    <span><%= registro.getNome() %></span>
                                </div>                         
                                <div class="item-lista__valor">
                                    <span class="item-lista__valor__conteudo"><%= decimalFormat.format(registro.getValor()) %></span>
                                </div>                         
                            </div>                       
                        <% }
                    } %> 
                    </div> 
                    <% if (colecaoRegistro.getRegistros() != null) { %>
                        <input type="hidden" class="tipo-registro" value="<%= colecaoRegistro.getRegistros().get(0).getTipo() %>"/>
                    <% } else { %>
                        <input type="hidden" class="tipo-registro" value="<%= colecaoRegistroResumido.getRegistros().get(0).getTipo() %>"/>
                    <% }    
                } else { %>
                    <p>Nenhum registro cadastrado.</p>
                <% } %>
            </div>
        </div>
        <% if ((colecaoRegistro.getRegistros() != null && colecaoRegistro.getRegistros().size() > 0)
                        || (colecaoRegistroResumido.getRegistros() != null 
                        && colecaoRegistroResumido.getRegistros().size() > 0)) { %>
            <div class="valor-total">
                <div class="valor-total-item">
                    <span>Total:</span>
                </div> 
                <div class="valor-total-item">
                    <span class="valor-total-item__valor"><%= decimalFormat.format(valorTotal) %></span>
                </div>       
            </div>
        <% } %>
        <jsp:include page="/Components/footer.jsp"/>
               
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>     
        <script src="${pageContext.request.contextPath}/Javascript/listaResumidaRegistro.js"></script>
    </body>
</html>
