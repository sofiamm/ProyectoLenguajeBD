package com.yire.domain;

import javax.persistence.Entity;
import javax.persistence.IdClass;
import javax.persistence.Table;
import javax.persistence.Id;
import lombok.Data;

@Data
@Entity
@Table(name = "ContactoTelefono")
@IdClass(ContactoTelefonoPK.class)
public class ContactoTelefono {

    @Id
    private long idContacto;

    @Id
    private String telefono;

    public ContactoTelefono() {
    }

    public ContactoTelefono(long idContacto, String telefono) {
        this.idContacto = idContacto;
        this.telefono = telefono;
    }

}
