<%-- 
    Document   : ListaInventario
    Created on : 11-04-2021, 17:10:09
    Author     : Tapir
--%>

<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Modelos.CentroCosto"%>
<%@page import="DAO.CentroCostoDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelos.Inventario"%>
<%@page import="DAO.InventarioDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de inventarios</title>
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.24.1/feather.min.js" crossorigin="anonymous"></script>
    </head>
      <%
        HttpSession objsesion = request.getSession();
    
        //String rol = (String)objsesion.getAttribute("rol"); 
        int ar = (Integer)objsesion.getAttribute("area");
        
         System.out.println(objsesion);
        
        
    %>
    
    <body  class="nav-fixed">
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
                                    <span>Lista de Inventario</span>
                                </h1>
                                <div class="page-header-subtitle">Inventarios Ingresados en el Sistema.</div>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid mt-n10">
                        <div class="card mb-4">
                            <div class="card-header">Table Extendida</div>
                            <div class="card-body">
                                <form class="form-inline" action="BuscarInventario" method="post" autocomplete="off">
                                    <div id="dataTable_filter" class="dataTables_filter">
                                        <label>Buscar por codigo de Centro Costo&nbsp;
                                            <input type="search" name="txtBuscar" id="txtBuscar"  class="form-control form-control-sm" placeholder="" aria-controls="dataTable">
                                            &nbsp;<button class="btn btn-primary btn-sm"  type="submit" name="btnBuscar"  id="btnBuscar"> <i data-feather="search"></i>Buscar</button>
                                        </label>
                                    </div>
                                </form>
                                <div  class="datatable table-responsive" style="overflow-x: auto;">
                                    <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                                        <thead style="white-space: nowrap;">
                                             <tr>
                                                <th>N° Inventario</th>
                                                <th>Nombre Inventario</th>
                                                <th>Fecha Creación</th>
                                                <th>Centro Costo ID</th>
                                                <th>Centro Costo Nombre</th>
						<th colspan="2">Acciones</th>
                                            </tr>
                                        </thead>
                                        <%
                                            //Se crea el DAO del objeto 
                                            InventarioDAO objDAOInventario = new InventarioDAO();
                                            //Si tiene claves foraneas se crean sus objetos
                                            CentroCostoDAO objDAOCC = new CentroCostoDAO();
                                            
                                            
                                            //2 arrays list
                                            
                                            ArrayList<Inventario> lstInventario = objDAOInventario.listaInventario(ar);
                                            ArrayList<CentroCosto> lstCentroCosto = objDAOCC.listaCentroCosto();
                                            
                                            //2 iterator y null
                                            Iterator<Inventario> iter = lstInventario.iterator();
                                            Inventario objInventario = null;
                                      
                                            Iterator<CentroCosto> iter2 = lstCentroCosto.iterator();
                                            CentroCosto objCentroCosto = null;
                                            CentroCosto objCentroCostoXID = new CentroCosto();                                        
                                        %>
                                            
                                             <%
                                            while(iter2.hasNext()){
                                                objCentroCosto = iter2.next();                                                

                                            %>
                                            
                                            <%
                                            while(iter.hasNext()){
                                                objInventario = iter.next();
                                                
                                                
                                                Integer INTid_area = objInventario.getId_area();
                                                String id_area = String.valueOf(INTid_area);
                                                objCentroCostoXID.setCodigo_centro_costo(id_area);
                                                objCentroCostoXID = objDAOCC.buscarPorId(objCentroCostoXID);                                               

                                            %>
                                            
                                           
                                            
                                        <tbody style="white-space: normal;">
                                            <tr >
                                                <td><%= objInventario.getId_inventario()%></td>
                                                <td><%= objInventario.getDescripcion_inventario()%></td>
                                                <td><%= objInventario.getFecha_inventario()%></td>
                                                <td><%= objCentroCostoXID.getCodigo_centro_costo()%></td>
                                                <td><%= objCentroCostoXID.getNombre_centro_costo()%></td>
                                                <td>
                                                    <a href="ModProducto?id_producto=<%= objInventario.getId_inventario()%>" class="form-control form-control-sm" role="button" aria-pressed="true"><i class="fas fa-edit"></i></i></a>
                                                    <a href="DelProducto?id_producto=<%= objInventario.getId_inventario()%>" class="btn btn-datatable btn-icon btn-transparent-dark" role="button" aria-pressed="true"><i data-feather="trash-2"></i></a>
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
