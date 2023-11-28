package com.yire.dao;

import com.yire.domain.Empleado;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EmpleadoDao extends CrudRepository<Empleado, Long>  {
    Empleado findByAlias(String alias);
}
