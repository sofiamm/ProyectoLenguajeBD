package com.yire;

import com.google.gson.Gson;
import com.yire.domain.Canton;
import java.util.List;

public class Json {
    
    public static String Json(List<Canton> lista){
        Gson gson = new Gson();
        String jsonArray = gson.toJson(lista);
        return jsonArray;
    }
}
