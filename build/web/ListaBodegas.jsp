<%-- 
    Document   : ListaCentroDeCosto
    Created on : 08-sep-2020, 16:29:56
    Author     : Felipe
--%>

<%@page import="DAO.CentroCostoDAO"%>
<%@page import="Modelos.CentroCosto"%>
<%@page import="java.util.Iterator"%>
<%@page import="Modelos.Bodega"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.BodegaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tabla Bodegas</title>
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
                    <div class="page-header pb-10 page-header-dark bg-gradient-primary-to-secondary">
                        <div class="container-fluid">
                            <div class="page-header-content">
                                <h1 class="page-header-title">
                                    <div class="page-header-icon"><i data-feather="filter"></i></div>
                                    <span>Bodegas</span>
                                </h1>
                                <div class="page-header-subtitle">Bodegas ingresadas en el sistema.</div>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid mt-n10">
                        <div class="card mb-4">
                            <div class="card-header">Tabla Extendible</div>
                            <div class="card-body">
                                <form class="form-inline" action="BuscarBodega" method="post" autocomplete="off">
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
                                                <th>Código Bodega</th>
                                                <th>Volumen</th>
                                                <th>Ubicación</th>
                                                <th>Código Centro de Costo</th>
                                                <th>Nombre Centro de Costo</th>
                                                <th colspan="2">Acciones</th>
                                            </tr>
                                        </thead>
                                        <%
                                            BodegaDAO objDAOBodega= new BodegaDAO();
                                            ArrayList<Bodega> lstBodega= objDAOBodega.listaBodega();
                                            Iterator<Bodega> iter = lstBodega.iterator();
                                            Bodega objBodega = null;
                                            CentroCostoDAO objDAOCentroCosto = new CentroCostoDAO();
                                            ArrayList<CentroCosto> lstCentroCosto = objDAOCentroCosto.listaCentroCosto();
                                            Iterator<CentroCosto> iterCentroCosto = lstCentroCosto.iterator();
                                            CentroCosto objCentroCosto = null;
                                            
                                            
                                            CentroCosto objCentroCostoXID = new CentroCosto();
                                            
                                            
                                            while(iterCentroCosto.hasNext()){
                                                objCentroCosto = iterCentroCosto.next();
                                            

                                            while (iter.hasNext()) {                        
                                                    objBodega = iter.next();
                                                    String codigo_centro_costo = objBodega.getCodigo_centro_costo();
                                                    objCentroCostoXID.setCodigo_centro_costo(codigo_centro_costo);
                                                    objCentroCostoXID = objDAOCentroCosto.buscarPorId(objCentroCostoXID);

                                        %>
                                        <tbody>
                                            <tr>
                                                <td><%= objBodega.getCodigo_bodega() %></td>
                                                <td><%= objBodega.getVolumen_bodega() %>m³</td>
                                                <td><%= objBodega.getUbicacion_bodega() %></td>
                                                <td><%= objCentroCostoXID.getCodigo_centro_costo()%></td>
                                                <td><%= objCentroCostoXID.getNombre_centro_costo()%></td>
                                                <td>
                                                    <a href="ModBodega?codigo_bodega=<%= objBodega.getCodigo_bodega()%>" class="btn btn-datatable btn-icon btn-transparent-dark" role="button" aria-pressed="true"><i data-icon="Y"></i></a>
                                                    <a href="DelBodega?codigo_bodega=<%= objBodega.getCodigo_bodega()%>" class="btn btn-datatable btn-icon btn-transparent-dark" role="button" aria-pressed="true"><i data-feather="trash-2"></i></a>
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
                <footer class="footer mt-auto footer-light">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6 small">Copyright &copy; Your Website 2020</div>
                            <div class="col-md-6 text-md-right small">
                                <a href="#!">Privacy Policy</a>
                                &middot;
                                <a href="#!">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
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