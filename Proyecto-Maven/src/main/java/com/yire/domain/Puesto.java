package com.yire.domain;

import java.io.Serializable;
import javax.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "Puesto", schema = "PROYECTO_ADM")
public class Puesto implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idPuesto")
    private long idPuesto;
    private String nombre;
    private long salariomin;
    private long salariomax;

    public Puesto() {
    }

    public Puesto(long idPuesto, String nombre, long salarioMin, long salarioMax) {
        this.idPuesto = idPuesto;
        this.nombre = nombre;
        this.salariomin = salarioMin;
        this.salariomax = salarioMax;
    }

    public Puesto(long idPuesto) {
        this.idPuesto = idPuesto;
    }

}
