package com.yire.controller;

import com.yire.Json;
import com.yire.domain.Canton;
import com.yire.service.CantonService;
import com.yire.service.ProvinciaService;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
@Slf4j
public class CantonController {
    
    @Autowired
    private CantonService cantonService;
    
    @Autowired
    private ProvinciaService provinciaService;

    @GetMapping("/canton/lista")
    public String mostrarCantones(Model model) {
        List<List<Canton>> cantones = cantonService.getCantones2();
        var provincias= provinciaService.getProvincias();
        String cantonessan=Json.Json(cantones.get(0));

        model.addAttribute("cantonessan", cantonessan);
        model.addAttribute("cantonesala", cantones.get(1));
        model.addAttribute("cantonescar", cantones.get(2));
        model.addAttribute("cantonesher", cantones.get(3));
        model.addAttribute("cantonesgua", cantones.get(4));
        model.addAttribute("cantonespun", cantones.get(5));
        model.addAttribute("cantoneslim", cantones.get(6));
        model.addAttribute("provincias", provincias);
        return "/canton/lista";
    }
}
