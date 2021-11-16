<%-- 
    Document   : ListaCentroDeCosto
    Created on : 08-sep-2020, 16:29:56
    Author     : Felipe
--%>

<%@page import="Modelos.Area"%>
<%@page import="Modelos.TipoUsuario"%>
<%@page import="DAO.TipoUsuarioDAO"%>
<%@page import="DAO.AreaDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelos.Usuario"%>
<%@page import="Modelos.Usuario"%>
<%@page import="DAO.UsuarioDAO"%>
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
        HttpSession objsesion = request.getSession();
        String mensaje = (String)objsesion.getAttribute("mensajeDiv");
        if(mensaje==null){
            mensaje = "";
        }
    
        String rol = (String)objsesion.getAttribute("rol");
        
        if(!rol.equalsIgnoreCase("Administrador")){
            response.sendRedirect("Index.jsp");
        }
        
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
                                    <span>Lista Usuario</span>
                                </h1>
                                <div class="page-header-subtitle">Usuarios Ingresados en el Sistema.</div>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid mt-n10">
                        <div class="card mb-4">
                            <div class="card-header">Extended DataTables</div>
                            <div class="card-body">
                                <div class="justify-content-center" style="text-align: center;" id="divAlert">
                                    <%
                                        out.print(mensaje);
                                    %>
                                </div>
                                <form class="form-inline" action="BuscarUsuario" method="post" autocomplete="off">
                                    <div id="dataTable_filter" class="dataTables_filter">
                                        <label>Buscar&nbsp;
                                            <input type="search" name="txtBuscar" id="txtBuscar" class="form-control form-control-sm" placeholder="" aria-controls="dataTable">
                                            &nbsp;<button class="btn btn-primary btn-sm"  type="submit" name="btnBuscar" id="btnBuscar">Buscar</button>
                                        </label>
                                    </div>
                                </form>
                                <div class="datatable table-responsive" style="overflow-x: auto;">
                                    <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                             <tr>
                                                <th>Rut </th>
                                                <th>Nombre</th>
                                                <th>Apellido Paterno</th>
                                                <th>Apellido Materno</th>
                                                <th>Celular</th>
                                                <th>Correo</th>
                                                <th>Direccion</th>
                                                <th>Login Usuario</th>
                                                <th>Codigo Area</th>
                                                <th>Nombre Area</th>
                                                <th>Tipo Usuario</th>
						<th colspan="2">Acciones</th>
                                            </tr>
                                        </thead>
                                        <%
                                            UsuarioDAO objDAOUsuario = new UsuarioDAO();
                                            TipoUsuarioDAO objDAOTipoUsuario = new TipoUsuarioDAO();
                                            AreaDAO objDAOArea = new AreaDAO();
                                            
                                            ArrayList<Usuario> lstUsuario = objDAOUsuario.listarUsuario();
                                            ArrayList<TipoUsuario> lstTipoUsuario = objDAOTipoUsuario.listarTipoUsuario();
                                            ArrayList<Area> lstArea = objDAOArea.listaArea();
                                            
                                            Iterator<Usuario> iter = lstUsuario.iterator();
                                            Iterator<TipoUsuario> iterTipoUsuario = lstTipoUsuario.iterator();
                                            Iterator<Area> iterArea = lstArea.iterator();
                                            
                                            Usuario objUsuario = null;
                                            TipoUsuario objTipoUsuario = null;
                                            TipoUsuario objTipoUsuario2 = new TipoUsuario();
                                            Area objArea = null;
                                            Area objAreaXID = new Area();
                                            
                                            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy" /*Se puede agregar HH:mm:ss
                                            para obtener horas, minutos y segundos*/);
                                            String dates = "";
                                            %>
                                            
                                            <%
                                             while(iterArea.hasNext()){
                                                 objArea = iterArea.next();
                                             
                                            %>
                                            
                                            <%
                                                
                                            while(iterTipoUsuario.hasNext()){
                                                objTipoUsuario = iterTipoUsuario.next();
                                                
                                            %>
                                            
                                            <%
                                            while(iter.hasNext()){
                                                objUsuario = iter.next();
                                                int id = objUsuario.getId_tipo_usuario();
                                                objTipoUsuario2.setId_tipo_usuario(id);
                                                objTipoUsuario2 = objDAOTipoUsuario.buscarTipoUsuarioPorId(objTipoUsuario2);
                                                
                                                int codigo_area = objUsuario.getId_area();//codigo_centro_costo
                                                objAreaXID.setId_area(codigo_area);//codigo_centro_costo
                                                
                                                objAreaXID = objDAOArea.buscarPorId(objAreaXID) ;                                                

                                            %>
                                        <tbody>
                                            <tr>
                                                <td><%= objUsuario.getRut_usuario()%></td>
                                                <td><%= objUsuario.getNombre_usuario()%></td>
                                                <td><%= objUsuario.getApe_paterno_usuario()%></td>
                                                <td><%= objUsuario.getApe_materno_usuario()%></td>
                                                <td><%= objUsuario.getCelular_usuario()%></td>
                                                <td><%= objUsuario.getCorreo_usuario()%></td>
                                                <td><%= objUsuario.getDireccion_usuario()%></td>
                                                <td><%= objUsuario.getRut_usuario()%></td>
                                                <td><%= objUsuario.getId_area()%></td>
                                                <td><%= objAreaXID.getNombre_area()%></td>
                                                <td><%= objTipoUsuario2.getCategoria_tipo_usuario()%></td>
                                                <td>
                                                    <a href="ModUsuario?rut_usuario=<%= objUsuario.getRut_usuario()%>" class="btn btn-datatable btn-icon btn-transparent-dark" role="button" aria-pressed="true"><i data-icon="Y"></i></a>
                                                    <a href="DelUsuario?rut_usuario=<%= objUsuario.getRut_usuario()%>" class="btn btn-datatable btn-icon btn-transparent-dark" role="button" aria-pressed="true"><i data-feather="trash-2"></i></a>
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


