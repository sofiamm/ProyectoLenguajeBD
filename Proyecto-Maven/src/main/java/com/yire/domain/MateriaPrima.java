package com.yire.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "MATERIAPRIMA")  
public class MateriaPrima implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID_MATERIAPRIMA")
    private Long idMateriaPrima;

    @Column(name = "NOMBRE")
    private String nombre;

    @Column(name = "RESERVAS")
    private String reservas;  // O el tipo String si es necesario


    @Column(name = "UNIDADDEMEDICION")
    private String unidadDeMedicion;


    @Column(name = "MARCA")
    private String marca;

       @Column(name = "COSTOPORUNIDAD")
    private BigDecimal costoPorUnidad;

    
    // Getters y setters
}

