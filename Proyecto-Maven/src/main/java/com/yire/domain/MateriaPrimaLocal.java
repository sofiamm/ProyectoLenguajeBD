package com.yire.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "MateriaPrimaLocal")
@IdClass(MateriaPrimaLocalPK.class)
public class MateriaPrimaLocal {

    @Id
    private long idMateriaPrima;

    @Id
    private long idLocal;

//    @JoinColumn(name="idEmpleado", referencedColumnName = "idEmpleado")
//    @ManyToOne
//    private Empleado empleado;    
    public MateriaPrimaLocal() {
    }

    public MateriaPrimaLocal(long idMateriaPrima, long idLocal) {
        this.idMateriaPrima = idMateriaPrima;
        this.idLocal = idLocal;
    }

}
