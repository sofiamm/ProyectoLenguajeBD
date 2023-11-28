package com.yire.domain;

import java.io.Serializable;
import javax.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "Canton",schema="PROYECTO_ADM")
public class Canton implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IdCanton")
    private long IdCanton;
    private long IdProvincia;
    private String nombre;

    public Canton() {
    }

    public Canton(long IdProvincia, long IdCanton, String nombre) {
        this.IdProvincia = IdProvincia;
        this.IdCanton = IdCanton;
        this.nombre = nombre;
    }

}
