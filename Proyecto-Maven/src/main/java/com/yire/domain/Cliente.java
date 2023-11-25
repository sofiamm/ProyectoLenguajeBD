package com.yire.domain;

import java.io.Serializable;
import javax.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "Cliente")
public class Cliente implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IdCliente")

    private long idCliente;
    private String nombre;
    private String tipo;

    public Cliente() {
    }

    public Cliente(long idCliente, String nombre, String tipo) {
        this.idCliente = idCliente;
        this.nombre = nombre;
        this.tipo = tipo;
    }

}
