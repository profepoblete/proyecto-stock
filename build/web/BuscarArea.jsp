

<%@page import="Modelos.Sede"%>
<%@page import="DAO.SedeDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="Modelos.Area"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.AreaDAO"%>
<%-- 
    Document   : ListaArea
    Created on : 08-sep-2020, 16:17:21
    Author     : Felipe
--%>

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
                                    <span>Areas</span>
                                </h1>
                                <div class="page-header-subtitle">Areas ingresadas en el sistema.</div>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid mt-n10">
                        <div class="card mb-4">
                            <div class="card-header">Tabla Extendible</div>
                            <div class="card-body">
                                <form class="form-inline" action="BuscarArea" method="post" autocomplete="off">
                                    <div id="dataTable_filter" class="dataTables_filter">
                                        <label>Buscar&nbsp;
                                            <input type="search" name="txtBuscar" id="txtBuscar" class="form-control form-control-sm" placeholder="" aria-controls="dataTable">
                                            &nbsp;<button class="btn btn-primary btn-sm"  type="submit" name="btnBuscar" id="btnBuscar">Buscar</button>
                                            <a class="btn btn-primary btn-sm" style="margin-left: 5px;" type="button" href="ListaArea.jsp" name="btnBuscar" id="btnBuscar">Volver</a>
                                        </label>
                                    </div>
                                </form>
                                <div class="datatable table-responsive">
                                    <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>C??digo ??rea</th>
                                                <th>Nombre</th>
                                                <th>C??digo Sede</th>
                                                <th>Nombre Sede</th>
                                                <th colspan="2">Acciones</th>
                                            </tr>
                                        </thead>
                                        <%
                                        HttpSession sessionMostrar = request.getSession();
                                        List<Area> lista = new ArrayList<Area>();
                                        lista = (List<Area>)sessionMostrar.getAttribute("lstBuscarArea");
                                        Iterator<Area> iter = lista.iterator();
                                        Area objArea = null;
                                        
                                        SedeDAO objSedeDAO = new SedeDAO();
                                        ArrayList<Sede> lstSede = objSedeDAO.listSede();
                                        
                                        Iterator<Sede> iter2 = lstSede.iterator();
                                        Sede objSede = null;
                                        Sede objSedeXID = new Sede();
                                        
                                        %>
                                        <%
                                            while(iter2.hasNext()){
                                                objSede = iter2.next();
                                                

                                            %>
                                            <%
                                            while (iter.hasNext()) {                        
                                            objArea = iter.next();
                                            String codigo_sede = objSede.getCodigo_sede();
                                            objSedeXID.setCodigo_sede(codigo_sede);
                                            objSedeXID = objSedeDAO.buscarPorIdi(objSedeXID);
                    
                                            %>
                                        <tbody>
                                            <tr>
                                                <td><%= objArea.getCodigo_area() %></td>
                                                <td><%= objArea.getNombre_area() %></td>
                                                <td><%= objArea.getCodigo_sede()%></td>
                                                <td><%= objSedeXID.getNombre_sede()%></td>
                                                <td>
                                                    <a href="ModArea?codigo_area=<%= objArea.getCodigo_area() %>" class="btn btn-datatable btn-icon btn-transparent-dark" role="button" aria-pressed="true"><i data-icon="Y"></i></a>
                                                    <a href="DelArea?codigo_area=<%= objArea.getCodigo_area() %>" class="btn btn-datatable btn-icon btn-transparent-dark" role="button" aria-pressed="true"><i data-feather="trash-2"></i></a>
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

