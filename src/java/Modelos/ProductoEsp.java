/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Modelos;

import java.sql.Date;


/**
 *
 * @author Sebastián Barría
 */
public class ProductoEsp {
    private int id_producto_E;
    private int id_producto;
    private String serial_producto;
    private Date fecha_creacion;
    private Date fecha_depreciacion;

    public Date getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(Date fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }
    
    

    public ProductoEsp(int id_producto_E, int id_producto, String serial_producto, Date fecha_creacion, Date fecha_depreciacion) {
        this.id_producto_E = id_producto_E;
        this.id_producto = id_producto;
        this.serial_producto = serial_producto;
        this.fecha_creacion = fecha_creacion;
        this.fecha_depreciacion = fecha_depreciacion;
    }

    public ProductoEsp() {
    }

    public int getId_producto_E() {
        return id_producto_E;
    }

    public void setId_producto_E(int id_producto_E) {
        this.id_producto_E = id_producto_E;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public String getSerial_producto() {
        return serial_producto;
    }

    public void setSerial_producto(String serial_producto) {
        this.serial_producto = serial_producto;
    }

    public Date getFecha_depreciacion() {
        return fecha_depreciacion;
    }

    public void setFecha_depreciacion(Date fecha_depreciacion) {
        this.fecha_depreciacion = fecha_depreciacion;
    }
    
}