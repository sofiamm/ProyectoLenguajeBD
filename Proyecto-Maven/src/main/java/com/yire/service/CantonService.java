/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.yire.service;

import com.yire.domain.Canton;
import com.yire.domain.Provincia;
import java.util.List;

/**
 *
 * @author antho
 */
public interface CantonService {
    public List<Canton> getCantones();
    public Canton getCanton(Canton canton,long id_provincia) ;
    public List<Canton> getCantonesByProvincia(Provincia provincia);
}
