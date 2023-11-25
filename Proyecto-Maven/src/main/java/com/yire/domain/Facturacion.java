package com.yire.domain;

import java.io.Serializable;
import java.sql.Date;
import javax.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "Facturacion")
public class Facturacion implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "numFactura")

    private long numFactura;
    private Date fecha;
    private String metodoPago;
    private long total;

    public Facturacion() {
    }

    public Facturacion(long numFactura, Date fecha, String metodoPago, long total) {
        this.numFactura = numFactura;
        this.fecha = fecha;
        this.metodoPago = metodoPago;
        this.total = total;
    }

}