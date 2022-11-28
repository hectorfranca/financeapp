package Servlets.Registro;

import Beans.ColecaoCategoriaBean;
import Beans.RegistroBean;
import DAO.CategoriaDAO;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "GoToFormRegistroServlet", urlPatterns = {"/GoToFormRegistroServlet"})
public class GoToFormRegistroServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        ColecaoCategoriaBean colecaoCategoriaBean = new ColecaoCategoriaBean();
        CategoriaDAO categoriaDAO = new CategoriaDAO();
        RequestDispatcher requestDispatcher;
        
        try {            
            colecaoCategoriaBean.setCategorias(categoriaDAO.getAll());         

            if (request.getParameter("id") != null) {
                RegistroBean registro = new RegistroBean();
                
                registro.setId(Long.parseLong(request.getParameter("id")));
                registro.setNome(request.getParameter("nome"));
                registro.setTipo(request.getParameter("tipo").charAt(0));          
                registro.setValor(Double.parseDouble(request.getParameter("valor")));
                registro.setCategoria(categoriaDAO.find(Long.parseLong(request.getParameter("categoria"))));
                               
                request.setAttribute("registro", registro);
                request.setAttribute("colecaoCategoria", colecaoCategoriaBean);
                
                requestDispatcher = request.getRequestDispatcher("/Pages/cadastroRegistro.jsp");   
            } else {
                if (!request.getParameter("tipo").equals("R") && !request.getParameter("tipo").equals("D")) {
                    requestDispatcher = request.getRequestDispatcher("/index.jsp");       
                } else {
                    request.setAttribute("tipo", request.getParameter("tipo"));
                    request.setAttribute("colecaoCategoria", colecaoCategoriaBean);
                              
                    requestDispatcher = request.getRequestDispatcher("/Pages/cadastroRegistro.jsp");   
                }
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
