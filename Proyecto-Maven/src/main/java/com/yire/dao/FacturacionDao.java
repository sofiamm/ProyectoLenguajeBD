package com.yire.dao;

import com.yire.domain.Facturacion;
import org.springframework.data.repository.CrudRepository;

public interface FacturacionDao extends CrudRepository<Facturacion, Long> {
    
}
