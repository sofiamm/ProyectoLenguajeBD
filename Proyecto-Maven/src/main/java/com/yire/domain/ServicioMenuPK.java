package com.yire.domain;

import java.io.Serializable;
import lombok.Data;

@Data

public class ServicioMenuPK implements Serializable {

    private long codServicio;
    private long idMenu;

    public ServicioMenuPK() {
    }

    public ServicioMenuPK(long codServicio, long idMenu) {
        this.codServicio = codServicio;
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
