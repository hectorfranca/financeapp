package Servlets.Categoria;

import Beans.CategoriaBean;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "CadastrarCategoria", urlPatterns = {"/CadastrarCategoria"})
public class CadastrarCategoria extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        RequestDispatcher requestDispatcher;
        
        try {
            requestDispatcher = request.getRequestDispatcher("/Pages/cadastro-categoria.jsp");                 

            if (request.getParameter("id-categoria") != null) {
                CategoriaBean categoria = new CategoriaBean();
                
                categoria.setId(Long.parseLong(request.getParameter("id-categoria")));
                categoria.setNome(request.getParameter("nome-categoria"));
                               
                request.setAttribute("categoria", categoria);
            }
            
            requestDispatcher.forward(request, response);
        } catch(Exception exception) {
            throw new jakarta.servlet.ServletException("Não foi possível prosseguir com o registro: " 
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
