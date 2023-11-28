package com.yire.domain;

import java.io.Serializable;
import lombok.Data;

@Data

public class EmpleadoCorreoPK implements Serializable {

    private long idEmpleado;
    private String correo;

    public EmpleadoCorreoPK() {
    }

    public EmpleadoCorreoPK(long idEmpleado, String correo) {
        this.idEmpleado = idEmpleado;
        this.correo = correo;
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
