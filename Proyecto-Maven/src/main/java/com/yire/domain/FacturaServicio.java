package com.yire.domain;

import javax.persistence.Entity;
import javax.persistence.IdClass;
import javax.persistence.Table;
import javax.persistence.Id;
import lombok.Data;

@Data
@Entity
@Table(name = "Facturaservicio",schema="PROYECTO_ADM")
@IdClass(FacturaServicioPK.class)
public class FacturaServicio {

    @Id
    private long numFactura;

    @Id
    private long codServicio;

    public FacturaServicio() {
    }

    public FacturaServicio(long numFactura, long codServicio) {
        this.numFactura = numFactura;
        this.codServicio = codServicio;
    }

}
