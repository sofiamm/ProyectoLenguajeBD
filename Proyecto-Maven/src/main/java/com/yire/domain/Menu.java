package com.yire.domain;

import java.io.Serializable;
import javax.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "Menu",schema="PROYECTO_ADM")
public class Menu implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IdMenu")

    private long IdMenu;
    private int precio;
    private int personas;

    public Menu() {
    }

    public Menu(long IdMenu, int precio, int personas) {
        this.IdMenu = IdMenu;
        this.precio = precio;
        this.personas = personas;
    }

}
