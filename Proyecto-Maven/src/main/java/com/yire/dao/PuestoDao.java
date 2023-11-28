package com.yire.dao;

import com.yire.domain.Puesto;
import org.springframework.data.repository.CrudRepository;

public interface PuestoDao extends CrudRepository<Puesto, Long>{
    Puesto findByIdPuesto(Long idPuesto);
}
