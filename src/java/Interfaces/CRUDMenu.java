/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import Modelos.Menu;
import java.util.ArrayList;

/**
 *
 * @author Diego
 */
public interface CRUDMenu {
    public boolean agregarMenu(Menu objMenu);
    public boolean editarMenu(Menu objMenu);
    public Menu eliminarMenu(Menu objMenu);
    public ArrayList<Menu> listarMenu();
}
