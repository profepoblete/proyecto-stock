/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import DAO.MenuDAO;
import Modelos.Menu;
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
@WebServlet(name = "UpdMenu", urlPatterns = {"/UpdMenu"})
public class UpdMenu extends HttpServlet {

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
            out.println("<title>Servlet UpdMenu</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdMenu at " + request.getContextPath() + "</h1>");
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
           
            MenuDAO objMenuDAO = new MenuDAO();
            Menu objMenu = new Menu();
            Menu objMenuMod = new Menu();
            
            
            
            objMenu.setId_menu(Integer.parseInt(request.getParameter("txtId_menu")));
            objMenu.setNombre_menu(request.getParameter("txtNombreMenu"));
            objMenu.setUrl_menu(request.getParameter("txtUrlMenu"));
            objMenu.setId_menu_padre(Integer.parseInt(request.getParameter("ddlSub_menu")));
            
            
            objMenuMod = objMenu;
            String mensaje = "";
            if(objMenuDAO.editarMenu(objMenuMod)){
                mensaje = "<div class=\"alert alert-success alert-dismissable\">" +
                "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
                "Menu Editado Correctamente.</div>";
                ses.setAttribute("mensajeDivMenu", mensaje);
                response.sendRedirect("ListaMenu.jsp");
            }else{
                mensaje = "<div class=\"alert alert-danger alert-dismissable\">" +
                "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
                "Error al Editar el Menu.</div>";
                ses.setAttribute("mensajeDivMenu", mensaje);
                response.sendRedirect("ListaMenu.jsp");
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
