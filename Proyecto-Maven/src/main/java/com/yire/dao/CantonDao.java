package com.yire.dao;

import com.yire.domain.Canton;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface CantonDao extends CrudRepository<Canton, Long> {
    public List<Canton> findByIdProvincia(long idProvincia);
    
//    @Query(value = "select * from proyecto_adm.canton where u.id_Provincia= :id_provincia and u.id_canton=:id_canton")
//    public Canton findByIdProvinciaAndIdCanton(@Param("id_provincia") long idProvincia,@Param("id_canton") long idCanton);
}
