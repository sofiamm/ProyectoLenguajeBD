package com.yire.controller;

import com.yire.Json;
import com.yire.domain.Canton;
import com.yire.domain.Distrito;
import com.yire.domain.Provincia;
import com.yire.service.CantonService;
import com.yire.service.DistritoService;
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
    
    @Autowired
    private DistritoService distritoService;
    
    
    //Logica de canton/lista
    //Primera carga=============================================================
    //JSON Provincias
    //JSON Cantones
    //JSON Distritos
    //
    //Provincia seleccionada Null
    //Cantones por provincia Null
    //Cantones seleccionada Null
    //Distritos por canton Null
    //Distritos seleccionada Null
    //
    //Segunda Carga=============================================================
    //JSON Provincias
    //JSON Cantones
    //JSON Distritos
    //
    //Provincia seleccionada <>
    //Cantones por provincia <>
    //Cantones seleccionada Null
    //Distritos por canton Null
    //Distritos seleccionada Null
    //
    //Tercera Carga=============================================================
    //JSON Provincias
    //JSON Cantones
    //JSON Distritos
    //
    //Provincia seleccionada <>
    //Cantones por provincia <>
    //Cantones seleccionada <>
    //Distritos por canton <>
    //Distritos seleccionada Null
    //
    //Cuarta Carga==============================================================
    //JSON Provincias
    //JSON Cantones
    //JSON Distritos
    //
    //Provincia seleccionada <>
    //Cantones por provincia <>
    //Cantones seleccionada <>
    //Distritos por canton <>
    //Distritos seleccionada <>
    

    @GetMapping("/canton/lista")
    public String mostrarCantones(Model model) {
        //JSON Provincias
        List<Provincia> provincias = provinciaService.getProvincias();
        String provinciasJSON = Json.JsonProvincia(provincias);
        model.addAttribute("provincias", provincias);
        model.addAttribute("provinciasJSON", provinciasJSON);
        model.addAttribute("provincia", null);
        
        //JSON Canton
        List<Canton> cantonesTodos = cantonService.getCantones();
        String cantonesJSON = Json.Json(cantonesTodos);
        model.addAttribute("cantonesTodos", cantonesTodos);
        model.addAttribute("cantonesJSON", cantonesJSON);
        
        //JSON Distritos
        List<Distrito> distritosTodos = distritoService.getDistritos();
        String distritosJSON = Json.JsonDistrito(distritosTodos);
        model.addAttribute("distritosTodos", distritosTodos);
        model.addAttribute("distritosJSON", distritosJSON);

        return "/canton/lista";
    }

    @GetMapping("/canton/lista/{idProvincia}")
    public String obtenerCantonesPorProvincia(Provincia provincia, Model model) {
        //JSON Provincias
        List<Provincia> provincias = provinciaService.getProvincias();
        String provinciasJSON = Json.JsonProvincia(provincias);
        model.addAttribute("provincias", provincias);
        model.addAttribute("provinciasJSON", provinciasJSON);
        
        //JSON Canton
        List<Canton> cantonesTodos = cantonService.getCantones();
        String cantonesJSON = Json.Json(cantonesTodos);
        model.addAttribute("cantonesTodos", cantonesTodos);
        model.addAttribute("cantonesJSON", cantonesJSON);
        
        //JSON Distritos
        List<Distrito> distritosTodos = distritoService.getDistritos();
        String distritosJSON = Json.JsonDistrito(distritosTodos);
        model.addAttribute("distritosTodos", distritosTodos);
        model.addAttribute("distritosJSON", distritosJSON);
        
        //Provincia buscada
        provincia = provinciaService.getProvincia(provincia);
        model.addAttribute("provincia", provincia);

        //Obteniendo cantones por provincia
        List<Canton> cantonesPorProvincia = cantonService.getCantonesByProvincia(provincia);
        model.addAttribute("cantones", cantonesPorProvincia);

        return "/canton/lista";
    }
    
    @GetMapping("/canton/lista/{idProvincia}/{idCanton}")
    public String obtenerDistritosPorCantonPorProvincia(Provincia provincia, Canton canton, Model model) {
        //JSON Provincias
        List<Provincia> provincias = provinciaService.getProvincias();
        String provinciasJSON = Json.JsonProvincia(provincias);
        model.addAttribute("provincias", provincias);
        model.addAttribute("provinciasJSON", provinciasJSON);
        
        //JSON Canton
        List<Canton> cantonesTodos = cantonService.getCantones();
        String cantonesJSON = Json.Json(cantonesTodos);
        model.addAttribute("cantonesTodos", cantonesTodos);
        model.addAttribute("cantonesJSON", cantonesJSON);
        
        //JSON Distritos
        List<Distrito> distritosTodos = distritoService.getDistritos();
        String distritosJSON = Json.JsonDistrito(distritosTodos);
        model.addAttribute("distritosTodos", distritosTodos);
        model.addAttribute("distritosJSON", distritosJSON);
        
        //Provincia buscada
        provincia = provinciaService.getProvincia(provincia);
        model.addAttribute("provincia", provincia);

        //Obteniendo cantones por provincia
        List<Canton> cantonesPorProvincia = cantonService.getCantonesByProvincia(provincia);
        model.addAttribute("cantones", cantonesPorProvincia);
        canton=cantonService.getCanton(canton, provincia.getIdProvincia());
        model.addAttribute("canton", canton);
        
        //Obteniendo distritos por canton
        List<Distrito> distritosPorCanton = distritoService.getDistritosByCanton(canton);
        model.addAttribute("distritos", distritosPorCanton);
        

        return "/canton/lista";
    }
    
    @GetMapping("/canton/lista/{idProvincia}/{idCanton}/{idDistrito}")
    public String direccionCompleta(Provincia provincia, Canton canton, Distrito distrito, Model model) {
        //JSON Provincias
        List<Provincia> provincias = provinciaService.getProvincias();
        String provinciasJSON = Json.JsonProvincia(provincias);
        model.addAttribute("provincias", provincias);
        model.addAttribute("provinciasJSON", provinciasJSON);
        
        //JSON Canton
        List<Canton> cantonesTodos = cantonService.getCantones();
        String cantonesJSON = Json.Json(cantonesTodos);
        model.addAttribute("cantonesTodos", cantonesTodos);
        model.addAttribute("cantonesJSON", cantonesJSON);
        
        //JSON Distritos
        List<Distrito> distritosTodos = distritoService.getDistritos();
        String distritosJSON = Json.JsonDistrito(distritosTodos);
        model.addAttribute("distritosTodos", distritosTodos);
        model.addAttribute("distritosJSON", distritosJSON);
        
        //Provincia buscada
        provincia = provinciaService.getProvincia(provincia);
        model.addAttribute("provincia", provincia);

        //Obteniendo cantones por provincia
        List<Canton> cantonesPorProvincia = cantonService.getCantonesByProvincia(provincia);
        model.addAttribute("cantones", cantonesPorProvincia);
        canton=cantonService.getCanton(canton, provincia.getIdProvincia());
        model.addAttribute("canton", canton);
        
        //Obteniendo distritos por canton
        List<Distrito> distritosPorCanton = distritoService.getDistritosByCanton(canton);
        model.addAttribute("distritos", distritosPorCanton);
        distrito=distritoService.getDistrito(distrito, canton.getIdCanton(), provincia.getIdProvincia());
        model.addAttribute("distrito", distrito);
        

        return "/canton/lista";
    }
}
