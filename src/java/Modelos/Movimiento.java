/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.util.Date;

/**
 *
 * @author Tapir
 */
public class Movimiento {
    
   private int id_movimiento;
   private Date fecha_movimiento;
   private int id_ubicacion_original;
   private int id_ubicacion_nuevo;
   private int id_producto_e;

    public Movimiento() {
    }

    public Movimiento(int id_movimiento, Date fecha_movimiento, int id_ubicacion_original, int id_ubicacion_nuevo, int id_producto_e) {
        this.id_movimiento = id_movimiento;
        this.fecha_movimiento = fecha_movimiento;
        this.id_ubicacion_original = id_ubicacion_original;
        this.id_ubicacion_nuevo = id_ubicacion_nuevo;
        this.id_producto_e = id_producto_e;
    }

    public int getId_movimiento() {
        return id_movimiento;
    }

    public void setId_movimiento(int id_movimiento) {
        this.id_movimiento = id_movimiento;
    }

    public Date getFecha_movimiento() {
        return fecha_movimiento;
    }

    public void setFecha_movimiento(Date fecha_movimiento) {
        this.fecha_movimiento = fecha_movimiento;
    }

    public int getId_ubicacion_original() {
        return id_ubicacion_original;
    }

    public void setId_ubicacion_original(int id_ubicacion_original) {
        this.id_ubicacion_original = id_ubicacion_original;
    }

    public int getId_ubicacion_nuevo() {
        return id_ubicacion_nuevo;
    }

    public void setId_ubicacion_nuevo(int id_ubicacion_nuevo) {
        this.id_ubicacion_nuevo = id_ubicacion_nuevo;
    }

    public int getId_producto_e() {
        return id_producto_e;
    }

    public void setId_producto_e(int id_producto_e) {
        this.id_producto_e = id_producto_e;
    }
   
   
   
   
   
}
