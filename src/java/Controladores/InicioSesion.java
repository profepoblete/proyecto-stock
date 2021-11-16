/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import DAO.Consultas;
import DAO.TipoUsuarioDAO;
import DAO.UsuarioDAO;
import Modelos.Menu;
import Modelos.TipoUsuario;
import Modelos.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author Felipe
 */
@WebServlet(name = "InicioSesion", urlPatterns = {"/InicioSesion"})
public class InicioSesion extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        HttpSession objsesion = request.getSession(true);
        UsuarioDAO objUsuarioDAO = new UsuarioDAO();
        Consultas co = new Consultas();
        Usuario objUsuario = new Usuario();
        String rol = "";
        ArrayList<Menu> lstMenu = new ArrayList<Menu>();
        ArrayList<Menu> lstMenuIdPadre = new ArrayList<Menu>();
        
        String rut_usuario = request.getParameter("txtRut_Usuario");
        String password_usuario = request.getParameter("txtPassword_usuario");
        
        System.out.println(request.getParameter("txtRut_Usuario"));
        objUsuario.setRut_usuario(rut_usuario);
        System.out.println(objUsuario.getRut_usuario());
        objUsuario = objUsuarioDAO.buscarPorId(objUsuario);
        
        System.out.println(objUsuario.getId_tipo_usuario());
        int tipo_usuario = objUsuario.getId_tipo_usuario();
        String correo = objUsuario.getCorreo_usuario();
        String nombre = objUsuario.getNombre_usuario();
        String apellido_paterno = objUsuario.getApe_paterno_usuario();
        
        TipoUsuarioDAO objDAOTipoUsuario = new TipoUsuarioDAO();
        TipoUsuario objTipoUsuario = new TipoUsuario();
        objTipoUsuario.setId_tipo_usuario(tipo_usuario);
        
        objTipoUsuario = objDAOTipoUsuario.buscarTipoUsuarioPorId(objTipoUsuario);
        rol = objTipoUsuario.getCategoria_tipo_usuario();
        
        int area = objUsuario.getId_area();
        
        
        if(co.autenticacion(rut_usuario, password_usuario)){
            lstMenu = objUsuarioDAO.CargarMenuPorRol(tipo_usuario);
            lstMenuIdPadre = objUsuarioDAO.listaMenuIdPadre(tipo_usuario);
            objsesion.setAttribute("rut_usuario", rut_usuario);
            objsesion.setAttribute("correo_usuario", correo);
            objsesion.setAttribute("nombre", nombre);
            objsesion.setAttribute("ape_paterno", apellido_paterno);
            objsesion.setAttribute("rol", rol);
            objsesion.setAttribute("area", area);
            objsesion.setAttribute("listaMenu", lstMenu);
            objsesion.setAttribute("listaMenuIdPadre", lstMenuIdPadre);
            response.sendRedirect("Index.jsp");
        }else{
            String mensaje = "<div class=\"alert alert-danger alert-dismissable\">" +
"                <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
"                Rut y/o contraseña invalidos.</div>";
            objsesion.setAttribute("divError", mensaje);
            response.sendRedirect("IniciarSesion.jsp");
            
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
