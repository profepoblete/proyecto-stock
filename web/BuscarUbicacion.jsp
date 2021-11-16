<%@page import="Modelos.Area"%>
<%@page import="DAO.AreaDAO"%>
<%@page import="Modelos.TipoUbicacion"%>
<%@page import="DAO.TipoUbicacionDAO"%>
<%@page import="Modelos.Ubicacion"%>
<%@page import="DAO.UbicacionDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tabla Ubicacion</title>
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
                                    <span>Lista Ubicacion</span>
                                </h1>
                                <div class="page-header-subtitle">Lista de Ubicacion</div>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid mt-n10">
                        <div class="card mb-4">
                            <div class="card-header">Extended DataTables</div>
                            <div class="card-body">
                                <form class="form-inline" action="BuscarUbicacion" method="post" autocomplete="off">
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
                                                <th>Codigo Ubicacion</th>
                                                <th>Descripcion Ubicacion</th>
                                                <th>Nombre Area</th>
                                                <th>Tipo Ubicacion</th>
						<th colspan="2">Acciones</th>
                                            </tr>
                                        </thead>
                                       
                                    <%
                                        UbicacionDAO objDAOUbicacion = new UbicacionDAO();
                                        ArrayList<Ubicacion> lstUbicacion = objDAOUbicacion.listarUbicacion();
                                        Iterator<Ubicacion> iter = lstUbicacion.iterator();
                                        Ubicacion objUbicacion = null;
                                        
                                        TipoUbicacionDAO objDAOTipoUbicacion = new TipoUbicacionDAO();
                                        AreaDAO objDAOArea = new AreaDAO();
                                        
                                        ArrayList<TipoUbicacion> lstTipoUbicacion = objDAOTipoUbicacion.listaTipoUbicacion();
                                        ArrayList<Area> lstArea = objDAOArea.listaArea();
                                        
                                        Iterator<TipoUbicacion> iter2 = lstTipoUbicacion.iterator();
                                        TipoUbicacion objTipoUbicacion = null;
                                        TipoUbicacion objTipoUbicacionXID = new TipoUbicacion();
                                        
                                        Iterator<Area> iter3 = lstArea.iterator();
                                        Area objArea = null;
                                        Area objAreaXID = new Area();
                                    %>
                                    
                                    <%
                                                
                                            while(iter3.hasNext()){
                                                objArea = iter3.next();
                                                
                                            %>
                                            
                                             <%
                                            while(iter2.hasNext()){
                                                objTipoUbicacion = iter2.next();
                                                

                                            %>
                                    
                                    
                                    <%

                                        while (iter.hasNext()) {
                                            objUbicacion = iter.next();
                                            
                                            String id_tipo_ubicacion = objUbicacion.getCodigo_ubicacion();
                                            int id = objUbicacion.getId_tipo_ubicacion();
                                            objTipoUbicacionXID.setId_tipo_ubicacion(id);
                                            objTipoUbicacionXID = objDAOTipoUbicacion.buscarPorId(objTipoUbicacionXID);

                                            String codigo_area = objArea.getCodigo_area();
                                            objAreaXID.setCodigo_area(codigo_area);
                                            objAreaXID = objDAOArea.buscarPorId(objAreaXID);

                                    %>
                                        <tbody>
                                            <tr>
                                                <td><%= objUbicacion.getCodigo_ubicacion()%></td>
                                                <td><%= objUbicacion.getDescripcion_ubicacion()%></td>
                                                <td><%= objAreaXID.getNombre_area()%></td>
                                                <td><%= objTipoUbicacionXID.getNombre_tipo_ubicacion()%></td>
                                                <td>
                                                    <a href="ModUbicacion?codigo_ubicacion=<%= objUbicacion.getCodigo_ubicacion()%>" class="btn btn-datatable btn-icon btn-transparent-dark" role="button" aria-pressed="true"><i data-icon="Y"></i></a>
                                                    <a href="DelUbicacion?codigo_ubicacion=<%= objUbicacion.getCodigo_ubicacion() %>" class="btn btn-datatable btn-icon btn-transparent-dark" role="button" aria-pressed="true"><i data-feather="trash-2"></i></a>
                                                </td>
                                            </tr>
                                             <% } %>
                                        <% } %>
                                    <% } %>
                                          
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="footer mt-auto footer-light">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6 small">Copyright &copy; Proyecto Stock 2020</div>
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

