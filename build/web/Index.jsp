
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession objsesion = request.getSession();

    String nombre = (String) objsesion.getAttribute("nombre");
%>

<!DOCTYPE html>
<<html lang="es">
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
        <%
            HttpSession sessionMostrar = request.getSession();
            String rut_usuario = (String) sessionMostrar.getAttribute("rut_usuario");
            if (rut_usuario.equalsIgnoreCase("")) {
                response.sendRedirect("IniciarSesion.jsp");
            }
    

        %>
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
                                        <div class="page-header-icon"><i data-feather="activity"></i></div>
                                        <span>Bienvenido al Sistema Stock Duoc UC</span>
                                    </h1>
                                    <div class="page-header-subtitle"><% out.println("Estas conectado como: " + nombre);%></div>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid mt-n10">

                        <div class="card-deck">
                            <div class="card mb-2">
                                <div class="card-body">
                                    <h5 class="card-title text-primary">Mis notificaciones</h5>
                                    <p class="card-text">Próximamente, una lista de las notificaciones generada por el sistema sobre el estado de stock y depreciación de los productos registrado.</p>
                                </div>
                                <img class="card-img-top" src="assets/img/drawkit/color/drawkit-content-man-alt.svg" alt="..." />    
                            </div>
                            <div class="card mb-2">
                                <div class="card-body">
                                    <h5 class="card-title text-primary">Mis últimos movimientos</h5>
                                    <p class="card-text">Próximamente, un registro de los últimos ingresos y de egresos de productos en el sistema.</p>
                                </div>
                                <img class="card-img-top" src="assets/img/drawkit/color/drawkit-hiker-man.svg" alt="..." />                                
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
