package com.yire.domain;

import java.io.Serializable;
import lombok.Data;

@Data

public class FacturaServicioPK implements Serializable {

    private long numFactura;
    private long codServicio;

    public FacturaServicioPK() {
    }

    public FacturaServicioPK(long numFactura, long codServicio) {
        this.numFactura = numFactura;
        this.codServicio = codServicio;
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
