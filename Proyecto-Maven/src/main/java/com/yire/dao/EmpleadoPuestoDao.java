package com.yire.dao;

import com.yire.domain.EmpleadoPuesto;
import com.yire.domain.EmpleadoPuestoPK;
import org.springframework.data.repository.CrudRepository;

public interface EmpleadoPuestoDao extends CrudRepository<EmpleadoPuesto, EmpleadoPuestoPK> {
    EmpleadoPuesto findByIdEmpleado(Long idEmpleado);
}
