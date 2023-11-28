package com.yire.domain;

import java.io.Serializable;
import lombok.Data;

@Data

public class ServicioClientePK implements Serializable {

    private long codServicio;
    private long idCliente;

    public ServicioClientePK() {
    }

    public ServicioClientePK(long codServicio, long idCliente) {
        this.codServicio = codServicio;
        this.idCliente = idCliente;
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
