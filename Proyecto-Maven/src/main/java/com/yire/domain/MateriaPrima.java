package com.yire.domain;

import java.io.Serializable;
import javax.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "MATERIAPRIMA")  
public class MateriaPrima {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID_MATERIAPRIMA")
    private Long idMateriaPrima;

    @Column(name = "NOMBRE")
    private String nombre;

    @Column(name = "RESERVAS")
    private Integer reservas;  // O el tipo numérico correcto

    @Column(name = "UNIDADDEMEDICION")
    private String unidadDeMedicion;

    @Column(name = "MARCA")
    private String marca;

    @Column(name = "COSTOPORUNIDAD")
    private Double costoPorUnidad;  // O BigDecimal si es necesario
    
    // Getters y setters
}

