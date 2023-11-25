package com.yire.dao;

import com.yire.domain.Empleado;
import org.springframework.data.repository.CrudRepository;

public interface EmpleadoDao extends CrudRepository<Empleado, Long>  {
    
}
