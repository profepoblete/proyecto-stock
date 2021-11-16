/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import DAO.CentroCostoDAO;
import Modelos.CentroCosto;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author José Pablo
 */
@WebServlet(name = "AddCentroCosto", urlPatterns = {"/AddCentroCosto"})
public class AddCentroCosto extends HttpServlet {

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
            out.println("<title>Servlet AddCentroCosto</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCentroCosto at " + request.getContextPath() + "</h1>");
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
          CentroCostoDAO objDAO = new CentroCostoDAO();
        CentroCosto objCentroCosto = new CentroCosto();
        
        objCentroCosto.setCodigo_centro_costo(request.getParameter("txt_codigo_CCosto"));
        objCentroCosto.setNombre_centro_costo(request.getParameter("txt_nombre_CCosto"));
        try {
            Date startDate=new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dtpFechaCentroCosto"));
            objCentroCosto.setFecha_compra_centro_costo(startDate);
        } catch (ParseException ex) {
            System.out.print(ex);
        }
        objCentroCosto.setTotalGasto_centro_costo(Integer.parseInt(request.getParameter("txt_GastoTotal")));
        objCentroCosto.setCodigo_area(request.getParameter("ddlID_Area_CCosto"));
       
        if (objDAO.agregarCentroCosto(objCentroCosto)) {
            response.sendRedirect("ListaCentroDeCosto.jsp");
        }else{
            response.sendRedirect("Error.jsp");
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
