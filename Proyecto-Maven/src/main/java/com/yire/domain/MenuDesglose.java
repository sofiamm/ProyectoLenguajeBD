package com.yire.domain;

import javax.persistence.Entity;
import javax.persistence.IdClass;
import javax.persistence.Table;
import javax.persistence.Id;
import lombok.Data;

@Data
@Entity
@Table(name = "Menudesglose",schema="PROYECTO_ADM")
@IdClass(MenuDesglosePK.class)
public class MenuDesglose {

    @Id
    private long idMenu;

    @Id
    private long idProducto;

    private int precio;
    private int personas;

    public MenuDesglose() {
    }

    public MenuDesglose(long idMenu, long idProducto, int precio, int personas) {
        this.idMenu = idMenu;
        this.idProducto = idProducto;
        this.precio = precio;
        this.personas = personas;
    }

}
