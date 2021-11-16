/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

/**
 *
 * @author Tapir
 */
public class DetalleInventario {

    private int id_detalle_inventario;
    private int cantidad_producto_inventario;
    private int id_ubicacion;
    private int id_inventario;
    private int id_producto_E;
    private int guia_despacho;
    private int n_compra;

    public DetalleInventario() {
    }

    public DetalleInventario(int id_detalle_inventario, int cantidad_producto_inventario, int id_ubicacion, int id_inventario, int id_producto_E, int guia_despacho, int n_compra) {
        this.id_detalle_inventario = id_detalle_inventario;
        this.cantidad_producto_inventario = cantidad_producto_inventario;
        this.id_ubicacion = id_ubicacion;
        this.id_inventario = id_inventario;
        this.id_producto_E = id_producto_E;
        this.guia_despacho = guia_despacho;
        this.n_compra = n_compra;
    }

    public int getGuia_despacho() {
        return guia_despacho;
    }

    public void setGuia_despacho(int guia_despacho) {
        this.guia_despacho = guia_despacho;
    }

    public int getN_compra() {
        return n_compra;
    }

    public void setN_compra(int n_compra) {
        this.n_compra = n_compra;
    }

    public int getId_detalle_inventario() {
        return id_detalle_inventario;
    }

    public void setId_detalle_inventario(int id_detalle_inventario) {
        this.id_detalle_inventario = id_detalle_inventario;
    }

    public int getCantidad_producto_inventario() {
        return cantidad_producto_inventario;
    }

    public void setCantidad_producto_inventario(int cantidad_producto_inventario) {
        this.cantidad_producto_inventario = cantidad_producto_inventario;
    }

    public int getId_ubicacion() {
        return id_ubicacion;
    }

    public void setId_ubicacion(int id_ubicacion) {
        this.id_ubicacion = id_ubicacion;
    }

    public int getId_inventario() {
        return id_inventario;
    }

    public void setId_inventario(int id_inventario) {
        this.id_inventario = id_inventario;
    }

    public int getId_producto_E() {
        return id_producto_E;
    }

    public void setId_producto_E(int id_producto_E) {
        this.id_producto_E = id_producto_E;
    }

}
