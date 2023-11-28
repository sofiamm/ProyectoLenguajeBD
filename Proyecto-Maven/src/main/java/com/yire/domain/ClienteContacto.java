package com.yire.domain;

import javax.persistence.Entity;
import javax.persistence.IdClass;
import javax.persistence.Table;
import javax.persistence.Id;
import lombok.Data;

@Data
@Entity
@Table(name = "Clientecontacto",schema="PROYECTO_ADM")
@IdClass(ClienteContactoPK.class)
public class ClienteContacto {

    @Id
    private long idCliente;

    @Id
    private long idContacto;

    public ClienteContacto() {
    }

    public ClienteContacto(long idCliente, long idContacto) {
        this.idCliente = idCliente;
        this.idContacto = idContacto;
    }

}
