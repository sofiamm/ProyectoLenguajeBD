package com.yire.domain;

import java.io.Serializable;
import javax.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "Producto",schema="PROYECTO_ADM")
public class Producto implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IdProducto")
    
    private long IdProducto;
    private String nombre;
    private int precio;
    private String descripcion;
    private String imagen;

    public Producto() {
    }

    public Producto(long IdProducto, String nombre, int precio, String descripcion, String imagen) {
        this.IdProducto = IdProducto;
        this.nombre = nombre;
        this.precio = precio;
        this.descripcion = descripcion;
        this.imagen = imagen;
    }


    
    

}
