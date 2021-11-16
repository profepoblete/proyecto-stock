/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import DAO.TipoUsuarioDAO;
import DAO.UsuarioDAO;
import Modelos.TipoUsuario;
import Modelos.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Diego
 */
@WebServlet(name = "ModTipoUsuario", urlPatterns = {"/ModTipoUsuario"})
public class ModTipoUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ModTipoUsuario</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ModTipoUsuario at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
            HttpSession ses = request.getSession();
            TipoUsuarioDAO objTipoUsuarioDAO = new TipoUsuarioDAO();
            TipoUsuario objTipoUsuario = new TipoUsuario();
            TipoUsuario objTipoUsuarioMod = new TipoUsuario();
            
            int id_tipo_usuario = Integer.parseInt(request.getParameter("id_tipo_usuario"));
            objTipoUsuario.setId_tipo_usuario(id_tipo_usuario);
        
            objTipoUsuarioMod = objTipoUsuarioDAO.buscarTipoUsuarioPorId(objTipoUsuario);
        
            ses.setAttribute("objTipoUsuarioMod", objTipoUsuarioMod);
            ses.setAttribute("id_tipo_usuario", id_tipo_usuario);
            
            response.sendRedirect("EditarTipoUsuario.jsp");
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
