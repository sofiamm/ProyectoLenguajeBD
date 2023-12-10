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
    private long idCanton;
    @Column(name = "idProvincia")
    private long idProvincia;
    private String nombre;

    public Canton() {
    }

    public Canton(long IdProvincia, long IdCanton, String nombre) {
        this.idProvincia = IdProvincia;
        this.idCanton = IdCanton;
        this.nombre = nombre;
    }

}
