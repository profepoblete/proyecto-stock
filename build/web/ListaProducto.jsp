<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Modelos.TipoProducto"%>
<%@page import="Modelos.TipoUnidad"%>
<%@page import="DAO.TipoProductoDAO"%>
<%@page import="DAO.TipoUnidadDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelos.Producto"%>
<%@page import="DAO.ProductoDAO"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tabla Sedes</title>
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.24.1/feather.min.js" crossorigin="anonymous"></script>
    </head>
    <%
        HttpSession objsesion = request.getSession();
    
        String rol = (String)objsesion.getAttribute("rol");
        
       
        
        
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
                                    <span>Lista Producto</span>
                                </h1>
                                <div class="page-header-subtitle">Productos Ingresados en el Sistema.</div>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid mt-n10">
                        <div class="card mb-4">
                            <div class="card-header">Table Extendida</div>
                            <div class="card-body">
                                <form class="form-inline" action="BuscarProducto" method="post" autocomplete="off">
                                    <div id="dataTable_filter" class="dataTables_filter">
                                        <label>Buscar&nbsp;
                                            <input type="search" name="txtBuscar" id="txtBuscar"  class="form-control form-control-sm" placeholder="" aria-controls="dataTable">
                                            &nbsp;<button class="btn btn-primary btn-sm"  type="submit" name="btnBuscar"  id="btnBuscar"> <i data-feather="search"></i>Buscar</button>
                                        </label>
                                    </div>
                                </form>
                                <div  class="datatable table-responsive" style="overflow-x: auto;">
                                    <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                                        <thead style="white-space: nowrap;">
                                             <tr>
                                                <th>Codigo Producto</th>
                                                <th>Nombre Producto</th>
                                                <th>Descripción Producto</th>
                                                <th>Valor</th>
                                                <th>Marca Producto</th>
                                                <th>Stock Minimo</th>
                                                <th>Proveedor</th>
                                                <th>Tipo Producto</th>
                                                <th>Subtipo Producto</th>
                                                <th>Tipo Unidad</th>
						<th colspan="2">Acciones</th>
                                            </tr>
                                        </thead>
                                        <%
                                            ProductoDAO objDAOProducto = new ProductoDAO();
                                            //agrego los 2 tipos
                                            TipoUnidadDAO objDAOTipoUnidad = new TipoUnidadDAO();
                                            TipoProductoDAO objDAOTipoProducto = new TipoProductoDAO();
                                            
                                            //2 arrays list
                                            ArrayList<Producto> lstProducto = objDAOProducto.listarProducto();
                                            ArrayList<TipoUnidad> lstTipoUnidad = objDAOTipoUnidad.listarTipoUnidad();
                                            ArrayList<TipoProducto> lstTipoProducto = objDAOTipoProducto.listarTipoProducto();
                                            
                                            //2 iterator y null
                                            Iterator<Producto> iter = lstProducto.iterator();
                                            Producto objProducto = null;
                                      
                                            Iterator<TipoUnidad> iter2 = lstTipoUnidad.iterator();
                                            TipoUnidad objTipoUnidad = null;
                                            TipoUnidad objTipoUnidadXID = new TipoUnidad();
                                            
                                            Iterator<TipoProducto> iter3 = lstTipoProducto.iterator();
                                            TipoProducto objTipoProducto = null;
                                            TipoProducto objTipoProductoXID = new TipoProducto();
                                            
                                       
                                            
                                             
                                            SimpleDateFormat formatter=new SimpleDateFormat("dd-MM-yyyy" /*Se puede agregar HH:mm:ss
                                            para obtener horas, minutos y segundos*/);
                                            String fechaIngreso = "";
                                            String fechaSalida = "";
                                            String fechaCapital = "";
                                            String fechaVencimiento = "";
                                            
                                            DecimalFormat formateador = new DecimalFormat("###,###,###");
                                            
                                            
                                        %>
                                        
                                        
                                        <%
                                                
                                            while(iter3.hasNext()){
                                                objTipoProducto = iter3.next();
                                                
                                            %>
                                            
                                             <%
                                            while(iter2.hasNext()){
                                                objTipoUnidad = iter2.next();
                                                

                                            %>
                                            
                                            <%
                                            while(iter.hasNext()){
                                                objProducto = iter.next();
                                                
                                                int id_tipo_unidad = objProducto.getId_tipo_unidad();
                                                objTipoUnidadXID.setId_tipo_unidad(id_tipo_unidad);
                                                objTipoUnidadXID = objDAOTipoUnidad.buscarPorId(objTipoUnidadXID);
                                                
                                                int id_tipo_producto = objProducto.getId_subtipo_producto();
                                                objTipoProductoXID.setId_tipo_producto(id_tipo_producto);
                                                objTipoProductoXID = objDAOTipoProducto.buscarPorId(objTipoProductoXID);
                                                
                                                String tipo = null; 
                                                
                                                if (objProducto.getTipo_producto() == 1) {
                                                        tipo = "Activo";
                                                    }
                                                else{
                                                    tipo = "Insumo";
                                                }

                                            %>
                                            
                                           
                                            
                                        <tbody style="white-space: normal;">
                                            <tr >
                                                <td><%= objProducto.getId_producto()%></td>
                                                <td><%= objProducto.getNombre_producto()%></td>
                                                <td><%= objProducto.getDescripcion_producto()%></td>
                                                <td><%= formateador.format(objProducto.getValor_producto())%></td>                                  
                                                <td><%= objProducto.getMarca_producto()%></td>
                                                <td><%= objProducto.getStock_minimo()%></td>
                                                <td><%= objProducto.getId_proveedor() %></td>
                                                <td><%= tipo %></td>
                                                <td><%= objTipoProductoXID.getCategoria_tipo_producto()%></td>
                                                <td><%= objTipoUnidadXID.getNombre_unidad()%></td>
                                                <td>
                                                    <a href="ModProducto?id_producto=<%= objProducto.getId_producto()%>" class="form-control form-control-sm" role="button" aria-pressed="true"><i class="fas fa-edit"></i></i></a>
                                                    <a href="DelProducto?id_producto=<%= objProducto.getId_producto()%>" class="btn btn-datatable btn-icon btn-transparent-dark" role="button" aria-pressed="true"><i data-feather="trash-2"></i></a>
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