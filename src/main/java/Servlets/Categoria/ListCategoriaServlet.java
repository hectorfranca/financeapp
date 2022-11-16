package Servlets.Categoria;

import Beans.ColecaoCategoriaBean;
import DAO.CategoriaDAO;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Hector
 */
@WebServlet(name = "ListCategoriaServlet", urlPatterns = {"/ListCategoriaServlet"})
public class ListCategoriaServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        CategoriaDAO categoriaDAO = new CategoriaDAO();
        ColecaoCategoriaBean colecaoCategoria = new ColecaoCategoriaBean();
        RequestDispatcher requestDispatcher = null;
        
        try {            
            requestDispatcher = request.getRequestDispatcher("/Pages/listarCategorias.jsp");
            colecaoCategoria.setCategorias(categoriaDAO.getAll());
         
            request.setAttribute("colecaoCategoria", colecaoCategoria);
 
            requestDispatcher.forward(request, response);
        } catch(Exception exception) {
            throw new ServletException("Não foi possível listar as categorias: " 
                    + exception.getMessage());
        }
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
