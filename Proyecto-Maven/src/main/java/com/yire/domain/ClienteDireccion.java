package com.yire.domain;

import javax.persistence.Entity;
import javax.persistence.IdClass;
import javax.persistence.Table;
import javax.persistence.Id;
import lombok.Data;

@Data
@Entity
@Table(name = "ClienteDireccion")
@IdClass(ClienteDireccionPK.class)
public class ClienteDireccion {

    @Id
    private long idDireccion;

    @Id
    private long idCliente;

    private long provincia;
    private long canton;
    private long distrito;
    private String indicaciones;

    public ClienteDireccion() {
    }

    public ClienteDireccion(long idDireccion, long idCliente, long provincia, long canton, long distrito, String indicaciones) {
        this.idDireccion = idDireccion;
        this.idCliente = idCliente;
        this.provincia = provincia;
        this.canton = canton;
        this.distrito = distrito;
        this.indicaciones = indicaciones;
    }

}
