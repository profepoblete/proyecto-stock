    /*
     * To change this license header, choose License Headers in Project Properties.
     * To change this template file, choose Tools | Templates
     * and open the template in the editor.
     */
    package DAO;

    import Conexion.ConexionDB;
    import Interfaces.CRUDSede;
    import Modelos.Area;
    import Modelos.Menu;
    import Modelos.Sede;
    import java.sql.PreparedStatement;
    import java.sql.ResultSet;
    import java.sql.SQLException;
    import java.util.ArrayList;
    import java.util.List;
    import java.util.logging.Level;
    import java.util.logging.Logger;

    /**
     *
     * @author José Pablo
     */
    public class SedeDAO  implements CRUDSede{

        private static String sql_selectAll = "select * from sede";
        private static String sql_selectSede = "select * from sede where id_sede = ?";
        private static String sql_insert = "insert into sede (id_sede, nombre_sede, direccion_sede) values (?,?,?)";
        private static String sql_delete = "delete from sede where id_sede = ?";
        private static String sql_update = "update sede set nombre_sede = ?, direccion_sede = ? where id_sede = ?";

        private static ConexionDB objConn = ConexionDB.InstanciaConn();
        private ResultSet rs;  

        @Override
        public boolean aregarSede(Sede objSede) {
            PreparedStatement psI;
            try {
                psI = objConn.getConn().prepareStatement(sql_insert);
                psI.setString(1, objSede.getCodigo_sede());
                psI.setString(2, objSede.getNombre_sede());
                psI.setString(3, objSede.getDireccion_sede());

                if (psI.executeUpdate()>0) {
                    return true;
                }
            } catch (SQLException ex) {
                Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            return false;
        }

        @Override
        public boolean editarSede(Sede objSede) {
             PreparedStatement psU;
            try {
                psU = objConn.getConn().prepareStatement(sql_update);            
                psU.setString(1, objSede.getNombre_sede());
                psU.setString(2, objSede.getDireccion_sede());
                psU.setString(3, objSede.getCodigo_sede());

                if (psU.executeUpdate()>0) {
                    return true;
                }
            } catch (SQLException ex) {
                Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
                return false;
        }

        @Override
        public Sede eliminarSede(Sede objSede) {
              PreparedStatement psD;
            try {
                psD = objConn.getConn().prepareStatement(sql_delete);
                psD.setString(1, objSede.getCodigo_sede());

                if (psD.executeUpdate()>0) {
                    return null;
                }
            } catch (SQLException ex) {
                Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
             return objSede;
        }

        @Override
        public ArrayList<Sede> listSede() {
             ArrayList<Sede> lstSede = new ArrayList<>();
            PreparedStatement psL;
            try {
                psL = objConn.getConn().prepareStatement(sql_selectAll);
                rs = psL.executeQuery();
                while (rs.next()) {                
                    Sede objSede = new Sede();

                    objSede.setCodigo_sede(rs.getString("id_sede"));
                    objSede.setNombre_sede(rs.getString("nombre_sede"));
                    objSede.setDireccion_sede(rs.getString("direccion_sede"));
                    lstSede.add(objSede);
                }
            } catch (SQLException ex) {
                Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
           return lstSede;
        }

        @Override
        public List buscar(String texto) {
               List<Sede>  lista = new ArrayList<>();
                   int texto2 = 0;
            if(texto.equalsIgnoreCase("Administrador")){
                texto2 = 1;
            }else if(texto.equalsIgnoreCase("Operador")){
                texto2 = 2;
            }

            String sql_search = "select * from sede where codigo_sede like '%"+texto+"%' or nombre_sede like '%"+texto+"%' or direccion_sede like '%"+texto+"%'";

            PreparedStatement psB;
            try {
                psB = objConn.getConn().prepareStatement(sql_search);
                rs = psB.executeQuery();
            while (rs.next()) {            
                Sede a = new Sede();
                a.setCodigo_sede(rs.getString("id_sede"));
                a.setNombre_sede(rs.getString("nombre_sede"));
                a.setDireccion_sede(rs.getString("direccion_sede"));
                lista.add(a);
            }
            } catch (SQLException ex) {
                Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            return lista;
        }

        public Sede buscarPorIdi(Sede objSede){
        Sede s = new Sede();
        PreparedStatement psG;
            try {
                psG = objConn.getConn().prepareStatement(sql_selectSede);
                psG.setString(1, objSede.getCodigo_sede());
                rs = psG.executeQuery();

                while (rs.next()) {                
                    s.setCodigo_sede(rs.getString("id_sede"));
                    s.setNombre_sede(rs.getString("nombre_sede"));
                    s.setDireccion_sede(rs.getString("direccion_sede"));
                }
                return s;
            } catch (SQLException ex) {
                Logger.getLogger(AreaDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        return null;
        }

        public ArrayList<Menu> CargarMenuPorRol(int perfil){
            ArrayList<Menu> lstMenu = new ArrayList<>();
            String query = "SELECT M.ID_MENU, M.NOMBRE_MENU, M.URL_MENU, M.ID_MENU_PADRE FROM MENU M "
                    + "JOIN TIPO_MENU TM ON (M.ID_MENU = TM.ID_MENU)"
                    + "JOIN TIPO_USUARIO TU ON (TM.ID_TIPO_USUARIO = TU.ID_TIPO_USUARIO)"
                    + "WHERE TM.ID_TIPO_USUARIO = " + perfil;
            try {
                PreparedStatement psM;
                psM = objConn.getConn().prepareStatement(query);
                rs = psM.executeQuery();
                while(rs.next()){
                    Menu m = new Menu();
                    m.setId_menu(rs.getInt("M.ID_MENU"));
                    m.setNombre_menu(rs.getString("M.NOMBRE_MENU"));
                    m.setUrl_menu(rs.getString("M.URL_MENU"));
                    m.setId_menu_padre(rs.getInt("M.ID_MENU_PADRE"));
                    lstMenu.add(m);
                }
            } catch (Exception e) {
            }
            return lstMenu;
        }

    }
