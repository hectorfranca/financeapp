<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Beans.RegistroBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FinanceApp - Registros Completo</title>
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/logo.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/Components/header.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/Components/footer.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/listaCompletaRegistro.css"/>       
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    </head>
    <body>
        <jsp:useBean id="colecaoRegistro" class="Beans.ColecaoRegistroBean" scope="request"></jsp:useBean>
        
        <% 
            DecimalFormat decimalFormat = new DecimalFormat("R$ #,##0.00");
            float valorTotal = 0; 
        %>
        
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
                <h2 class="container-primario__container-secundario__subtitulo">Lista Completa</h2>
                <div class="data-filter">
                    <span>
                        <%= request.getAttribute("dataInicial") %>
                        a
                        <%= request.getAttribute("dataFinal") %>
                    <span>
                    <input type="hidden" class="data-inicial" name="dataInicial" value="<%= request.getParameter("dataInicial") %>"/>  
                    <input type="hidden" class="data-final" name="dataFinal" value="<%= request.getParameter("dataFinal") %>"/> 
                </div>
                <% if (colecaoRegistro.getRegistros().size() > 0) { %>
                    <div class="container-primario__container-secundario__lista">                   
                    <% SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                    SimpleDateFormat dateFormatUS = new SimpleDateFormat("yyyy-MM-dd");
                
                    for (RegistroBean registro : colecaoRegistro.getRegistros()) {
                        valorTotal += registro.getValor(); %>                  
                        <div class="item-lista">
                            <div class="item-lista__data">
                                <span><%= dateFormat.format(registro.getData()) %></span>
                            </div>
                            <div class="item-lista__nome-categoria">
                                <div class="item-lista__nome-categoria__nome">
                                    <span><%= registro.getNome() %></span>
                                </div>
                                <div class="item-lista__nome-categoria__categoria">
                                    <span><%= registro.getCategoria().getNome() %></span> 
                                </div>
                            </div>
                            <div class="item-lista__valor">
                                <span class="item-lista__valor__conteudo"><%= decimalFormat.format(registro.getValor()) %></span>
                            </div>
                            <input type="hidden" class="id-registro" name="id" value="<%= registro.getId() %>"/>
                            <input type="hidden" class="data-registro" name="data" value="<%= dateFormatUS.format(registro.getData()) %>"/> 
                            <input type="hidden" class="nome-registro" name="nome" value="<%= registro.getNome() %>"/>                           
                            <input type="hidden" class="categoria-registro" name="categoria" value="<%= registro.getCategoria().getId() %>"/>
                            <input type="hidden" class="valor-registro" name="valor" value="<%= registro.getValor() %>"/>
                            <input type="hidden" class="tipo-registro" name="tipo" value="<%= registro.getTipo() %>"/>                 
                        </div>                     
                    <% } %>
                    <input type="hidden" class="tipo-lista" name="tipoLista" value="<%= request.getParameter("tipoLista") %>"/>  
                    </div>
                <% } else { %>
                    <p>Nenhum registro cadastrado.</p>
                <% } %>           
            </div>               
        </div>           
        <div class="valor-total">
            <div class="valor-total-item">
                <span>Total:</span>
            </div> 
            <div class="valor-total-item">
                <span class="valor-total-item__valor"><%= decimalFormat.format(valorTotal) %></span>
            </div>       
        </div>
        <div class="seletor hidden">
            <div class="seletor-item">
                <span>Selecionado:</span>
            </div> 
            <div class="seletor-item">
                <span class="seletor-item__selecionado">Supermercado</span>
            </div> 
            <div class="seletor-item">
                <button id="editar-button" type="submit" class="editar-button ">
                    <img src="${pageContext.request.contextPath}/img/editar.png">    
                </button>
            </div>
            <div class="seletor-item">
                <button id="excluir-button" class="excluir-button active">
                    <img src="${pageContext.request.contextPath}/img/excluir.png">    
                </button>
            </div>
        </div>                   
        
        <jsp:include page="/Components/footer.jsp"/>
             
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>     
        <script src="${pageContext.request.contextPath}/Javascript/listaCompletaRegistro.js"></script>
    </body>
</html>
