package com.yire.dao;

import com.yire.domain.Contacto;
import org.springframework.data.repository.CrudRepository;

public interface ContactoDao extends CrudRepository<Contacto, Long> {
    
}
