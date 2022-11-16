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
        <title>Finance App - Salvar Categoria</title>
    </head>
    <body>
        <form action="SaveCategoriaServlet" method="POST">        
            <label for="nome">Nome:</label>
            <input id="nome" name="nome" type="text" required/>
           
            <select name="tipo" id="tipo">
                <option value="D">Despesa</option>
                <option value="R">Receita</option>
            </select>
            
            <input type="submit" value="Enviar"/>
        </form>
        <br>
        <button onclick="window.location.href='ListCategoriaServlet';">Cencelar</button>
    </body>
</html>
