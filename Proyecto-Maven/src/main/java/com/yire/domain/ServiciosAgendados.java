package com.yire.domain;

import java.io.Serializable;
import java.sql.Date;
import javax.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "ServiciosAgendados")
public class ServiciosAgendados implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "codServicio")

    private long codServicio;
    private Date fechaHora;
    private int personasAAtender;

    public ServiciosAgendados() {
    }

    public ServiciosAgendados(long codServicio, Date fechaHora, int personasAAtender) {
        this.codServicio = codServicio;
        this.fechaHora = fechaHora;
        this.personasAAtender = personasAAtender;
    }

}
