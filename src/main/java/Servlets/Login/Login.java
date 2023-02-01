package Servlets.Login;

import Beans.ContaBean;
import DAO.ContaDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.math.BigInteger;
import java.security.MessageDigest;

@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ContaDAO contaDAO = new ContaDAO();
        ContaBean conta = new ContaBean();
        
        try {
            String nomeEmail = request.getParameter("nome-email");
            
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.update(request.getParameter("senha").getBytes(), 0, request.getParameter("senha").length());
            BigInteger senhaCriptografada = new BigInteger(1, messageDigest.digest());
            
            conta = contaDAO.findAccount(nomeEmail, senhaCriptografada.toString(16));
        
            if (conta != null) {
                HttpSession session = request.getSession();
                session.setAttribute("id", conta.getId());
                session.setAttribute("nome", conta.getNome());
                session.setAttribute("email", conta.getEmail());
                
                response.sendRedirect(request.getContextPath() + "/Pages/menu.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/Pages/login.jsp");
            }
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
