/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import Modelos.Area;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author José Pablo
 */
public interface CRUDArea {
    public boolean agregarArea(Area objArea);
    public boolean editarArea(Area objArea);
    public Area eliminarArea(Area objArea);
    public ArrayList<Area> listaArea();
    public List buscar (String texto);
}
