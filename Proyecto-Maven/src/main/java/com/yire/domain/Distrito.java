package com.yire.domain;

import java.io.Serializable;
import javax.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "Distrito",schema="PROYECTO_ADM")
public class Distrito implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IdDistrito")
    private long IdDistrito;
    @Column(name = "idProvincia")
    private long IdProvincia;
    @Column(name = "idCanton")
    private long IdCanton;
    private String nombre;

    public Distrito() {
    }

    public Distrito(long IdProvincia, long IdCanton, long IdDistrito, String nombre) {
        this.IdProvincia = IdProvincia;
        this.IdCanton = IdCanton;
        this.IdDistrito = IdDistrito;
        this.nombre = nombre;
    }

}
