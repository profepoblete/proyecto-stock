<%@page import="java.sql.PreparedStatement"%>
<%@page import="Conexion.ConexionDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Iterator"%>
<%@page import="Modelos.Proveedor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.ProveedorDAO"%>
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
    <%
        ConexionDB objCone = new ConexionDB();
    %>
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
                                    <span>Lista Proveedor</span>
                                </h1>
                                <div class="page-header-subtitle">Lista de Proveedor de los Productos</div>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid mt-n10">
                        <div class="card mb-4">
                            <div class="card-header">Extended DataTables</div>
                            <div class="card-body">
                                <form class="form-inline" action="BuscarProveedor" method="post" autocomplete="off">
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
                                                <th>Rut </th>
                                                <th>Nombre</th>
                                                <th>Razon Social</th>
                                                <th>Correo</th>
                                                <th>Direccion</th>
                                                <th>Fono</th>
                                                <%--<th>Estado</th>--%>
                                                <th>Comuna</th>
                                                <th colspan="2">Acciones</th>
                                            </tr>
                                        </thead>
                                        <%--<tfoot>                                          
                                            <tr>
                                                <th>Rut </th>
                                                <th>Nombre</th>
                                                <th>Razon Social</th>
                                                <th>Correo</th>
                                                <th>Direccion</th>
                                                <th>Fono</th>
                                                <th>Estado</th>
                                                <th>Comuna</th>
						<th>Acciones</th>
                                            </tr>
                                        </tfoot>--%>
                                        <%
                                            ProveedorDAO objDAOProveedor = new ProveedorDAO();
                                            ArrayList<Proveedor> lstProveedor = objDAOProveedor.listarProveedor();
                                            Iterator<Proveedor> iter = lstProveedor.iterator();
                                            Proveedor objProveedor = null;
                
                                            while (iter.hasNext()) {                        
                                            objProveedor = iter.next();
                                        %>
                                        <tbody>
                                            <tr>
                                                <td><%= objProveedor.getRut_proveedor() %></td>
                                                <td><%= objProveedor.getNombre_proveedor() %></td>
                                                <td><%= objProveedor.getRazon_social_proveedor() %></td>
                                                <td><%= objProveedor.getCorreo_proveedor() %></td>
                                                <td><%= objProveedor.getDireccion_proveedor() %></td>
                                                <td><%= objProveedor.getFono_proveedor() %></td>
                                                <%--<td><%= objProveedor.getEstado_proveedor() %></td>--%>                                                
                                                <td>
                                                    <%
                                                        try 
                                                        {
                                                            objCone.getConn();
                                                            String query = "SELECT nombre_comuna FROM comuna where id_comuna = "+objProveedor.getId_comuna();
                                                            PreparedStatement psI;
                                                            ResultSet rs;
                                                            psI = objCone.getConn().prepareStatement(query);
                                                            rs = psI.executeQuery();
                                                            while (rs.next()) {
                                                                out.println(rs.getString(1));
                                                            }
                                                        } 
                                                        catch(Exception e) {
                                                        }
                                                            %>
                                                </td>
                                                <td>
                                                    <a href="ModProveedor?rut_proveedor=<%= objProveedor.getRut_proveedor()%>" class="btn btn-datatable btn-icon btn-transparent-dark" role="button" aria-pressed="true"><i data-icon="Y"></i></a>
                                                    <a href="DelProveedor?id_proveedor=<%= objProveedor.getId_proveedor()%>" class="btn btn-datatable btn-icon btn-transparent-dark" role="button" aria-pressed="true"><i data-feather="trash-2"></i></a>
                                                </td>
                                            </tr>
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

