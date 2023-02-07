package Servlets.Login;

import Beans.ContaBean;
import DAO.ContaDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigInteger;
import java.security.MessageDigest;

@WebServlet(name = "Registrar", urlPatterns = {"/Registrar"})
public class Registrar extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ContaBean conta = new ContaBean();
        ContaDAO contaDAO = new ContaDAO();
        RequestDispatcher requestDispatcher = null;
        
        try {               
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.update(request.getParameter("senha").getBytes(), 0, request.getParameter("senha").length());
            BigInteger senhaCriptografada = new BigInteger(1, messageDigest.digest());
            
            conta.setNome(request.getParameter("nome"));
            conta.setEmail(request.getParameter("email"));
            conta.setSenha(senhaCriptografada.toString(16));
            
            if (conta.getNome() != null && conta.getEmail() != null && conta.getSenha() != null) {
                if (contaDAO.findByEmail(conta.getEmail()) != null) {
                    requestDispatcher = request.getRequestDispatcher("/Pages/registrar.jsp");
                    request.setAttribute("registrationMessage", "Email já cadastrado!");
                } else {
                    requestDispatcher = request.getRequestDispatcher("/Pages/login.jsp");                    
                    request.setAttribute("loginMessage", "Conta cadastrada com sucesso!");
                    request.setAttribute("statusMessage", "success");
                    contaDAO.save(conta);
                }                
            }
            
            requestDispatcher.forward(request, response);
        } catch(Exception exception) {
            throw new ServletException("Não foi possível efetuar o login: " 
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
