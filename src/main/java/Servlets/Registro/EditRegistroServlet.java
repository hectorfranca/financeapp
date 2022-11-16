/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets.Registro;

import Beans.RegistroBean;
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
@WebServlet(name = "EditRegistroServlet", urlPatterns = {"/EditRegistroServlet"})
public class EditRegistroServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        RegistroBean registro = new RegistroBean();
        RequestDispatcher requestDispatcher = null;
        
        try {            
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            requestDispatcher = request.getRequestDispatcher("editarRegistro.jsp");
            
            registro.setId(Long.parseLong(request.getParameter("id")));
            registro.setNome(request.getParameter("nome"));
            registro.setTipo(request.getParameter("tipo").charAt(0));
            registro.setData(dateFormat.parse(request.getParameter("data")));
            registro.setValor(Double.parseDouble(request.getParameter("valor")));
            
            request.setAttribute("registro", registro);
   
            requestDispatcher.forward(request, response);
        } catch(Exception exception) {
            throw new jakarta.servlet.ServletException("Não foi possível passar os dados do registro: " 
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