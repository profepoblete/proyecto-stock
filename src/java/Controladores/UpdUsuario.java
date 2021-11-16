/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import DAO.UsuarioDAO;
import Modelos.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Felipe
 */
public class UpdUsuario extends HttpServlet {

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
            out.println("<title>Servlet UpdUsuario</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdUsuario at " + request.getContextPath() + "</h1>");
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
            HttpSession ses = request.getSession();
            int AreaSeleccionada = Integer.parseInt(request.getParameter("ddlArea"));//centroCostoSeleccionado----ddlCentro_Costo
            UsuarioDAO objUsuarioDAO = new UsuarioDAO();
            Usuario objUsuario = new Usuario();
            Usuario objUserMod = new Usuario();
            int id_usuario = Integer.parseInt(request.getParameter("txtId_usuario"));
            
            objUsuario.setId_usuario(id_usuario);
            objUsuario.setRut_usuario(request.getParameter("txtRut_Usuario"));
            objUsuario.setNombre_usuario(request.getParameter("txtNombreUsuario"));
            objUsuario.setPassword_usuario(request.getParameter("txtPassword_usuario"));
            objUsuario.setApe_paterno_usuario(request.getParameter("txtApe_paterno_usuario"));
            objUsuario.setApe_materno_usuario(request.getParameter("txtApe_materno_usuario"));
            objUsuario.setCelular_usuario(request.getParameter("txtCelular_usuario"));
            objUsuario.setCorreo_usuario(request.getParameter("txtCorreo_usuario"));
            objUsuario.setDireccion_usuario(request.getParameter("txtDireccion_usuario"));
            objUsuario.setId_tipo_usuario(Integer.parseInt(request.getParameter("ddlTipo_Usuario")));
            objUsuario.setId_area(AreaSeleccionada);//centroCostoSeleccionado
            
            objUserMod = objUsuario;
            
            objUsuarioDAO.editarUsuario(objUserMod);
            response.sendRedirect("ListaUsuario.jsp");
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
