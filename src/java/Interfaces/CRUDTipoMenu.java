/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import Modelos.TipoMenu;
import java.util.ArrayList;

/**
 *
 * @author Diego
 */
public interface CRUDTipoMenu {
    public boolean agregarTipoMenu(TipoMenu objTipoMenu);
    public boolean editarTipoMenu(TipoMenu objTipoMenu);
    public TipoMenu eliminarTipoMenu(TipoMenu objTipoMenu);
    public ArrayList<TipoMenu> listarTipoMenu();
}
