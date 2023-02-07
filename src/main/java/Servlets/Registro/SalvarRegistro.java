package Servlets.Registro;

import Beans.ContaBean;
import Beans.RegistroBean;
import DAO.CategoriaDAO;
import DAO.ContaDAO;
import DAO.RegistroDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;

@WebServlet(name = "SalvarRegistro", urlPatterns = {"/SalvarRegistro"})
public class SalvarRegistro extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ContaDAO contaDAO = new ContaDAO();
        ContaBean conta = new ContaBean();
        RegistroDAO registroDAO = new RegistroDAO();
        CategoriaDAO categoriaDAO = new CategoriaDAO();
        RegistroBean registro = new RegistroBean();
        SimpleDateFormat dateFormatUS = new SimpleDateFormat("yyyy-MM-dd");
        RequestDispatcher requestDispatcher = null;
        
        try {   
            conta = contaDAO.find(Long.parseLong(request.getSession().getAttribute("id").toString()));
                        
            registro.setNome(request.getParameter("nome"));
            registro.setTipo(request.getParameter("tipo").charAt(0));
            registro.setData(dateFormatUS.parse(request.getParameter("data")));         
            registro.setValor(Double.parseDouble(request.getParameter("valor")));
            registro.setCategoria(categoriaDAO.find(Long.parseLong(request.getParameter("categoria"))));          
            registro.setConta(conta);
            
            if (request.getParameter("id") != null) {
                request.setAttribute("registroMessage", "Registro alterado com sucesso!");
                requestDispatcher = request.getRequestDispatcher("/ListarRegistros"); 
                                
                registro.setId(Long.parseLong(request.getParameter("id")));                                 
                registroDAO.update(registro);            
            } else {
                request.setAttribute("registroMessage", "Registro cadastrado com sucesso!");
                requestDispatcher = request.getRequestDispatcher("/CadastrarRegistro");
                
                registroDAO.save(registro);
            }
            
            requestDispatcher.forward(request, response);
        } catch(Exception exception) {
            throw new ServletException("Não foi possível salvar o registro: " 
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
