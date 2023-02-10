package Servlets.Email;

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

@WebServlet(name = "ResetPassword", urlPatterns = {"/ResetPassword"})
public class ResetPassword extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ContaDAO contaDAO = new ContaDAO();
        ContaBean conta = new ContaBean();
        RequestDispatcher requestDispatcher = null;
        
        try {
            requestDispatcher = request.getRequestDispatcher("/Pages/redefinir-senha.jsp");
            conta = contaDAO.findByEmail(request.getParameter("email"));
            
            if (conta != null && conta.getSenhaToken() != null && conta.getSenhaToken().equals(request.getParameter("token"))) {
                String senha = request.getParameter("senha");
                
                MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
                messageDigest.update(senha.getBytes(), 0, senha.length());
                BigInteger senhaCriptografado = new BigInteger(1, messageDigest.digest());
                
                conta.setSenha(senhaCriptografado.toString(16));
                conta.setSenhaToken(null);
                contaDAO.update(conta);
                request.setAttribute("emailMessage", "<p>Seha alterada com sucesso!</p>");
            } else {
                 request.setAttribute("emailMessage", "<p>Não foi possível redefinir a senha.</p>"
                    + "<p>Contate o nosso suporte pelo canal de atendimento: <a href='financeapp@gmail.com'>financeapp@gmail.com</a></p>");
            }
           
            requestDispatcher.forward(request, response);
        } catch(Exception exception) {
            throw new ServletException("Não foi possível prosseguir para redefinir a senha: " 
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
