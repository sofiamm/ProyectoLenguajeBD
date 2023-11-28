package com.yire.domain;

import java.io.Serializable;
import lombok.Data;

@Data

public class MateriaPrimaProveedorPK implements Serializable {

    private long idMateriaPrima;
    private long idProveedor;

    public MateriaPrimaProveedorPK() {
    }

    public MateriaPrimaProveedorPK(long idMateriaPrima, long idProveedor) {
        this.idMateriaPrima = idMateriaPrima;
        this.idProveedor = idProveedor;
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
