/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yire.service;

import com.yire.dao.MateriaPrimaDao;
import com.yire.domain.MateriaPrima;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MateriaPrimaServiceImpl implements MateriaPrimaService {

    @Autowired
    private MateriaPrimaDao materiaPrimaDao;

    @Override
    public List<MateriaPrima> obtenerTodas() {
        return materiaPrimaDao.findAll();
    }

    @Override
    public MateriaPrima obtenerPorId(Long id) {
        return materiaPrimaDao.findById(id).orElse(null);
    }

    @Override
    public void guardar(MateriaPrima materiaPrima) {
        materiaPrimaDao.save(materiaPrima);
    }

    @Override
    public void actualizar(MateriaPrima materiaPrima) {
        materiaPrimaDao.save(materiaPrima);
    }

    @Override
    public void eliminar(Long id) {
        materiaPrimaDao.deleteById(id);
    }
}
