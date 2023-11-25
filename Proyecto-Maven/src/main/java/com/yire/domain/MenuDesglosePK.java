package com.yire.domain;

import java.io.Serializable;

public class MenuDesglosePK implements Serializable {

    private long idMenu;
    private long idProducto;

    public MenuDesglosePK() {
    }

    public MenuDesglosePK(long idMenu, long idProducto) {
        this.idMenu = idMenu;
        this.idProducto = idProducto;
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
