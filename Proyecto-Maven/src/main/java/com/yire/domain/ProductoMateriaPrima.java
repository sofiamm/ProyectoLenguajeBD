package com.yire.domain;

import javax.persistence.Entity;
import javax.persistence.IdClass;
import javax.persistence.Table;
import javax.persistence.Id;
import lombok.Data;

@Data
@Entity
@Table(name = "Productomateriaprima",schema="PROYECTO_ADM")
@IdClass(ProductoMateriaPrimaPK.class)
public class ProductoMateriaPrima {

    @Id
    private long idProducto;

    @Id
    private long idMateriaPrima;
    private long cantidadMateriaPrima;

    public ProductoMateriaPrima() {
    }

    public ProductoMateriaPrima(long idProducto, long idMateriaPrima, long cantidadMateriaPrima) {
        this.idProducto = idProducto;
        this.idMateriaPrima = idMateriaPrima;
        this.cantidadMateriaPrima = cantidadMateriaPrima;
    }

}
