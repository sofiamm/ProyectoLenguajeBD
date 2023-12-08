package com.yire.controller;

import com.yire.domain.Puesto;
import com.yire.service.PuestoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@Slf4j
public class PuestoController {

    @Autowired
    private PuestoService usuarioService;

    @GetMapping("/usuario/informacion")
    public String mostrarInformacion(Model model) {
        return "/usuario/informacion";
    }

    @GetMapping("/usuario/contacto")
    public String mostrarContacto(Model model) {
        return "/usuario/contacto";
    }

    @GetMapping("/usuario/lista")
    public String mostrarClientes(Model model) {
        var clientes = usuarioService.getPuestos();

        model.addAttribute("clientes", clientes);
        return "/usuario/lista";
    }

    @PostMapping("/cliente/guardar")
    public String guardarUsuario(Puesto usuario) {
//        usuarioService.save(usuario);
        return "redirect:/usuario/lista";
    }
}
