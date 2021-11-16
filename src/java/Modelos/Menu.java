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
public class Menu {
    private int id_menu;
    private String nombre_menu;
    private String url_menu;
    private int id_menu_padre;

    public Menu() {
    }

    public Menu(int id_menu, String nombre_menu, String url_menu, int id_menu_padre) {
        this.id_menu = id_menu;
        this.nombre_menu = nombre_menu;
        this.url_menu = url_menu;
        this.id_menu_padre = id_menu_padre;
    }

    public int getId_menu() {
        return id_menu;
    }

    public void setId_menu(int id_menu) {
        this.id_menu = id_menu;
    }

    public String getNombre_menu() {
        return nombre_menu;
    }

    public void setNombre_menu(String nombre_menu) {
        this.nombre_menu = nombre_menu;
    }

    public String getUrl_menu() {
        return url_menu;
    }

    public void setUrl_menu(String url_menu) {
        this.url_menu = url_menu;
    }

    public int getId_menu_padre() {
        return id_menu_padre;
    }

    public void setId_menu_padre(int id_menu_padre) {
        this.id_menu_padre = id_menu_padre;
    }
    
    
    
    
}
