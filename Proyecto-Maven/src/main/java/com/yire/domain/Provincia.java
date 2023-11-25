package com.yire.domain;

import java.io.Serializable;
import javax.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "Provincia")
public class Provincia implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IdProvincia")

    private long IdProvincia;
    private String nombre;

    public Provincia() {
    }

    public Provincia(long IdProvincia, String nombre) {
        this.IdProvincia = IdProvincia;
        this.nombre = nombre;
    }

}
