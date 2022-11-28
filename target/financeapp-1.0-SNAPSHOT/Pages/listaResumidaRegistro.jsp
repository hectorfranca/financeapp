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
        
        <div class="container">
            <div class="containerPrincipal">
                <div class="titulo">
                    <h1 class="paginaTitulo">Relatório de Entradas</h1>  
                    <h2 class="paginaSubtitulo">Lista Resumida</h2>
                </div>
                <div id="listaEntradas" class="listaEntradas">
                <% if (colecaoRegistro.getRegistros().size() > 0) {
                    DecimalFormat decimalFormat = new DecimalFormat("R$ #,##0.00");
                
                    for (RegistroBean registro : colecaoRegistro.getRegistros()) { %>
                        <div class="itemEntradas">
                            <div class="containerNome">
                                <span><%= registro.getNome() %></span>
                            </div>                         
                            <div class="containerValor">
                                <span class="valorRegistroSpan"><%= decimalFormat.format(registro.getValor()) %></span>
                            </div>                         
                        </div>                       
                <%  } 
                }
                %>
                </div>  
            </div>
                <input type="hidden" class="tipoRegistro" value="<%= colecaoRegistro.getRegistros().get(0).getTipo() %>"/>
        </div>

        <jsp:include page="/Components/footer.jsp"/>
               
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>     
        <script src="${pageContext.request.contextPath}/Javascript/listaResumidaRegistro.js"></script>
    </body>
</html>
