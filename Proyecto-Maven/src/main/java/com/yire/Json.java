package com.yire;

import com.google.gson.Gson;
import com.yire.domain.Canton;
import com.yire.domain.Distrito;
import com.yire.domain.EmpleadoPuesto;
import com.yire.domain.Provincia;
import com.yire.domain.Puesto;
import java.util.List;

public class Json {

    public static String Json(List<Canton> lista) {
        Gson gson = new Gson();
        String jsonArray = gson.toJson(lista);
        return jsonArray;
    }

    public static String JsonProvincia(List<Provincia> lista) {
        Gson gson = new Gson();
        String jsonArray = gson.toJson(lista);
        return jsonArray;
    }

    public static String JsonDistrito(List<Distrito> lista) {
        Gson gson = new Gson();
        String jsonArray = gson.toJson(lista);
        return jsonArray;
    }
    
    public static String JsonEmpleadoPuesto(List<Puesto> lista) {
        Gson gson = new Gson();
        String jsonArray = gson.toJson(lista);
        return jsonArray;
    }
}
