package com.yire.domain;

import java.io.Serializable;
import lombok.Data;

@Data

public class ClienteDireccionPK implements Serializable {

    private long idDireccion;
    private long idCliente;

    public ClienteDireccionPK() {
    }

    public ClienteDireccionPK(long idDireccion, long idCliente) {
        this.idDireccion = idDireccion;
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
