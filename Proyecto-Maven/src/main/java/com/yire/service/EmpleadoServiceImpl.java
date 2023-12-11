/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yire.service;

import com.yire.dao.EmpleadoDao;
import com.yire.domain.Empleado;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author antho
 */
@Service
public class EmpleadoServiceImpl implements EmpleadoService{

    @Autowired
    EmpleadoDao empleadoDao;
    
    @Override
    @Transactional(readOnly = true)
    public List<Empleado> getEmpleados(){
        var lista=(List <Empleado>)empleadoDao.findAll();
        List<Empleado> listaFinal=new ArrayList<>();
        for (Empleado empleado : lista){
            if(empleado instanceof Empleado){
                listaFinal.add(empleado);
            }
        }
        return listaFinal;
    }
    
    @Override
    public void save(Empleado empleado){
        empleadoDao.save(empleado);
    }
    
    @Override
    public Empleado getEmpleado(Empleado empleado){
        return empleadoDao.findById(empleado.getIdEmpleado()).orElse(null);
    }
    
    @Override
    public void delete(Empleado empleado){
        empleadoDao.delete(empleado);
    }
}
