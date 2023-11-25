package com.yire.domain;

import java.io.Serializable;
import javax.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "Locales")
public class Locales implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IdLocal")

    private long IdLocal;
    private String nombre;
    private int proposito;

    public Locales() {
    }

    public Locales(long IdLocal, String nombre, int proposito) {
        this.IdLocal = IdLocal;
        this.nombre = nombre;
        this.proposito = proposito;
    }

}
