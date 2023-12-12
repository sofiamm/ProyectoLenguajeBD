/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.yire.service;

import com.yire.domain.MateriaPrima;
import java.util.List;

public interface MateriaPrimaService {
    List<MateriaPrima> obtenerTodas();
    MateriaPrima obtenerPorId(Long id);
    void guardar(MateriaPrima materiaPrima);
    void actualizar(MateriaPrima materiaPrima);
    void eliminar(Long id);
}
