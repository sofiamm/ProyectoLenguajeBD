package com.yire.domain;

import java.io.Serializable;

public class EmpleadoPuestoPK implements Serializable {

    private long idEmpleado;
    private long idPuesto;

    public EmpleadoPuestoPK() {
    }

    public EmpleadoPuestoPK(long idEmpleado, long idPuesto) {
        this.idEmpleado = idEmpleado;
        this.idPuesto = idPuesto;
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
