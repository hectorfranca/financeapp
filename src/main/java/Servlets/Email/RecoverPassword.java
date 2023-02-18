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
import java.security.NoSuchAlgorithmException;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@WebServlet(name = "RecoverPassword", urlPatterns = {"/RecoverPassword"})
public class RecoverPassword extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, AddressException, MessagingException, NoSuchAlgorithmException {
        
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Pages/recuperar-senha.jsp");
        ContaDAO contaDAO = new ContaDAO();
        ContaBean conta = new ContaBean();
               
        String to = request.getParameter("email");
        String from = "hectorjuliomartinsdefranca2@gmail.com";
        final String username = "hectorjuliomartinsdefranca2@gmail.com";
        final String password = "xvwwqczabyqzrcyo";
        String host = "smtp.gmail.com";
        
        Properties props = new Properties();
        
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        
        Authenticator authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        };
        
        Session session = Session.getInstance(props, authenticator);

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO,
                       InternetAddress.parse(to));
            message.setSubject("FinanceApp - Recuperação de senha");
                 
            String email = request.getParameter("email");
            String token = "";
            conta = contaDAO.findByEmail(request.getParameter("email"));
            String content = null;
            
            if (conta != null) {
                Random random = new Random();              
                long randomNumber = random.nextLong();
                
                MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
                messageDigest.update(String.valueOf(randomNumber).getBytes(), 0, String.valueOf(randomNumber).length());
                BigInteger tokenCriptografado = new BigInteger(1, messageDigest.digest());
                
                conta.setSenhaToken(tokenCriptografado.toString(16));
                contaDAO.update(conta);
                token = conta.getSenhaToken();
                
                content =
                "<h1>Equipe FinanceApp</h1>"
                + "<p>Olá,</p>"
                + "<p>foi solicitado a recuperação de senha de sua conta, acesse o link abaixo para cadastrar uma nova senha.</p>"
                + "<a href='http://localhost:8080/financeapp/RecoverEmail?email=" + email + "&token=" + token + "'>"
                    + "http://localhost:8080/financeapp/RecoverEmail?email=" + email + "&token=" + token + "</a>"
                + "<p>Se não foi você que solicitou a recuperação, entre em contato com o nosso suporte através dos canais abaixo.</p>"
                + "<a href='financeapp@gmail.com'>financeapp@gmail.com</a>";
            } else {
               request.setAttribute("emailMessage", "<p>Email não cadastrado.</p>"
                    + "<p>Crie sua conta aqui: <a href='http://localhost:8080/financeapp/Pages/registrar.jsp'>http://localhost:8080/financeapp/Pages/registrar.jsp</a></p>");            
            
               requestDispatcher.forward(request, response);
            }
                     
            message.setContent(content, "text/html");                   
            Transport.send(message);
            System.out.println("Email enviado com sucesso");
            
            request.setAttribute("emailMessage", "<p>Email enviado com sucesso!</p>"
                    + " <p>Verifique sua caixa de entrada, lixeira e spam.</p>");
            
            requestDispatcher.forward(request, response);
        } catch (MessagingException e) {
            System.out.println("Falha ao enviar o email");
            
            request.setAttribute("emailMessage", "<p>Não foi possível enviar o email.</p>"
                    + "<p>Contate o nosso suporte pelo canal de atendimento: <a href='financeapp@gmail.com'>financeapp@gmail.com</a></p>");           
            
            requestDispatcher.forward(request, response);
            throw new RuntimeException(e);
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
        try {
            processRequest(request, response);
        } catch (ServletException | IOException | NoSuchAlgorithmException | MessagingException ex) {
            Logger.getLogger(RecoverPassword.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ServletException | IOException | NoSuchAlgorithmException | MessagingException ex) {
            Logger.getLogger(RecoverPassword.class.getName()).log(Level.SEVERE, null, ex);
        }
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
