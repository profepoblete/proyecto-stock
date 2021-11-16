<%-- 
    Document   : listadoMovimiento
    Created on : 18-04-2021, 20:20:18
    Author     : Tapir
--%>



<%@page import="java.util.Iterator"%>
<%@page import="Modelos.Movimiento"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.MovimientoDAO"%>
<%@page import="Modelos.Producto"%>
<%@page import="DAO.ProductoDAO"%>
<%@page import="Modelos.ProductoEsp"%>
<%@page import="DAO.ProductoEspDAO"%>
<%@page import="Modelos.Producto"%>
<%@page import="DAO.UbicacionDAO"%>
<%@page import="Modelos.Ubicacion"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado Movimiento</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.24.1/feather.min.js" crossorigin="anonymous"></script>
    </head>
</head>
<%
    HttpSession sesion = request.getSession();

    String Nombre = (String) sesion.getAttribute("nombre");
    String Apellido = (String) sesion.getAttribute("ape_paterno");

    String Compuesto = Nombre + ' ' + Apellido;
    
    String varaux = null;
%>
<body>
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
                                    <span>Movimientos</span>
                                </h1>
                                <div class="page-header-subtitle">Listado de movimientos realizados.</div>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid mt-n10">
                        <div class="card mb-4">
                            <div class="card-header">Tabla Extendible</div>
                            <div class="card-body">
                                <div class="datatable table-responsive">
                                    <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Fecha</th>
                                                <th>Ubicacion_original</th>
                                                <th>Ubicacion_nueva</th>
                                                <th>Activo</th>
                                                <th>N°Serie</th>
                                                <th>Responsable</th>

                                            </tr>
                                        </thead>
                                    <%
                                        //1 Se instancia un DAO
                                        MovimientoDAO objDAOMovimiento = new MovimientoDAO();
                                        ProductoDAO objDAOProdcuto = new ProductoDAO();
                                        ProductoEspDAO objDAOProdcutoE = new ProductoEspDAO();
                                        UbicacionDAO objDAOUbicacion = new  UbicacionDAO();
                                        

                                        //Se crean las listas y sus iteradores
                                        ArrayList<Movimiento> lstMovimiento = objDAOMovimiento.listarMovimiento();
                                        ArrayList<Producto> lstProducto = objDAOProdcuto.listarProducto();
                                        ArrayList<ProductoEsp> lstProductoEsp = objDAOProdcutoE.ListarProductoEsp();
                                        ArrayList<Ubicacion> lstUbicacion = objDAOUbicacion.listarUbicacion();

                                        Iterator<Movimiento> iter = lstMovimiento.iterator();
                                        Movimiento objMovimiento = null;

                                        Iterator<Producto> iter2 = lstProducto.iterator();
                                        Producto objProducto = null;
                                        Producto objProductoIxID = new Producto();

                                        Iterator<ProductoEsp> iter3 = lstProductoEsp.iterator();
                                        ProductoEsp objProductoEsp = null;
                                        ProductoEsp objProductoEspxID = new ProductoEsp();
                                        
                                        Iterator<Ubicacion> iter4 = lstUbicacion.iterator();
                                        Ubicacion objUbicacion1 = null;
                                        Ubicacion objUbicacionxID1 = new Ubicacion();
                                        
                                        Iterator<Ubicacion> iter5 = lstUbicacion.iterator();
                                        Ubicacion objUbicacion2 = null;
                                        Ubicacion objUbicacionxID2 = new Ubicacion();



                                    %>
                                    <%                                          while (iter4.hasNext()) {
                                            objUbicacion1 = iter4.next();

                                    %>
                                    <%                                          while (iter3.hasNext()) {
                                            objProductoEsp = iter3.next();

                                    %>
                                    <%                                            while (iter2.hasNext()) {
                                            objProducto = iter2.next();

                                    %>
                                    <%                                        while (iter.hasNext()) {
                                            objMovimiento = iter.next();

                                            int cod1 = objMovimiento.getId_producto_e();
                                            objProductoEspxID.setId_producto_E(cod1);
                                            objProductoEspxID = objDAOProdcutoE.BuscarPorIdEsp(objProductoEspxID);

                                            int cod2 = objProductoEspxID.getId_producto();
                                            objProductoIxID.setId_producto(cod2);
                                            objProductoIxID = objDAOProdcuto.buscarPorId(objProductoIxID);
                                            
                                            
                                            int cod3 = objMovimiento.getId_ubicacion_original();
                                            
                                            if (cod3 != 0) {
                                                    objUbicacionxID1.setId_ubicacion(cod3);
                                                    objUbicacionxID1 = objDAOUbicacion.buscarPorId(objUbicacionxID1);
                                                    
                                                    varaux = objUbicacionxID1.getNombre_ubicacion();
                                                    
                                                }
                                            else{
                                                varaux = "Sin ubicacion";
                                            };
                                            
                                            int cod4 = objMovimiento.getId_ubicacion_nuevo();
                                            objUbicacionxID2.setId_ubicacion(cod4);
                                            objUbicacionxID2 = objDAOUbicacion.buscarPorId(objUbicacionxID2);
                                            

                                            
                                            


                                    %>
                                    <tbody>
                                        <tr>
                                            <td><%= objMovimiento.getFecha_movimiento()%></td>
                                            <td><%= varaux%></td>
                                            <td><%= objUbicacionxID2.getNombre_ubicacion() %></td>
                                            <td><%= objProductoIxID.getNombre_producto()%></td>
                                            <td><%= objProductoEspxID.getSerial_producto()%></td>
                                            <td><%= Compuesto%></td>

                                        </tr>
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
</html>
