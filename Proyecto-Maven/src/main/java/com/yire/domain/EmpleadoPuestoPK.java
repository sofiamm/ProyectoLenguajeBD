package com.yire.domain;

import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode
public class EmpleadoPuestoPK implements Serializable {

    private long idEmpleado;
    private long idPuesto;

    public EmpleadoPuestoPK() {
    }

    public EmpleadoPuestoPK(long idEmpleado, long idPuesto) {
        this.idEmpleado = idEmpleado;
        this.idPuesto = idPuesto;
    }

}
