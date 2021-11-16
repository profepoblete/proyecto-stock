<%-- 
    Document   : ListaDetalleInventario
    Created on : 12-04-2021, 15:19:50
    Author     : Tapir
--%>

<%@page import="DAO.CentroCostoDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelos.Inventario"%>
<%@page import="DAO.InventarioDAO"%>
<%@page import="Modelos.Producto"%>
<%@page import="DAO.ProductoDAO"%>
<%@page import="Modelos.ProductoEsp"%>
<%@page import="DAO.ProductoEspDAO"%>
<%@page import="Modelos.DetalleInventario"%>
<%@page import="DAO.DetalleInventarioDAO"%>
<%@page import="Modelos.Ubicacion"%>
<%@page import="DAO.UbicacionDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado del Inventario</title>
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.24.1/feather.min.js" crossorigin="anonymous"></script>
    </head>
    <%
        HttpSession sesion = request.getSession();

//                                            Producto miproducto= (Producto) misession.getAttribute("producto");
        String Codigo = (String) sesion.getAttribute("centro");
    %>
    <body>
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
                                        <span>Listado de Stock</span>
                                    </h1>
                                    <div class="page-header-subtitle">Productos ingresados en Inventario.</div>
                                </div>
                            </div>
                        </div>
                        <div class="container-fluid mt-n10">
                            <div class="card mb-4">
                                <div class="card-header">Table Extendida</div>
                                <div class="card-body">
                                    <form class="form-inline" action="BuscarInventario" method="post" autocomplete="off">
                                        <div id="dataTable_filter" class="dataTables_filter">
                                            <label>Buscar por Nombre de Producto&nbsp;
                                                <input type="search" name="txtBuscar" id="txtBuscar"  class="form-control form-control-sm" placeholder="" aria-controls="dataTable">
                                                &nbsp;<button class="btn btn-primary btn-sm"  type="submit" name="btnBuscar"  id="btnBuscar"> <i data-feather="search"></i>Buscar</button>
                                            </label>
                                        </div>
                                    </form>
                                    <div  class="datatable table-responsive" style="overflow-x: auto;">
                                        <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                                            <thead style="white-space: nowrap;">
                                                <tr>
                                                    <th>Nombre Producto</th>
                                                    <th>Cantidad</th>
                                                    <th>Serial</th>
                                                    <th>Inventario</th>
                                                    <th>Ubicacion</th>
                                                    <th colspan="2">Acciones</th>
                                                </tr>
                                            </thead>
                                        <%
                                           
                                            
                                            //Se crea el DAO del objeto 
                                            InventarioDAO objDAOInventario = new InventarioDAO();
                                            
                                            //Si tiene claves foraneas se crean sus objetos
                                            DetalleInventarioDAO objDAODetalle = new DetalleInventarioDAO();
                                            ProductoDAO objDAOProdcuto = new ProductoDAO();
                                            ProductoEspDAO objDAOProdcutoE = new ProductoEspDAO();
                                            UbicacionDAO objDAOUbi = new UbicacionDAO();

                                            //2 arrays list // ACA SE ESTA CAYENDO 
                                            ArrayList<Inventario> lstInventario = objDAOInventario.listaInventario();
                                            ArrayList<DetalleInventario> lstDetalle = objDAODetalle.listaDetalleInventario();
                                            ArrayList<Producto> lstProducto = objDAOProdcuto.listarProducto();
                                            ArrayList<ProductoEsp> lstProductoEsp = objDAOProdcutoE.ListarProductoEsp();
                                            ArrayList<Ubicacion> lstUbicacion = objDAOUbi.listarUbicacion();

                                            //3 iterator y null
//                                            Iterator<Inventario> iter = lstInventario.iterator();
//                                            Inventario objInventario = null;
//
//                                            Iterator<DetalleInventario> iter2 = lstDetalle.iterator();
//                                            DetalleInventario objDetalleI = null;
//                                            DetalleInventario objDetalleIxID = new DetalleInventario();

                                            Iterator<DetalleInventario> iter = lstDetalle.iterator();
                                            DetalleInventario objDetalleI = null;
                                            
                                            Iterator<Inventario> iter2 = lstInventario.iterator();
                                            Inventario objInventario = null;
                                            Inventario objInventarioxID = new Inventario();
                                            
                                            Iterator<Producto> iter3 = lstProducto.iterator();
                                            Producto objProducto = null;
                                            Producto objProductoIxID = new Producto();
                                            
                                            Iterator<ProductoEsp> iter4 = lstProductoEsp.iterator();
                                            ProductoEsp objProductoEsp = null;
                                            ProductoEsp objProductoEspxID = new ProductoEsp();
                                            
                                            Iterator<Ubicacion> iter5 = lstUbicacion.iterator();
                                            Ubicacion objUbicacion = null;
                                            Ubicacion objUbicacionIxID = new Ubicacion();
                                        %>

                                        <%
                                            while (iter5.hasNext()) {
                                                objUbicacion = iter5.next();

                                        %>
                                        <%
                                            while (iter4.hasNext()) {
                                                objProductoEsp = iter4.next();

                                        %>
                                        <%
                                            while (iter3.hasNext()) {
                                                objProducto = iter3.next();

                                        %>
                                        <%
                                            while (iter2.hasNext()) {
                                                objInventario = iter2.next();

                                        %>

                                        <%      while (iter.hasNext()) {
                                                objDetalleI = iter.next();

                                                int cod5 = objDetalleI.getId_ubicacion();
                                                objUbicacionIxID.setId_ubicacion(cod5);
                                                objUbicacionIxID = objDAOUbi.buscarPorId(objUbicacionIxID);
                                                
                                                int cod4 = objDetalleI.getId_producto_E();
                                                objProductoEspxID.setId_producto_E(cod4);
                                                objProductoEspxID = objDAOProdcutoE.BuscarPorIdEsp(objProductoEspxID);
                                                
                                                int cod3 = objProductoEspxID.getId_producto();
                                                objProductoIxID.setId_producto(cod3);
                                                objProductoIxID = objDAOProdcuto.buscarPorId(objProductoIxID);
                                                

                                                int cod2 = objDetalleI.getId_inventario();
                                                objInventarioxID.setId_inventario(cod2);
                                                objInventarioxID = objDAOInventario.buscarxid(objInventarioxID);
                                        
                                        %>



                                        <tbody style="white-space: normal;">
                                            <tr >
                                                <td><%= objProductoIxID.getNombre_producto()%></td>
                                                <td><%= objDetalleI.getCantidad_producto_inventario()%></td>
                                                <td><%= objProductoEspxID.getSerial_producto()%></td>
                                                <td><%= objInventarioxID.getDescripcion_inventario()%></td>
                                                <td><%= objUbicacionIxID.getDescripcion_ubicacion()%></td>
                                                <td>
                                                    <a href="UpDetalleIn?id_producto=<%= objProductoEspxID.getId_producto_E()%>&detalle=<%= objDetalleI.getId_detalle_inventario() %>" class="form-control form-control-sm" role="button" aria-pressed="true"><i class="fas fa-edit"></i></i></a>
                                                    <a href="DelDetalleProducto?id_producto=<%= objDetalleI.getId_detalle_inventario()%>" class="btn btn-datatable btn-icon btn-transparent-dark" role="button" aria-pressed="true"><i data-feather="trash-2"></i></a>
                                                </td>
                                            </tr>
                                            <% } %>
                                            <% }%>
                                            <% }%>
                                            <% }%>
                                            <% }%>
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
</body>
</html>
