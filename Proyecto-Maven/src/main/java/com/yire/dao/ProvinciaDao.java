package com.yire.dao;

import com.yire.domain.Provincia;
import org.springframework.data.repository.CrudRepository;

public interface ProvinciaDao extends CrudRepository<Provincia, Long> {
    public Provincia findByNombre(Provincia nombre);
}
