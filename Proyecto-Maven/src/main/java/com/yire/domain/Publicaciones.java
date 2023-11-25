package com.yire.domain;

import java.io.Serializable;
import java.sql.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.IdClass;
import javax.persistence.Table;
import javax.persistence.Id;
import lombok.Data;

@Data
@Entity
@Table(name = "Publicaciones")
public class Publicaciones implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idPublicacion")
    private long idPublicacion;
    private String link;
    private long codServicio;
    private Date fecha;

    public Publicaciones() {
    }

    public Publicaciones(long idPublicacion, String link, long codServicio, Date fecha) {
        this.idPublicacion = idPublicacion;
        this.link = link;
        this.codServicio = codServicio;
        this.fecha = fecha;
    }

}
