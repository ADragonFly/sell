package com.imooc.sell.utils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class JsonUtil {

    public static String toJson(Object object){
        GsonBuilder gsonBuilder = new GsonBuilder();
        return gsonBuilder.setPrettyPrinting().create().toJson(object);
//        Gson gson = gsonBuilder.create();
//        return gson.toJson(object);
    }

}
