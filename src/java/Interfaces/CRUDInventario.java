/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;
import Modelos.Inventario;
import java.util.ArrayList;
import java.util.List;



/**
 *
 * @author Tapir
 */
public interface CRUDInventario {
    public boolean agregarInventario(Inventario objInventario);
    public boolean  editarInventario(Inventario objInventario);
    public Inventario eliminarInventario(Inventario objInventario);
    public ArrayList<Inventario> listaInventario();
    public List buscar (String texto);
}
