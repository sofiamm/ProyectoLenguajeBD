package com.yire.domain;

import java.io.Serializable;
import javax.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "Empleado",schema="PROYECTO_ADM")
public class Empleado implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id_Empleado")
    private long idEmpleado;
    private String nombre;
    private String apellido1;
    private String apellido2;
    private String alias;
    private String iban;
    private long salario;
    private String estado;
    private String password;

    public Empleado() {
    }

    public Empleado(long idEmpleado, String nombre, String apellido1, String apellido2, String alias, String iban, long salario, String estado, String password) {
        this.idEmpleado = idEmpleado;
        this.nombre = nombre;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
        this.alias = alias;
        this.iban = iban;
        this.salario = salario;
        this.estado = estado;
        this.password = password;
    }
    
    
    
    
}
