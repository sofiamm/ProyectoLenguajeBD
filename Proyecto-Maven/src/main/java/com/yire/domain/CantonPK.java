package com.yire.domain;

import java.io.Serializable;
import javax.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode
public class CantonPK implements Serializable {
    
    private Provincia provincia;
    private long IdCanton;
}
