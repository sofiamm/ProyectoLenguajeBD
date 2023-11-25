package com.yire.domain;

import javax.persistence.Entity;
import javax.persistence.IdClass;
import javax.persistence.Table;
import javax.persistence.Id;
import lombok.Data;

@Data
@Entity
@Table(name = "FacturaDetalle")
@IdClass(FacturaDetallePK.class)
public class FacturaDetalle {

    @Id
    private long numFactura;

    @Id
    private long idMenu;

    public FacturaDetalle() {
    }

    public FacturaDetalle(long numFactura, long idMenu) {
        this.numFactura = numFactura;
        this.idMenu = idMenu;
    }

}
