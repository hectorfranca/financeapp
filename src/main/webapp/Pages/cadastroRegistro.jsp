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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/Components/header.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/Components/footer.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/cadastroRegistro.css"/>       
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    </head>
    <body>
        <jsp:useBean id="registro" class="Beans.RegistroBean" scope="request"></jsp:useBean>
        <jsp:useBean id="colecaoCategoria" class="Beans.ColecaoCategoriaBean" scope="request"></jsp:useBean>
        
        <%! SimpleDateFormat dateFormatUS = new SimpleDateFormat("yyyy-MM-dd"); %>
        
        <jsp:include page="/Components/header.jsp"/>
        
        <div class="container">
            <div class="containerPrincipal"> 
                <h2 class="paginaTitulo">Cadastro de Entradas</h2>
                <form action="${pageContext.request.contextPath}/SaveRegistroServlet" method="POST">
                    <div class="form-item">     
                        <label for="inputname" class="labelNome">Nome</label>            
                        <input type="text" class="form-control" id="inputname" name="nome" 
                               value="<%= registro.getNome() != null ? registro.getNome() : "" %>" required>
                    </div>
                    <div class="form-item">
                        <label for="inputname" class="labelCategoria">Categoria</label>             
                        <select class="form-select" aria-label="Default select example" name="categoria" required>                           
                            
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
                        <div class="divPrincipalValor">
                            <div class="divValor">
                                <label for="inputname" class="labelValor">Valor em R$</label>
                            </div>          
                            <input type="number" class="form-control" id="input" name="valor" 
                                   value="<%= registro.getValor() != 0 ? registro.getValor() : "" %>" required>    
                        </div>
                    </div>
                    <div class="form-item">
                        <label for="inputname" class="labelData">Data</label>       
                        <input type="date" class="form-control" id="input" name="data" 
                               value="<%= registro.getData() != null ? dateFormatUS.format(registro.getData()) : "" %>" required>
                    </div>                       
                    <input type="hidden" name="tipo" 
                           value="<%= registro.getTipo() != '\u0000' ? registro.getTipo() : request.getParameter("tipo") %>">
                    
                    <% if (registro.getId() != null) { %>                        
                    <input type="hidden" name="id" value="<%= registro.getId() %>">
                    <% } %>                    
                    <div>
                        <div class="btn-CadCan">
                            <input type="submit" class="btnn btnCadastrar btn-efeito" value="Cadastrar">
                            <input type="button" class="btnn btnCancelar btn-efeito" 
                                onclick="window.location.href='${pageContext.request.contextPath}/index.jsp'" value="Cancelar">
                        </div>
                    </div>
                </form>
            </div>      
        </div>
            
        <jsp:include page="/Components/footer.jsp"/>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
