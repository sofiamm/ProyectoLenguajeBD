package com.yire.domain;

import java.io.Serializable;
import lombok.Data;

@Data

public class MateriaPrimaLocalPK implements Serializable {

    private long idMateriaPrima;
    private long idLocal;

    public MateriaPrimaLocalPK() {
    }

    public MateriaPrimaLocalPK(long idMateriaPrima, long idLocal) {
        this.idMateriaPrima = idMateriaPrima;
        this.idLocal = idLocal;
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
