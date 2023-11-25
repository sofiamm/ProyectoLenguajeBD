package com.yire.domain;

import java.io.Serializable;

public class ProductoMateriaPrimaPK implements Serializable {

    private long idProducto;
    private long idMateriaPrima;

    public ProductoMateriaPrimaPK() {
    }

    public ProductoMateriaPrimaPK(long idProducto, long idMateriaPrima) {
        this.idProducto = idProducto;
        this.idMateriaPrima = idMateriaPrima;
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
