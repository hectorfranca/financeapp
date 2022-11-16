<%-- 
    Author     : Hector
--%>

<%@page import="DAO.CategoriaDAO"%>
<%@page import="Beans.CategoriaBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Finance App - Listar Categorias</title>
    </head>
    <body>
        <jsp:useBean id="colecaoCategoria" class="Beans.ColecaoCategoriaBean" scope="request"></jsp:useBean>     
        
        <table>
            <tr>
                <th>Id</th>
                <th>Nome</th>
                <th>Tipo</th>
                <th colspan="2">Opção</th>
            </tr>
            <tbody>
                <% for (CategoriaBean categoria : colecaoCategoria.getCategorias()) {  %>  
                <tr>
                    <td><%= categoria.getId() %></td>
                    <td><%= categoria.getNome() %></td>
                    <td><%= categoria.getTipo() == 'D' ? "Despesa" : "Receita" %></td>
                    <td>
                        <input type="button" name="opcao" value="Editar"
                            onclick="window.location.href=
                                'EditCategoriaServlet?id=<%= categoria.getId() %>&nome=<%= categoria.getNome() %>&tipo=<%= categoria.getTipo() %>'"/>
                    </td>
                    <td>
                        <input type="button" name="opcao" value="Excluir"
                            onclick="window.location.href=
                                'DeleteCategoriaServlet?id=<%= categoria.getId() %>'"/>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <br>
        <button onclick="window.location.href='salvarCategoria.jsp';">Adicionar categoria</button>
        <button onclick="window.location.href='index.jsp';">Menu</button>
    </body>
</html>
