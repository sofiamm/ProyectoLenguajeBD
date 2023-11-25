package com.yire.domain;

import java.io.Serializable;
import javax.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "Activos")
public class Activos implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IdActivo")
    
    private long idActivo;
    private String descripcion;
    private int idLocal;

    public Activos(int idActivo, String descripcion, int idLocal) {
        this.idActivo = idActivo;
        this.descripcion = descripcion;
        this.idLocal = idLocal;
    }
    
    

}
