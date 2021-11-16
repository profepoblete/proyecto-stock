<%-- 
    Document   : ListaCentroDeCosto
    Created on : 08-sep-2020, 16:29:56
    Author     : Felipe
--%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Modelos.Area"%>
<%@page import="DAO.AreaDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="Modelos.CentroCosto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.CentroCostoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tabla Sedes</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.24.1/feather.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="nav-fixed">
        <jsp:include page="Header.jsp"></jsp:include> 
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <jsp:include page="Menu.jsp"></jsp:include>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="page-header pb-10 page-header-dark bg-gradient-primary-to-secondary">
                        <div class="container-fluid">
                            <div class="page-header-content">
                                <h1 class="page-header-title">
                                    <div class="page-header-icon"><i data-feather="filter"></i></div>
                                    <span>Centro de Costos</span>
                                </h1>
                                <div class="page-header-subtitle">Centro de Costos ingresadas en el sistema.</div>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid mt-n10">
                        <div class="card mb-4">
                            <div class="card-header">Tabla Extendible</div>
                            <div class="card-body">
                                 <form class="form-inline" action="BuscarCentroCosto" method="post" autocomplete="off">
                                    <div id="dataTable_filter" class="dataTables_filter">
                                        <label>Buscar&nbsp;
                                            <input type="search" name="txtBuscar" id="txtBuscar" class="form-control form-control-sm" placeholder="" aria-controls="dataTable">
                                            &nbsp;<button class="btn btn-primary btn-sm"  type="submit" name="btnBuscar" id="btnBuscar">Buscar</button>
                                        </label>
                                    </div>
                                </form>
                                <div class="datatable table-responsive">
                                    <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Código Centro de Costo</th>
                                                <th>Nombre</th>
                                                <th>Fecha</th>                                                
                                                <th>Gasto Total</th>
                                                <th>Código Area</th>
                                                <th>Nombre Area</th>
                                                <th colspan="2">Acciones</th>
                                            </tr>
                                        </thead>
                                     <%
                                        CentroCostoDAO objDAOCentroCosto = new CentroCostoDAO();
                                        ArrayList<CentroCosto> lstCentroCosto = objDAOCentroCosto.listaCentroCosto();
                                        Iterator<CentroCosto> iter = lstCentroCosto.iterator();
                                        CentroCosto objCentroCosto = null;
                                        
                                        AreaDAO objAreaDAO = new AreaDAO();
                                        ArrayList<Area> lstArea = objAreaDAO.listaArea();
                                        
                                        Iterator<Area> iter2 = lstArea.iterator();
                                        Area objArea = null;
                                        Area objAreaXID = new Area();
                                        
                                        SimpleDateFormat formatter=new SimpleDateFormat("dd-MM-yyyy" /*Se puede agregar HH:mm:ss
                                        para obtener horas, minutos y segundos*/);
                                        String fechaCentroCosto = "";
                                        %>
                                         <%
                                            while(iter2.hasNext()){
                                                objArea = iter2.next();
                                         %>
                                    <%
                                        while (iter.hasNext()) {
                                            objCentroCosto = iter.next(); 
                                            if(objCentroCosto.getCodigo_area() != null)
                                            {
                                                String codigo_area = objCentroCosto.getCodigo_area();
                                                objAreaXID.setId_area(Integer.parseInt(codigo_area)); //ESTO FUE CAMBIADO
                                                objAreaXID = objAreaDAO.buscarPorId(objAreaXID);
                                            }
                                            

                                    %>
                                        <tbody>
                                            <tr>
                                                <td><%= objCentroCosto.getCodigo_centro_costo() %></td>
                                                <td><%= objCentroCosto.getNombre_centro_costo() %></td>
                                                <td><% if(objCentroCosto.getFecha_compra_centro_costo() !=null){%>
                                                        <%=fechaCentroCosto = formatter.format(objCentroCosto.getFecha_compra_centro_costo())%>
                                                       <%}
                                                       else
                                                       {%>
                                                        <i>null</i>
                                                       <%}
                                                    %>
                                                </td>
                                                <td>
                                                       <%= objCentroCosto.getTotalGasto_centro_costo() %>
                                                </td>
                                                <td><%
                                                        if(objCentroCosto.getCodigo_area() !=null){%>
                                                            <%=objAreaXID.getCodigo_area()%>
                                                        <%}
                                                        else
                                                        {%>
                                                         <i>null</i>
                                                        <%}
                                                    %>
                                                </td>       
                                                <td><%
                                                    if(objCentroCosto.getCodigo_area() !=null){ %>
                                                        <%=objAreaXID.getNombre_area()%>
                                                    <%}
                                                    else
                                                       {%>
                                                        <i>null</i>
                                                       <%}
                                                %></td>
                                                <td>
                                                    <!--ESTO FUE CAMBIADO V-->
                                                    <a href="ModCentroCosto?codigo_centro_costo=<%= objCentroCosto.getCodigo_centro_costo() %>" class="btn btn-datatable btn-icon btn-transparent-dark" role="button" aria-pressed="true"><i data-icon="Y" data-feather="edit"></i></a>
                                                    <!--ESTO FUE CAMBIADO ^-->
                                                    <a href="DelCentroCosto?codigo_centro_costo=<%= objCentroCosto.getCodigo_centro_costo() %>" class="btn btn-datatable btn-icon btn-transparent-dark" role="button" aria-pressed="true"><i data-feather="trash-2"></i></a>
                                                </td>

                                            </tr>
                                                <% } %>  
                                            <% } %> 
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </main>
                <jsp:include page="Footer.jsp"></jsp:include>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>
        
    </body>
</html>

