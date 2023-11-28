package com.yire.domain;

import javax.persistence.Entity;
import javax.persistence.IdClass;
import javax.persistence.Table;
import javax.persistence.Id;
import lombok.Data;

@Data
@Entity
@Table(name = "Transporte",schema="PROYECTO_ADM")
@IdClass(TransportePK.class)
public class Transporte {

    @Id 
    private long codServicio;
    
    @Id
    private long idActivo;

    public Transporte() {
    }

    public Transporte(long codServicio, long idActivo) {
        this.codServicio = codServicio;
        this.idActivo = idActivo;
    }
    
    

}
