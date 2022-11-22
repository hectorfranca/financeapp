<%@page import="Beans.CategoriaBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FinanceApp - Filtro Registro</title>
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
        <jsp:include page="/Components/header.jsp"/>
        
        <div class="container">
            <div class="containerPrincipal">
                <h2 class="paginaTitulo">Relatório de Entradas</h2>
                <form class="containerDef" action="${pageContext.request.contextPath}/FiltroRegistroServlet" method="POST">
                    <h5 class="tituloDef">Defina suas opções de consulta</h5>
                    <div class="calendarios">
                        <div class="calInicial">
                            <div> 
                                <p class="calTitulo">Data Inicial</p>
                            </div>
                            <div class="calData">
                                <input class="date" type="date" name="dataInicial" required/> 
                            </div>
                        </div>
                        <div class="calFinal">
                            <div>
                                <p class="calTitulo">Data Final</p>
                                <div class="calData">          
                                    <input class="date" type="date" name="dataFinal" required/>  
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="containerOp">
                        <div class="divTituloOp">
                            <a class="tituloOp">Opções</a> 
                        </div>    
                        <div class="containerListaCompleta">
                            <div class="check1">
                                <input name="tipoLista" type="radio" value="completa" class="checkbox1" required>
                            </div>
                            <div id="pCheckListaC" class="listaCompleta">
                                <label class="labelLista">Lista completa</label>
                            </div>  
                        </div>
                        <div class="containerListaResumida">
                            <div class="check2">
                                <input name="tipoLista" type="radio" value="resumida" class="checkbox2">
                            </div>
                            <div id="pCheckListaR" class="listaResumida">
                                <label class="labelLista">Lista resumida</label>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="tipo" value="<%= request.getParameter("tipo") %>"/>
                    <div>
                        <input type="submit" class="btnConsultar btn-efeito" value="Consultar"/>
                    </div>
                </form>
            </div>
        </div>
            
        <jsp:include page="/Components/footer.jsp"/>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
