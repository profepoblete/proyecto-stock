/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

/**
 *
 * @author Diego
 */
public class TipoMenu {
    private int id_tipo_menu;
    private int id_menu;
    private int id_tipo_usuario;

    public TipoMenu() {
    }

    public TipoMenu(int id_tipo_menu, int id_menu, int id_tipo_usuario) {
        this.id_tipo_menu = id_tipo_menu;
        this.id_menu = id_menu;
        this.id_tipo_usuario = id_tipo_usuario;
    }

    public int getId_tipo_menu() {
        return id_tipo_menu;
    }

    public void setId_tipo_menu(int id_tipo_menu) {
        this.id_tipo_menu = id_tipo_menu;
    }

    public int getId_menu() {
        return id_menu;
    }

    public void setId_menu(int id_menu) {
        this.id_menu = id_menu;
    }

    public int getId_tipo_usuario() {
        return id_tipo_usuario;
    }

    public void setId_tipo_usuario(int id_tipo_usuario) {
        this.id_tipo_usuario = id_tipo_usuario;
    }

    
    
    
}
