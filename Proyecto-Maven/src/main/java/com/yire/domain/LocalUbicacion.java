package com.yire.domain;

import java.io.Serializable;
import javax.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "Localubicacion",schema="PROYECTO_ADM")
public class LocalUbicacion implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IdLocal")

    private long IdLocal;
    private long IdProvincia;
    private long IdCanton;
    private long IdDistrito;
    private String indicaciones;

    public LocalUbicacion() {
    }

    public LocalUbicacion(long IdLocal, long IdProvincia, long IdCanton, long IdDistrito, String indicaciones) {
        this.IdLocal = IdLocal;
        this.IdProvincia = IdProvincia;
        this.IdCanton = IdCanton;
        this.IdDistrito = IdDistrito;
        this.indicaciones = indicaciones;
    }

}
