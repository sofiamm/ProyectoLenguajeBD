package com.yire.service;

import com.yire.dao.EmpleadoPuestoDao;
import com.yire.domain.EmpleadoPuesto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmpleadoPuestoServiceImpl implements EmpleadoPuestoService{
    
    @Autowired
    private EmpleadoPuestoDao empleadoPuestoDao;
    
    @Override
    public EmpleadoPuesto getPuestoByIdEmpleado(long idEmpleado){
        EmpleadoPuesto ep=empleadoPuestoDao.findByIdEmpleado(idEmpleado);
        return ep;
    }
    
}
