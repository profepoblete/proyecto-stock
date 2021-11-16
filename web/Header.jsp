<%
    HttpSession objsesion = request.getSession();
    
    String rut_usuario = (String)objsesion.getAttribute("rut_usuario");
    String correo_usuario = (String)objsesion.getAttribute("correo_usuario");
    String rol = (String)objsesion.getAttribute("rol");
    
    if(rut_usuario.equalsIgnoreCase("")){
        response.sendRedirect("IniciarSesion.jsp");
    }
    
%>

<nav class="topnav navbar navbar-expand shadow navbar-light bg-white" id="sidenavAccordion">
    
    <a class="navbar-brand d-none d-sm-block" href="Index.jsp" >Sistema Stock Duoc UC</a><button class="btn btn-icon btn-transparent-dark order-1 order-lg-0 mr-lg-2" id="sidebarToggle" href="#"><i data-feather="menu"></i></button>
            
            <ul class="navbar-nav align-items-center ml-auto">
                <li class="nav-item dropdown no-caret mr-3 dropdown-user">
                    <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownUserImage" href="javascript:void(0);" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img class="img-fluid" src="img/login5.png"/></a>
                    <div class="dropdown-menu dropdown-menu-right border-0 shadow animated--fade-in-up" aria-labelledby="navbarDropdownUserImage">
                        <h6 class="dropdown-header d-flex align-items-center">
                            <div class="dropdown-user-details">
                                <div class="dropdown-user-details-name"><% out.println(rut_usuario); %></div>
                                <div class="dropdown-user-details-email"><% out.println(rol); %></div>
                            </div>
                        </h6>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="ModPerfil?rut_usuario=<%=rut_usuario%>"
                            ><div class="dropdown-item-icon"><i data-feather="settings"></i></div>
                            Ajustes</a
                        ><a class="dropdown-item" href="CerrarSesion.jsp?cerrar=true"
                            ><div class="dropdown-item-icon" ><i data-feather="log-out"></i></div>
                            Cerrar Sesion</a
                        >
                    </div>
                </li>
            </ul>
        </nav>