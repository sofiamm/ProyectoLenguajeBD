/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yire.service;

import com.yire.dao.ProductoDao;
import com.yire.domain.Producto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductoServiceImpl implements ProductoService {

    @Autowired
    private ProductoDao productoDao;

    @Override
    public List<Producto> obtenerTodos() {
        return (List<Producto>) productoDao.findAll();
    }

    @Override
    public Producto obtenerPorId(Long id) {
        return productoDao.findById(id).orElse(null);
    }

    @Override
    public void guardar(Producto producto) {
        productoDao.save(producto);
    }

    @Override
    public void actualizar(Producto producto) {
        productoDao.save(producto);
    }

    @Override
    public void eliminar(Long id) {
        productoDao.deleteById(id);
    }
}
