<%@page import="java.util.Iterator"%>
<%@page import="Modelos.Menu"%>
<%@page import="java.util.ArrayList"%>
<%
    HttpSession objsesion = request.getSession();
    
    String rol = (String)objsesion.getAttribute("rol");
    String nombre = (String)objsesion.getAttribute("nombre");
    String apellido_paterno = (String)objsesion.getAttribute("ape_paterno");
    ArrayList<Menu> lstMenu = (ArrayList<Menu>)objsesion.getAttribute("listaMenu");
    ArrayList<Menu> lstMenuIdPadre = (ArrayList<Menu>)objsesion.getAttribute("listaMenuIdPadre");
    Iterator<Menu> iter = lstMenu.iterator();
    Iterator<Menu> iter2 = lstMenuIdPadre.iterator();
    Menu m = null;
    Menu m2 = null;
    
%>

<nav class="sidenav shadow-right sidenav-dark">   
    <div class="sidenav-menu">
        <div class="nav accordion" id="accordionSidenav">
            <div style="color: white;" class="sidenav-menu-heading">Lista</div>
            <% while (iter.hasNext()) {
                    m = iter.next();

            %>
            <% if (m.getId_menu_padre() == 0) {
            %>
            <a class="nav-link collapsed" href="javascript:void(0);" data-toggle="collapse"   data-target=".collapse<%=m.getId_menu()%>" aria-expanded="false" aria-controls="collapse<%=m.getId_menu()%>">
                <div class="nav-link-icon">
                    <i data-icon="j" ></i>
                </div>
                <%=m.getNombre_menu()%>
                <div class="sidenav-collapse-arrow">
                    <i class="fas fa-angle-down"></i>
                </div>
            </a>
            <%}
                for (Menu menu : lstMenuIdPadre) {
                    if(m.getId_menu() == menu.getId_menu_padre()){
                    %>
                        <div class="collapse collapse<%=menu.getId_menu_padre()%>"  data-parent="#accordionSidenav">
                            <nav class="sidenav-menu-nested nav accordion" id="accordionSidenav" >
                                <a class="nav-link" href="<%=menu.getUrl_menu()%>"><i data-icon="e"></i>&nbsp;<%=menu.getNombre_menu()%></a>
                            </nav>
                        </div>
                    <%}
            
                }%>
            <%}%>
        </div>
    </div>
    <div class="sidenav-footer" style="color: white;">
        <div class="sidenav-footer-content">
            <div class="sidenav-footer-subtitle">Conectado como:</div>
            <div class="sidenav-footer-title"><% out.println(nombre + " " + apellido_paterno);%></div>
        </div>
    </div>
</nav>
        
        
