<%-- 
    Document   : Login
    Created on : 03-sep-2020, 19:05:05
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
        <title>Sistema de Stock</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.24.1/feather.min.js" crossorigin="anonymous"></script>
    </head>
    <%
        HttpSession objsesion = request.getSession();
    
        String mensaje = (String)objsesion.getAttribute("divError");
    
    %>
    <body class="bg-primary" style="background:url(img/fondo-login3-grande.jpg) no-repeat center center fixed; background-size: cover;
          -webkit-background-size: cover;
          -moz-background-size: cover;
          -o-background-size: cover;">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <img src="img/logo-duoc.png" height="100%" width="100%">
                                    <div class="card-header justify-content-center"><h3 class="font-weight-light my-4">Login</h3></div>
                                    <div class="justify-content-center" style="text-align: center;" id="divAlert">
                                        <%if(mensaje == null){
                                        session.invalidate();
                                        }else{
                                            out.print(mensaje);
                                            session.invalidate();
                                        }%>
                                    </div>
                                    
                                    <div class="card-body">
                                        <form action="InicioSesion" method="post"  autocomplete="off">
                                            <div class="form-group">
                                                <label class="small mb-1" for="inputEmailAddress">Rut</label>
                                                <input class="form-control py-4" id="txtRut_Usuario" name="txtRut_Usuario" type="text" placeholder="Ingrese Rut" /></div>
                                            <div class="form-group">
                                                <label class="small mb-1" for="inputPassword">Contraseña</label>
                                                <input class="form-control py-4" id="txtPassword_usuario" name="txtPassword_usuario" type="password" placeholder="Ingrese Contraseña" /></div>
                                                <div class="form-group mt-4 mb-0">
                                                    <button class="btn btn-primary btn-block" type="submit">Iniciar Sesión</button>
                                                </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer" style="color: white;">
                <jsp:include page="Footer.jsp"></jsp:include>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
