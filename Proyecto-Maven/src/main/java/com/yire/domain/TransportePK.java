package com.yire.domain;

import java.io.Serializable;

public class TransportePK implements Serializable{
    
    private long codServicio;
    private long idActivo;

    public TransportePK() {
    }

    public TransportePK(long codServicio, long idActivo) {
        this.codServicio = codServicio;
        this.idActivo = idActivo;
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
