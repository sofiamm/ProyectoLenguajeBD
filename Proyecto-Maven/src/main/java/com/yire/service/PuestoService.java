package com.yire.service;

import com.yire.domain.Puesto;
import java.util.List;

public interface PuestoService {
    public List<Puesto> getPuestos();
    public Puesto getPuesto(Puesto puesto);
    public void save(Puesto puesto);
    public void delete(Puesto puesto);
}
