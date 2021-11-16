/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import Modelos.CentroCosto;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author José Pablo
 */
public interface CRUDCentroCosto {
    public boolean agregarCentroCosto(CentroCosto objCentroCosto);
    public boolean editarCentroCosto(CentroCosto objCentroCosto);
    public CentroCosto eliminarCentroCosto(CentroCosto objCentroCosto);
    public ArrayList<CentroCosto> listaCentroCosto();
    public List buscar (String texto);
    public boolean insercionMasiva(String path);
}
