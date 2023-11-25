package com.yire.domain;

import javax.persistence.Entity;
import javax.persistence.IdClass;
import javax.persistence.Table;
import javax.persistence.Id;
import lombok.Data;

@Data
@Entity
@Table(name = "ServicioMenu")
@IdClass(ServicioMenuPK.class)
public class ServicioMenu {

    @Id
    private long codServicio;

    @Id
    private long idMenu;

    public ServicioMenu() {
    }

    public ServicioMenu(long codServicio, long idMenu) {
        this.codServicio = codServicio;
        this.idMenu = idMenu;
    }

}
