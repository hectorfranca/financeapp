<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Beans.CategoriaBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FinanceApp - Cadastro Registro</title>
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/logo.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/Components/header.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/Components/footer.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/cadastroRegistro.css"/>       
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    </head>
    <body>
        <%! SimpleDateFormat dateFormatUS = new SimpleDateFormat("yyyy-MM-dd"); %>
        <jsp:useBean id="registro" class="Beans.RegistroBean" scope="request"></jsp:useBean>
        <jsp:useBean id="colecaoCategoria" class="Beans.ColecaoCategoriaBean" scope="request"></jsp:useBean>
        
        <jsp:include page="/Components/header.jsp"/>
        
        <% char tipo; 
        
            if (request.getAttribute("tipo") != null) {
              if (request.getAttribute("tipo").equals("R")) { 
                tipo = 'R';
              } else {
                tipo = 'D';
              }
            } else if (registro.getTipo() == 'R') {
                tipo = 'R';
            } else {
                tipo = 'D';
            }
        %>
        
        <div class="container-primario">
            <div class="container-primario__container-secundario">
                <% if (tipo == 'R') { %>
                        <h1 class="container-primario__container-secundario__titulo">Cadastro de Receita</h1>             
                <% } else { %>
                        <h1 class="container-primario__container-secundario__titulo">Cadastro de Despesa</h1>
                <% } %>        
                <form action="${pageContext.request.contextPath}/SaveRegistroServlet" method="POST">
                    <div class="form-item">     
                        <label class="label-nome" for="input-nome">Nome</label>            
                        <input type="text" class="form-control" id="input-nome" name="nome" 
                               value="<%= registro.getNome() != null ? registro.getNome() : "" %>" required>
                    </div>
                    <% if (registro.getId() == null) { %>
                        <div class="form-button">
                            <% if (tipo == 'R') { %>
                                <a class="form-button__caixa button-add-categoria form-button--efeito"
                                   href="${pageContext.request.contextPath}/Pages/cadastroCategoria.jsp?tipo=R&isOnRegister=1">
                                    <span class="form-button__caixa__titulo">Cadastrar categoria</span>
                                </a>
                            <% } else { %>
                                <a class="form-button__caixa button-add-categoria form-button--efeito"
                                   href="${pageContext.request.contextPath}/Pages/cadastroCategoria.jsp?tipo=D&isOnRegister=1">
                                    <span class="form-button__caixa__titulo">Cadastrar categoria</span>
                                </a>
                            <% } %>
                        </div>   
                    <% } %>
                    <div class="form-item">
                        <label class="label-categoria" for="input-categoria">Categoria</label>
                        <select class="form-select" id="input-categoria" aria-label="Default select example" name="categoria" required>                           
                            
                        <% for (CategoriaBean categoria : colecaoCategoria.getCategorias()) {
                            if (registro.getId() != null && registro.getCategoria().getId() == categoria.getId()) { %>
                            <option value="<%= categoria.getId() %>" selected><%= categoria.getNome() %></option>
                        <%  } else { %>
                            <option value="<%= categoria.getId() %>"><%= categoria.getNome() %></option>
                        <%  }
                           } 
                        %>
                        </select>
                    </div>          
                    <div class="form-item">     
                        <label class="label-data" for="input-data">Data</label>            
                        <input type="date" class="form-control" id="input-data" name="data" 
                               value="<%= registro.getData() != null ? dateFormatUS.format(registro.getData()) : dateFormatUS.format(new Date()) %>" required>
                    </div>               
                    <div class="form-item">
                        <label class="label-valor" for="input-valor">Valor em R$</label>
                        <input type="number" class="form-control" id="input-valor" name="valor" min="0" 
                               value="<%= registro.getValor() != 0 ? registro.getValor() : "" %>" required>    
                    </div>                             
                    <input type="hidden" name="tipo" 
                           value="<%= registro.getTipo() != '\u0000' ? registro.getTipo() : request.getParameter("tipo") %>">
                    
                    <% if (registro.getId() != null) { %>                        
                    <input type="hidden" name="id" value="<%= registro.getId() %>">
                    <% } %>                    
                    <div class="form-button">
                        <a class="form-button__registrar form-button__caixa form-button--efeito">
                            <span class="form-button__caixa__titulo">Registrar</span>
                        </a>                    
                        <a class="form-button__caixa form-button--efeito"
                                href="${pageContext.request.contextPath}/index.jsp">
                            <span class="form-button__caixa__titulo">Cancelar</span>
                        </a>
                    </div>
                </form>
            </div>      
        </div>
            
        <jsp:include page="/Components/footer.jsp"/>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>     
        <script src="${pageContext.request.contextPath}/Javascript/cadastroRegistro.js"></script>
    </body>
</html>
