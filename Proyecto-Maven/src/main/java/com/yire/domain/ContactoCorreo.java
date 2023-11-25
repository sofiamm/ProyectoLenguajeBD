package com.yire.domain;

import javax.persistence.Entity;
import javax.persistence.IdClass;
import javax.persistence.Table;
import javax.persistence.Id;
import lombok.Data;

@Data
@Entity
@Table(name = "ContactoCorreo")
@IdClass(ContactoCorreoPK.class)
public class ContactoCorreo {

    @Id
    private long idContacto;

    @Id
    private String correo;

    public ContactoCorreo() {
    }

    public ContactoCorreo(long idContacto, String correo) {
        this.idContacto = idContacto;
        this.correo = correo;
    }

}
