package com.yire.dao;

import com.yire.domain.Menu;
import org.springframework.data.repository.CrudRepository;

public interface MenuDao extends CrudRepository<Menu, Long> {
    
}
