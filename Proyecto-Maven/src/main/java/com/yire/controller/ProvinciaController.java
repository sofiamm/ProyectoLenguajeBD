package com.yire.controller;

import com.yire.domain.Provincia;
import com.yire.service.ProvinciaService;
import java.util.Set;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@Slf4j
public class ProvinciaController {
    
    @Autowired
    private ProvinciaService provinciaService;

    @GetMapping("/provincia/lista")
    public String mostrarProvincias(Model model) {
        var provincias = provinciaService.getProvincias();

        model.addAttribute("provincias", provincias);
        return "/provincia/lista";
    }
}
