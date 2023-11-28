package com.yire.domain;

import javax.persistence.Entity;
import javax.persistence.IdClass;
import javax.persistence.Table;
import javax.persistence.Id;
import lombok.Data;

@Data
@Entity
@Table(name = "Serviciocliente",schema="PROYECTO_ADM")
@IdClass(ServicioClientePK.class)
public class ServicioCliente {

    @Id
    private long codServicio;

    @Id
    private long idCliente;

    public ServicioCliente() {
    }

    public ServicioCliente(long codServicio, long idCliente) {
        this.codServicio = codServicio;
        this.idCliente = idCliente;
    }

}
