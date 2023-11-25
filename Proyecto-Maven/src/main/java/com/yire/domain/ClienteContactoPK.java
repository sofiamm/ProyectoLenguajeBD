package com.yire.domain;

import java.io.Serializable;

public class ClienteContactoPK implements Serializable {

    private long idCliente;
    private long idContacto;

    public ClienteContactoPK() {
    }

    public ClienteContactoPK(long idCliente, long idContacto) {
        this.idCliente = idCliente;
        this.idContacto = idContacto;
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
