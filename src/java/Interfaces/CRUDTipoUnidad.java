/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import Modelos.TipoUnidad;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Felipe
 */
public interface CRUDTipoUnidad {
    public boolean agregarTipoUnidad(TipoUnidad objTipoUnidad);
    public boolean editarTipoUnidad(TipoUnidad objTipoUnidad);
    public TipoUnidad eliminarTipoUnidad(TipoUnidad objTipoUnidad);
    public ArrayList<TipoUnidad> listarTipoUnidad();
    public List buscar(String texto);
    
}
