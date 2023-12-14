/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yire.controller;

import com.yire.domain.MateriaPrima;
import com.yire.service.MateriaPrimaService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@Slf4j
@RequestMapping("/materiaprima")
public class MateriaPrimaController {

    @Autowired
    private MateriaPrimaService materiaPrimaService;

    @GetMapping("/lista")
    public String lista(Model model) {
        model.addAttribute("materiasPrimas", materiaPrimaService.obtenerTodas());
        return "materiaprima/lista";
    }

    @GetMapping("/nuevo")
    public String mostrarFormularioNuevo(Model model) {
        model.addAttribute("materiaPrima", new MateriaPrima());
        return "materiaprima/agregar";
    }

    @PostMapping("/guardar")
    public String guardar(@ModelAttribute MateriaPrima materiaPrima) {
        materiaPrimaService.guardar(materiaPrima);
        return "redirect:/materiaprima/lista";
    }

    @GetMapping("/modificar/{idMateriaPrima}")
    public String mostrarFormularioEditar(MateriaPrima materiaPrima, Model model) {
//        MateriaPrima materiaPrima = materiaPrimaService.obtenerPorId(id);materiaPrima
        materiaPrima=materiaPrimaService.obtenerPorId(materiaPrima.getIdMateriaPrima());
        model.addAttribute("materiaPrima", materiaPrima);
        return "/materiaprima/modificar";
    }

    @PostMapping("/actualizar")
    public String actualizar(@ModelAttribute("materiaPrima") MateriaPrima materiaPrima) {
        materiaPrimaService.actualizar(materiaPrima);
        return "redirect:/materiaprima/lista";
    }

    @GetMapping("/eliminar/{id}")
    public String eliminar(@PathVariable Long id) {
        materiaPrimaService.eliminar(id);
        return "redirect:/materiaprima/lista";
    }
}

