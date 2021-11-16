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
public class Proveedor {
    private int id_proveedor;
    private String rut_proveedor;
    private String nombre_proveedor;
    private String razon_social_proveedor;
    private String correo_proveedor;
    private String direccion_proveedor;
    private String fono_proveedor;
    //private String estado_proveedor; comentando todo lo relacionado con "estado_proveedor"
    private int id_comuna;

    public Proveedor() {
    }

    public Proveedor(int id_proveedor, String rut_proveedor, String nombre_proveedor, String razon_social_proveedor, String correo_proveedor, String direccion_proveedor, String fono_proveedor, /*String estado_proveedor,*/ int id_comuna) {
        this.id_proveedor = id_proveedor;
        this.rut_proveedor = rut_proveedor;
        this.nombre_proveedor = nombre_proveedor;
        this.razon_social_proveedor = razon_social_proveedor;
        this.correo_proveedor = correo_proveedor;
        this.direccion_proveedor = direccion_proveedor;
        this.fono_proveedor = fono_proveedor;
        //this.estado_proveedor = estado_proveedor;
        this.id_comuna = id_comuna;
    }

    public int getId_proveedor() {
        return id_proveedor;
    }

    public void setId_proveedor(int id_proveedor) {
        this.id_proveedor = id_proveedor;
    }

    public String getRut_proveedor() {
        return rut_proveedor;
    }

    public void setRut_proveedor(String rut_proveedor) {
        this.rut_proveedor = rut_proveedor;
    }

    public String getNombre_proveedor() {
        return nombre_proveedor;
    }

    public void setNombre_proveedor(String nombre_proveedor) {
        this.nombre_proveedor = nombre_proveedor;
    }

    public String getRazon_social_proveedor() {
        return razon_social_proveedor;
    }

    public void setRazon_social_proveedor(String razon_social_proveedor) {
        this.razon_social_proveedor = razon_social_proveedor;
    }

    public String getCorreo_proveedor() {
        return correo_proveedor;
    }

    public void setCorreo_proveedor(String correo_proveedor) {
        this.correo_proveedor = correo_proveedor;
    }

    public String getDireccion_proveedor() {
        return direccion_proveedor;
    }

    public void setDireccion_proveedor(String direccion_proveedor) {
        this.direccion_proveedor = direccion_proveedor;
    }

    public String getFono_proveedor() {
        return fono_proveedor;
    }

    public void setFono_proveedor(String fono_proveedor) {
        this.fono_proveedor = fono_proveedor;
    }

    /*public String getEstado_proveedor() {
        return estado_proveedor;
    }

    public void setEstado_proveedor(String estado_proveedor) {
        this.estado_proveedor = estado_proveedor;
    }*/

    public int getId_comuna() {
        return id_comuna;
    }

    public void setId_comuna(int id_comuna) {
        this.id_comuna = id_comuna;
    }
}
