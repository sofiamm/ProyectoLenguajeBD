package com.yire.domain;

import java.io.Serializable;
import javax.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "Empleado")
public class Empleado implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IdEmpleado")
    private long idEmpleado;
    private String nombre;
    private String apellido1;
    private String apellido2;
    private String alias;
    private String iban;
    private long salario;
    private String estado;
    private String varchar2;

    public Empleado() {
    }

    public Empleado(long idEmpleado, String nombre, String apellido1, String apellido2, String alias, String iban, long salario, String estado, String varchar2) {
        this.idEmpleado = idEmpleado;
        this.nombre = nombre;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
        this.alias = alias;
        this.iban = iban;
        this.salario = salario;
        this.estado = estado;
        this.varchar2 = varchar2;
    }
    
    
    
    
}
