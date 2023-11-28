package com.yire.domain;

import java.io.Serializable;
import lombok.Data;

@Data

public class ContactoTelefonoPK implements Serializable{

    private long idContacto;
    private String telefono;

    public ContactoTelefonoPK() {
    }

    public ContactoTelefonoPK(long idContacto, String telefono) {
        this.idContacto = idContacto;
        this.telefono = telefono;
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
