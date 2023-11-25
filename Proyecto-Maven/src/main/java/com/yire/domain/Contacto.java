package com.yire.domain;

import java.io.Serializable;
import javax.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "Contacto")
public class Contacto implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idContacto")

    private long idContacto;
    private String nombre;
    private String apellido1;
    private String apellido2;
    private String cedula;

    public Contacto() {
    }

    public Contacto(long idContacto, String nombre, String apellido1, String apellido2, String cedula) {
        this.idContacto = idContacto;
        this.nombre = nombre;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
        this.cedula = cedula;
    }

}
