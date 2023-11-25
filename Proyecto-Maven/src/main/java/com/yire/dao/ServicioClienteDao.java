package com.yire.dao;

import com.yire.domain.ServicioCliente;
import org.springframework.data.repository.CrudRepository;

public interface ServicioClienteDao extends CrudRepository<ServicioCliente, Long> {
    
}
