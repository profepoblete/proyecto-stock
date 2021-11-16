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
public class TipoUsuario {
    private int id_tipo_usuario;
    private String categoria_tipo_usuario;

    public TipoUsuario() {
    }

    public TipoUsuario(int id_tipo_usuario, String categoria_tipo_usuario) {
        this.id_tipo_usuario = id_tipo_usuario;
        this.categoria_tipo_usuario = categoria_tipo_usuario;
    }

    public int getId_tipo_usuario() {
        return id_tipo_usuario;
    }

    public void setId_tipo_usuario(int id_tipo_usuario) {
        this.id_tipo_usuario = id_tipo_usuario;
    }

    public String getCategoria_tipo_usuario() {
        return categoria_tipo_usuario;
    }

    public void setCategoria_tipo_usuario(String categoria_tipo_usuario) {
        this.categoria_tipo_usuario = categoria_tipo_usuario;
    }
    
    
}
