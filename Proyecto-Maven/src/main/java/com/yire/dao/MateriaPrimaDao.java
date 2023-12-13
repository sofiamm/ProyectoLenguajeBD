package com.yire.dao;

import com.yire.domain.MateriaPrima;
import org.springframework.data.repository.CrudRepository;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MateriaPrimaDao extends JpaRepository<MateriaPrima, Long> {
}
