package Servlets.Registro;

import Beans.ColecaoRegistroBean;
import Beans.ColecaoRegistroResumidoBean;
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
        RequestDispatcher requestDispatcher = null;  
        
        try {            
            SimpleDateFormat dateFormatUS = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            
            if (request.getParameter("tipoLista").equals("completa")) {
                ColecaoRegistroBean colecaoRegistro = new ColecaoRegistroBean();
                requestDispatcher = request.getRequestDispatcher("/Pages/listaCompletaRegistro.jsp");
                
                if (request.getParameter("tipo").equals("R")) {
                    colecaoRegistro.setRegistros(registroDAO.filtroDataListaReceitas(
                        dateFormatUS.parse(request.getParameter("dataInicial")),
                        dateFormatUS.parse(request.getParameter("dataFinal"))));               
                } else {
                    colecaoRegistro.setRegistros(registroDAO.filtroDataListaDespesas(
                        dateFormatUS.parse(request.getParameter("dataInicial")),
                        dateFormatUS.parse(request.getParameter("dataFinal"))));              
                }
                
                request.setAttribute("colecaoRegistro", colecaoRegistro);
            } else {
                ColecaoRegistroResumidoBean colecaoRegistroResumido = new ColecaoRegistroResumidoBean();
                requestDispatcher = request.getRequestDispatcher("/Pages/listaResumidaRegistro.jsp");
                
                if (request.getParameter("tipo").equals("R")) {
                    colecaoRegistroResumido.setRegistros(registroDAO.filtroDataListaReceitasResumida(
                        dateFormatUS.parse(request.getParameter("dataInicial")),
                        dateFormatUS.parse(request.getParameter("dataFinal"))));               
                } else {
                    colecaoRegistroResumido.setRegistros(registroDAO.filtroDataListaDespesasResumida(
                        dateFormatUS.parse(request.getParameter("dataInicial")),
                        dateFormatUS.parse(request.getParameter("dataFinal"))));              
                }
                
                request.setAttribute("colecaoRegistroResumido", colecaoRegistroResumido);
            }
                                    
            request.setAttribute("dataInicial", dateFormat.format(dateFormatUS.parse(request.getParameter("dataInicial"))));  
            request.setAttribute("dataFinal", dateFormat.format(dateFormatUS.parse(request.getParameter("dataFinal")))); 
            
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
