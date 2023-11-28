package com.yire.domain;

import java.io.Serializable;
import lombok.Data;

@Data

public class ServicioEmpleadosPK implements Serializable{

    private long codServicio;
    private long idEmpleado;

    public ServicioEmpleadosPK() {
    }

    public ServicioEmpleadosPK(long codServicio, long idEmpleado) {
        this.codServicio = codServicio;
        this.idEmpleado = idEmpleado;
    }
    
    @Override
    public int hashCode() {
        return 1;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        return true;
    }
}
