package com.yire.domain;

import java.io.Serializable;

public class ContactoCorreoPK implements Serializable{

    private long idContacto;
    private String correo;

    public ContactoCorreoPK() {
    }

    public ContactoCorreoPK(long idContacto, String correo) {
        this.idContacto = idContacto;
        this.correo = correo;
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
