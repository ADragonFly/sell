package com.imooc.sell.utils;

import com.imooc.sell.enums.CodeEnum;

/**
 * @author Administrator
 */
public class EnumUtil {

    public static <T extends CodeEnum> T getCode(Integer code , Class<T> enumClass){
        for (T each : enumClass.getEnumConstants()
             ) {

            if (code.equals(each)){
                return each;
            }

        }
        return null;
    }

}
