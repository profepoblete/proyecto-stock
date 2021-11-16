/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

/**
 *
 * @author Felipe
 */
public class Usuario {
    private int id_usuario;
    private String rut_usuario;
    private String nombre_usuario;
    private String password_usuario;
    private String ape_paterno_usuario;
    private String ape_materno_usuario;
    private String celular_usuario;
    private String correo_usuario;
    private String direccion_usuario;
    private int id_tipo_usuario;
    private int id_area;

    public Usuario() {
    }

    public Usuario(int id_usuario, String rut_usuario, String nombre_usuario, String password_usuario, String ape_paterno_usuario, String ape_materno_usuario, String celular_usuario, String correo_usuario, String direccion_usuario, int id_tipo_usuario, int id_area) {
        this.id_usuario = id_usuario;
        this.rut_usuario = rut_usuario;
        this.nombre_usuario = nombre_usuario;
        this.password_usuario = password_usuario;
        this.ape_paterno_usuario = ape_paterno_usuario;
        this.ape_materno_usuario = ape_materno_usuario;
        this.celular_usuario = celular_usuario;
        this.correo_usuario = correo_usuario;
        this.direccion_usuario = direccion_usuario;
        this.id_tipo_usuario = id_tipo_usuario;
        this.id_area = id_area;
    }
    
    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }
    
    public String getRut_usuario() {
        return rut_usuario;
    }

    public void setRut_usuario(String rut_usuario) {
        this.rut_usuario = rut_usuario;
    }

    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
    }

    public String getPassword_usuario() {
        return password_usuario;
    }

    public void setPassword_usuario(String password_usuario) {
        this.password_usuario = password_usuario;
    }

    public String getApe_paterno_usuario() {
        return ape_paterno_usuario;
    }

    public void setApe_paterno_usuario(String ape_paterno_usuario) {
        this.ape_paterno_usuario = ape_paterno_usuario;
    }

    public String getApe_materno_usuario() {
        return ape_materno_usuario;
    }

    public void setApe_materno_usuario(String ape_materno_usuario) {
        this.ape_materno_usuario = ape_materno_usuario;
    }

    public String getCelular_usuario() {
        return celular_usuario;
    }

    public void setCelular_usuario(String celular_usuario) {
        this.celular_usuario = celular_usuario;
    }

    public String getCorreo_usuario() {
        return correo_usuario;
    }

    public void setCorreo_usuario(String correo_usuario) {
        this.correo_usuario = correo_usuario;
    }

    public String getDireccion_usuario() {
        return direccion_usuario;
    }

    public void setDireccion_usuario(String direccion_usuario) {
        this.direccion_usuario = direccion_usuario;
    }

    public int getId_tipo_usuario() {
        return id_tipo_usuario;
    }

    public void setId_tipo_usuario(int id_tipo_usuario) {
        this.id_tipo_usuario = id_tipo_usuario;
    }

    public int getId_area() {
        return id_area;
    }

    public void setId_area(int id_area) {
        this.id_area = id_area;
    }


}
