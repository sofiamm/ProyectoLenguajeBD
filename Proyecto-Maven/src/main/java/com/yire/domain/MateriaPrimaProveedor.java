package com.yire.domain;

import javax.persistence.Entity;
import javax.persistence.IdClass;
import javax.persistence.Table;
import javax.persistence.Id;
import lombok.Data;

@Data
@Entity
@Table(name = "MateriaPrimaProveedor")
@IdClass(MateriaPrimaProveedorPK.class)
public class MateriaPrimaProveedor {

    @Id
    private long idMateriaPrima;

    @Id
    private long idProveedor;
    private long precio;

    public MateriaPrimaProveedor() {
    }

    public MateriaPrimaProveedor(long idMateriaPrima, long idProveedor, long precio) {
        this.idMateriaPrima = idMateriaPrima;
        this.idProveedor = idProveedor;
        this.precio = precio;
    }

}
