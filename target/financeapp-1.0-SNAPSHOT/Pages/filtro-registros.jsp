<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Beans.CategoriaBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FinanceApp - Filtro Registro</title>
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/logo.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/Components/header.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/Components/footer.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/filtroRegistro.css"/>       
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    </head>
    <body>
        <jsp:useBean id="colecaoCategoria" class="Beans.ColecaoCategoriaBean" scope="request"></jsp:useBean>  
        
        <%
            SimpleDateFormat dateFormatUS = new SimpleDateFormat("yyyy-MM-dd"); 
            Calendar currentDayOfMonth = Calendar.getInstance();
            Calendar lastDayOfMonth = Calendar.getInstance();
            lastDayOfMonth.set(Calendar.DAY_OF_MONTH, lastDayOfMonth.getActualMaximum(Calendar.DAY_OF_MONTH));
        %>
        
        <jsp:include page="/Components/header.jsp"/>
        
        <div class="container-primario">
            <div class="container-primario__container-secundario">
                <% if (request.getParameter("tipo").equals("R")) { %>
                    <h1 class="container-primario__container-secundario__titulo">Relatório de Receitas</h1> 
                <% } else { %>
                    <h1 class="container-primario__container-secundario__titulo">Relatório de Despesas</h1>
                <% } %>
                <h2 class="container-primario__container-secundario__subtitulo">Defina suas opções de consulta</h2>
                <form action="${pageContext.request.contextPath}/ListarRegistros" method="POST">               
                    <div class="form-calendario">
                        <div class="form-calendario__inicial">
                            <p class="form-calendario__inicial__titulo">Data Inicial</p>     
                            <div class="form-calendario__inicial__data">
                                <input class="date-inicial" type="date" name="dataInicial" 
                                    value="<%= dateFormatUS.format(currentDayOfMonth.getTime()) %>" required/> 
                            </div>
                        </div>
                        <div class="form-calendario__final">   
                            <p class="form-calendario__final__titulo">Data Final</p>
                            <div class="form-calendario__final__data">          
                                <input class="date-final" type="date" name="dataFinal" 
                                    value="<%= dateFormatUS.format(lastDayOfMonth.getTime()) %>" required/>  
                            </div>              
                        </div>
                    </div>
                    <div class="form-option">
                        <div class="form-option__caixa">
                            <span class="form-option__caixa__titulo">Opções</span> 
                        </div>    
                        <div class="form-option__lista-completa">
                            <div class="form-option__lista-completa__caixa-radio">
                                <input class="radio-completa" name="tipoLista" type="radio" value="completa" required>
                            </div>
                            <div class="form-option__lista-completa__caixa-label">
                                <label class="form-option__lista-completa__caixa-label__label">Lista completa</label>
                            </div> 
                        </div>
                        <div class="form-option__lista-resumida">
                            <div class="form-option__lista-resumida__caixa-radio">
                                <input class="radio-resumida" name="tipoLista" type="radio" value="resumida">
                            </div>
                            <div class="form-option__lista-resumida__caixa-label">
                                <label class="form-option__lista-resumida__caixa-label__label">Lista resumida</label>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="tipo" value="<%= request.getParameter("tipo") %>"/>
                    <div class="form-button">
                        <a class="form-button__caixa form-button--efeito">
                            <span class="form-button__caixa__titulo">Consultar</span>
                        </a> 
                        <a class="form-button__caixa form-button--efeito"
                                href="${pageContext.request.contextPath}/index.jsp">
                            <span class="form-button__caixa__titulo">Voltar</span>
                        </a>
                    </div>
                </form>
            </div>
        </div>
            
        <jsp:include page="/Components/footer.jsp"/>
               
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/Javascript/filtroRegistro.js"></script>
    </body>
</html>