/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import Modelos.Proveedor;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author José Pablo
 */
public interface CRUDProveedor {
    public boolean agregarProveedor(Proveedor objProveedor);
    public boolean editarProveedor(Proveedor objProveedor);
    public Proveedor eliminarProveedor(Proveedor objProveedor);
    public ArrayList<Proveedor> listarProveedor();
    public List buscar(String texto);
}
