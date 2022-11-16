package Servlets.Categoria;

import Beans.CategoriaBean;
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
@WebServlet(name = "UpdateCategoriaServlet", urlPatterns = {"/UpdateCategoriaServlet"})
public class UpdateCategoriaServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        CategoriaDAO categoriaDAO = new CategoriaDAO();
        CategoriaBean categoria = new CategoriaBean();
        RequestDispatcher requestDispatcher = null;
        
        try {            
            requestDispatcher = request.getRequestDispatcher("ListCategoriaServlet");
            
            categoria.setId(Long.parseLong(request.getParameter("id")));
            categoria.setNome(request.getParameter("nome"));
         
            categoriaDAO.update(categoria);
   
            requestDispatcher.forward(request, response);
        } catch(Exception exception) {
            throw new ServletException("Não foi possível editar a categoria: " 
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
