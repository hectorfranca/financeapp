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
        
        <jsp:include page="/Components/header.jsp"/>
        
        <div class="container">
            <div class="containerPrincipal">
                <div class="titulo">
                    <h1 class="paginaTitulo">Relatório de Entradas</h1>  
                    <h2 class="paginaSubtitulo">Lista Completa</h2>
                </div>
                <div id="listaEntradas" class="listaEntradas">
                <% if (colecaoRegistro.getRegistros().size() > 0) {
                    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                    SimpleDateFormat dateFormatUS = new SimpleDateFormat("yyyy-MM-dd");
                    DecimalFormat decimalFormat = new DecimalFormat("R$ #,##0.00");
                
                    for (RegistroBean registro : colecaoRegistro.getRegistros()) { %>
                        <div class="itemEntradas">
                            <div class="containerData">
                                <span><%= dateFormat.format(registro.getData()) %></span>
                            </div>
                            <div class="containerConteudo">
                                <div class="containerNome">
                                    <span><%= registro.getNome() %></span>
                                </div>
                                <div class="containerCategoria">
                                    <span><%= registro.getCategoria().getNome() %></span> 
                                </div>
                            </div>
                            <div class="containerValor">
                                <span class="valorRegistroSpan"><%= decimalFormat.format(registro.getValor()) %></span>
                            </div>
                            
                            <input type="hidden" class="idRegistro" value="<%= registro.getId() %>"/>
                            <input type="hidden" class="dataRegistro" value="<%= dateFormatUS.format(registro.getData()) %>"/> 
                            <input type="hidden" class="nomeRegistro" value="<%= registro.getNome() %>"/>                           
                            <input type="hidden" class="categoriaRegistro" value="<%= registro.getCategoria().getId() %>"/>
                            <input type="hidden" class="valorRegistro" value="<%= registro.getValor() %>"/>
                            <input type="hidden" class="tipoRegistro" value="<%= registro.getTipo() %>"/>
                            
                        </div>                       
                <%  } 
                }
                %>
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
        </div>

        <jsp:include page="/Components/footer.jsp"/>
             
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>     
        <script src="${pageContext.request.contextPath}/Javascript/listaCompletaRegistro.js"></script>
    </body>
</html>
