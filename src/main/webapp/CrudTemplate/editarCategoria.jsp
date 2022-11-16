<%-- 
    Author     : Hector
--%>

<%@page import="java.util.List"%>
<%@page import="Beans.CategoriaBean"%>
<%@page import="DAO.CategoriaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Finance App - Editar Categoria</title>
    </head>
    <body>
        <form action="UpdateCategoriaServlet" method="POST">
            <jsp:useBean id="categoria" class="Beans.CategoriaBean" scope="request"></jsp:useBean>
            
            <label for="nome">Nome:</label>
            <input id="nome" name="nome" type="text" value="<%= categoria.getNome() %>" required/>
           
            <select name="tipo" id="tipo">
            <%  switch(categoria.getTipo()) {
                    case 'D': %> 
                        <option value="D" selected>Despesa</option>
                        <option value="R">Receita</option>
                        <% break;
                    case 'R': %> 
                        <option value="D">Despesa</option>
                        <option value="R" selected>Receita</option>
                        <% break;
                } %>
            </select>
            
            <input type="hidden" name="id" value="<%= categoria.getId() %>">
            <input type="submit" value="Enviar"/>
        </form>
        <br>
        <button onclick="window.location.href='ListCategoriaServlet';">Cencelar</button>
    </body>
</html>
