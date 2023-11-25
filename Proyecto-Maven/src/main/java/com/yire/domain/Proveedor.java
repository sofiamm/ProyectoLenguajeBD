package com.yire.domain;

import java.io.Serializable;
import javax.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "Proveedor")
public class Proveedor implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IdProveedor")

    private long idProveedor;
    private String nombre;

    public Proveedor() {
    }

    public Proveedor(long idProveedor, String nombre) {
        this.idProveedor = idProveedor;
        this.nombre = nombre;
    }

}
