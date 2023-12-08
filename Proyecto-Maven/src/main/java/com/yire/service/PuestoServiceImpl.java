package com.yire.service;

import com.yire.dao.PuestoDao;
import com.yire.domain.Puesto;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PuestoServiceImpl implements PuestoService{
    @Autowired
    private PuestoDao puestoDao;
    
    @Override
    @Transactional(readOnly = true)
    public List<Puesto> getPuestos(){
        var lista=(List <Puesto>)puestoDao.findAll();
        List<Puesto> listaFinal=new ArrayList<>();
        for (Puesto puesto : lista){
            if(puesto instanceof Puesto){
                listaFinal.add(puesto);
            }
        }
        return listaFinal;
    }
    
    @Override
    public void save(Puesto puesto){
        puestoDao.save(puesto);
    }
}
