/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import Modelos.Bodega;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author José Pablo
 */
public interface CRUDBodega {
    public boolean agregarbodega(Bodega objBodega);
    public boolean  editarBodega(Bodega objBodega);
    public Bodega eliminarBodega(Bodega objBodega);
    public ArrayList<Bodega> listaBodega();
    public List buscar (String texto);
}
