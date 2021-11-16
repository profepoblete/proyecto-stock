/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import Modelos.Producto;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Felipe
 */
public interface CRUDProducto {
    public boolean agregarProducto(Producto objProducto);
    public boolean editarProducto(Producto objProducto);
    public Producto eliminarProducto(Producto objProducto);
    public ArrayList<Producto> listarProducto();
    public List buscar(String texto);
}
