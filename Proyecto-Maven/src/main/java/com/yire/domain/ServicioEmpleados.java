package com.yire.domain;

import javax.persistence.Entity;
import javax.persistence.IdClass;
import javax.persistence.Table;
import javax.persistence.Id;
import lombok.Data;

@Data
@Entity
@Table(name = "ServicioEmpleados")
@IdClass(ServicioEmpleadosPK.class)
public class ServicioEmpleados {
    
    @Id
    private long codServicio;
    
    @Id
    private long idEmpleado;

    public ServicioEmpleados() {
    }

    public ServicioEmpleados(long codServicio, long idEmpleado) {
        this.codServicio = codServicio;
        this.idEmpleado = idEmpleado;
    }
    
    

    
}
