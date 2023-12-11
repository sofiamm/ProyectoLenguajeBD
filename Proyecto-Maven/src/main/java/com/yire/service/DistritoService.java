package com.yire.service;

import com.yire.domain.Canton;
import com.yire.domain.Distrito;
import java.util.List;

public interface DistritoService {
    public List<Distrito> getDistritos();
    public Distrito getDistrito(Distrito distrito, long id_canton,long id_provincia);
    public List<Distrito> getDistritosByCanton(Canton canton);
}
