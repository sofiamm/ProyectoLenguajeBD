/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yire.service;

import com.yire.domain.Producto;

import java.util.List;

public interface ProductoService {
    List<Producto> obtenerTodos();

    Producto obtenerPorId(Long id);

    void guardar(Producto producto);

    void actualizar(Producto producto);

    void eliminar(Long id);
}
