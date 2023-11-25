package com.yire.domain;

import java.io.Serializable;
import javax.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "MateriaPrima")
public class MateriaPrima implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IdMateriaPrima")

    private long idMateriaPrima;
    private String nombre;
    private String reservas;
    private String unidadDeMedicion;
    private String marca;
    private long costoPorUnidad;

    public MateriaPrima() {
    }

    public MateriaPrima(long idMateriaPrima, String nombre, String reservas, String unidadDeMedicion, String marca, long costoPorUnidad) {
        this.idMateriaPrima = idMateriaPrima;
        this.nombre = nombre;
        this.reservas = reservas;
        this.unidadDeMedicion = unidadDeMedicion;
        this.marca = marca;
        this.costoPorUnidad = costoPorUnidad;
    }

}
