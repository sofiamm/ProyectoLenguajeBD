/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.yire.service;

import com.yire.domain.Provincia;
import java.util.List;

/**
 *
 * @author antho
 */
public interface ProvinciaService {
    public List<Provincia> getProvincias();
    public Provincia getProvincia(Provincia provincia);
}
