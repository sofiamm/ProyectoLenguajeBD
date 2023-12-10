/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yire.service;

import com.yire.dao.ProvinciaDao;
import com.yire.domain.Provincia;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProvinciaServiceImpl implements ProvinciaService {

    @Autowired
    ProvinciaDao provinciaDao;


    @Override
    @Transactional(readOnly = true)
    public List<Provincia> getProvincias() {
        var lista=(List <Provincia>)provinciaDao.findAll();
        List<Provincia> listaFinal=new ArrayList<>();
        for (Provincia provincia : lista){
            if(provincia instanceof Provincia){
                listaFinal.add(provincia);
            }
        }
        return listaFinal;
    }
}
