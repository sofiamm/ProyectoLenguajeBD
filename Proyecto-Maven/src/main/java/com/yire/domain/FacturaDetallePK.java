package com.yire.domain;

import java.io.Serializable;

public class FacturaDetallePK implements Serializable {

    private long numFactura;
    private long idMenu;

    public FacturaDetallePK() {
    }

    public FacturaDetallePK(long numFactura, long idMenu) {
        this.numFactura = numFactura;
        this.idMenu = idMenu;
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
