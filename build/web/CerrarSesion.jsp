<%-- 
    Document   : CerrarSesion
    Created on : 16-sep-2020, 0:32:03
    Author     : Felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
        <% response.sendRedirect("IniciarSesion.jsp");%>
        
        <%
            String cerrar = request.getParameter("cerrar");
            if (cerrar.equalsIgnoreCase("true")) {
                session.invalidate();
            }
        %>
    </body>
</html>
