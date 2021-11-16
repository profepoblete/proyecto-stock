<%-- 
    Document   : ListaCentroDeCosto
    Created on : 08-sep-2020, 16:29:56
    Author     : Felipe
--%>

<%@page import="java.util.List"%>
<%@page import="DAO.MenuDAO"%>
<%@page import="Modelos.Menu"%>
<%@page import="Modelos.TipoMenu"%>
<%@page import="DAO.TipoMenuDAO"%>
<%@page import="Modelos.TipoUsuario"%>
<%@page import="DAO.TipoUsuarioDAO"%>
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
                                    <span>Lista de Tipos de Menú</span>
                                </h1>
                                <div class="page-header-subtitle">Tipos de Menú Ingresados en el Sistema.</div>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid mt-n10">
                        <div class="card mb-4">
                            <div class="card-header">Extended DataTables</div>
                            <div class="card-body">
                                <form class="form-inline" action="BuscarTipoMenu" method="post" autocomplete="off">
                                    <div id="dataTable_filter" class="dataTables_filter">
                                        <label>Buscar&nbsp;
                                            <input type="search" name="txtBuscar" id="txtBuscar" class="form-control form-control-sm" placeholder="" aria-controls="dataTable">
                                            &nbsp;<button class="btn btn-primary btn-sm"  type="submit" name="btnBuscar" id="btnBuscar">Buscar</button>
                                            <a class="btn btn-primary btn-sm" style="margin-left: 5px;" type="button" href="ListaTipoMenu.jsp" name="btnBuscar" id="btnBuscar">Volver</a>
                                        </label>
                                    </div>
                                </form>
                                <div class="datatable table-responsive" style="overflow-x: auto;">
                                    <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                                        <%
                                            TipoUsuarioDAO objDAOTipoUsuario = new TipoUsuarioDAO();
                                            ArrayList<TipoUsuario> lstTipoUsuario = objDAOTipoUsuario.listarTipoUsuario();
                                            Iterator<TipoUsuario> iter = lstTipoUsuario.iterator();
                                            TipoUsuario objTipoUsuario = null;
                                            while(iter.hasNext()){
                                                objTipoUsuario = iter.next();
                                        %>
                                                <th colspan="1"><%=objTipoUsuario.getCategoria_tipo_usuario()%></th>
						
                                             
                                        
                                        <th colspan="2">Acciones</th>
                                        <%
                                            HttpSession sessionMostrar = request.getSession();
                                            List<TipoMenu> lista = new ArrayList<TipoMenu>();
                                            lista = (List<TipoMenu>)sessionMostrar.getAttribute("lstBuscarTipoMenu");
                                            Iterator<TipoMenu> iterTipoMenu = lista.iterator();
                                            TipoMenu objTipoMenu = null;
                                            Menu objMenu2 = new Menu();
                                            MenuDAO objMenuDAO = new MenuDAO();
                                           while(iterTipoMenu.hasNext()){
                                               objTipoMenu = iterTipoMenu.next();
                                               int id = objTipoMenu.getId_menu();
                                               objMenu2.setId_menu(id);
                                               objMenu2 = objMenuDAO.buscarMenuPorId(objMenu2);
                                           
                                        %>
                                        <tbody>
                                            <tr>
                                                <td><%= objMenu2.getNombre_menu()%></td>
                                                <td>
                                                    <a href="ModTipoMenu?id_tipo_menu=<%= objTipoMenu.getId_tipo_menu()%>" class="btn btn-datatable btn-icon btn-transparent-dark" role="button" aria-pressed="true"><i data-icon="Y"></i></a>
                                                    <a href="DelTipoMenu?id_tipo_menu=<%= objTipoMenu.getId_tipo_menu()%>" class="btn btn-datatable btn-icon btn-transparent-dark" role="button" aria-pressed="true"><i data-feather="trash-2"></i></a>
                                                </td>
                                            </tr>
                                        <% } %>
                                        </tbody>
                                        <% }%>
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


