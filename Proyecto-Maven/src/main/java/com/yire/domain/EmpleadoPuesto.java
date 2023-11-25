package com.yire.domain;

import javax.persistence.Entity;
import javax.persistence.IdClass;
import javax.persistence.Table;
import javax.persistence.Id;
import lombok.Data;

@Data
@Entity
@Table(name="EmpleadoPuesto")
@IdClass(EmpleadoPuestoPK.class)
public class EmpleadoPuesto{
    
    @Id
    private long idEmpleado;
    @Id
    private long idPuesto;

    public EmpleadoPuesto() {
    }

    public EmpleadoPuesto(long idEmpleado, long idPuesto) {
        this.idEmpleado = idEmpleado;
        this.idPuesto = idPuesto;
    }
    
    
    
}
