package Servlets.Registro;

import Beans.CategoriaBean;
import Beans.RegistroBean;
import DAO.CategoriaDAO;
import DAO.RegistroDAO;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;

/**
 *
 * @author Hector
 */
@WebServlet(name = "UpdateRegistroServlet", urlPatterns = {"/UpdateRegistroServlet"})
public class UpdateRegistroServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        RegistroDAO registroDAO = new RegistroDAO();
        CategoriaDAO categoriaDAO = new CategoriaDAO();
        RegistroBean registro = new RegistroBean();
        RequestDispatcher requestDispatcher = null;
        
        try {            
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            requestDispatcher = request.getRequestDispatcher("ListRegistroServlet");
            
            registro.setId(Long.parseLong(request.getParameter("id")));
            registro.setNome(request.getParameter("nome"));
            registro.setTipo(request.getParameter("tipo").charAt(0));
            registro.setData(dateFormat.parse(request.getParameter("data")));
            registro.setValor(Double.parseDouble(request.getParameter("valor")));
            
            CategoriaBean categoria = categoriaDAO.getCategoria(Integer.parseInt(request.getParameter("categoria")));
            registro.setCategoria(categoria);
         
            registroDAO.update(registro);
   
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