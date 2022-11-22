package Servlets.Registro;

import Beans.ColecaoRegistroBean;
import DAO.RegistroDAO;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;

@WebServlet(name = "FiltroRegistroServlet", urlPatterns = {"/FiltroRegistroServlet"})
public class FiltroRegistroServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        RegistroDAO registroDAO = new RegistroDAO();
        ColecaoRegistroBean colecaoRegistro = new ColecaoRegistroBean();
        RequestDispatcher requestDispatcher = null;  
        
        try {            
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            requestDispatcher = request.getRequestDispatcher("/Pages/listaCompletaRegistro.jsp");

            if (request.getParameter("tipo").equals("R")) {
                colecaoRegistro.setRegistros(registroDAO.filtroDataListaReceitas (
                    dateFormat.parse(request.getParameter("dataInicial")),
                    dateFormat.parse(request.getParameter("dataFinal")))); 
            } else {
                colecaoRegistro.setRegistros(registroDAO.filtroDataListaDespesas (
                    dateFormat.parse(request.getParameter("dataInicial")), 
                    dateFormat.parse(request.getParameter("dataFinal")))); 
            }
            
            request.setAttribute("colecaoRegistro", colecaoRegistro);              
            requestDispatcher.forward(request, response);
        } catch(Exception exception) {
            throw new ServletException("Não foi possível listar os registros: " 
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
