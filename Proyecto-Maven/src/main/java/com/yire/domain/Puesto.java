package com.yire.domain;

import java.io.Serializable;
import javax.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "Puesto")
public class Puesto implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idPuesto")
    private long idPuesto;
    private String nombre;
    private long salarioMin;
    private long salarioMax;

    public Puesto() {
    }

    public Puesto(long idPuesto, String nombre, long salarioMin, long salarioMax) {
        this.idPuesto = idPuesto;
        this.nombre = nombre;
        this.salarioMin = salarioMin;
        this.salarioMax = salarioMax;
    }
    
}
