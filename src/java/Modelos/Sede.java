/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

/**
 *
 * @author José Pablo
 */
public class Sede {
    private String codigo_sede;
    private String nombre_sede;
    private String direccion_sede;

    public Sede() {
    }

    public Sede(String codigo_sede, String nombre_sede, String direccion_sede) {
        this.codigo_sede = codigo_sede;
        this.nombre_sede = nombre_sede;
        this.direccion_sede = direccion_sede;
    }

    public String getCodigo_sede() {
        return codigo_sede;
    }

    public void setCodigo_sede(String codigo_sede) {
        this.codigo_sede = codigo_sede;
    }

    public String getNombre_sede() {
        return nombre_sede;
    }

    public void setNombre_sede(String nombre_sede) {
        this.nombre_sede = nombre_sede;
    }

    public String getDireccion_sede() {
        return direccion_sede;
    }

    public void setDireccion_sede(String direccion_sede) {
        this.direccion_sede = direccion_sede;
    }
    
    
}
