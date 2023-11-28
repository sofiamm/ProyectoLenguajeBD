package com.yire.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name="Empleadocorreo",schema="PROYECTO_ADM")
@IdClass(EmpleadoCorreoPK.class)
public class EmpleadoCorreo {
    
    @Id
    private long idEmpleado;
    
    @Id
    private String correo;

//    @JoinColumn(name="idEmpleado", referencedColumnName = "idEmpleado")
//    @ManyToOne
//    private Empleado empleado;    
    
    public EmpleadoCorreo() {
    }

    public EmpleadoCorreo(long idEmpleado, String correo) {
        this.idEmpleado = idEmpleado;
        this.correo = correo;
    }
    
}
