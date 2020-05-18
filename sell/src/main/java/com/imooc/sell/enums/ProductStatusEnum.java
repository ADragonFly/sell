package com.imooc.sell.enums;

import lombok.Getter;

/**商品状态
 * @author Administrator
 */

@Getter
public enum ProductStatusEnum implements CodeEnum{
    /**
     * 0在架，1下架
     */
    UP(0,"在架"),
    DOWN(1,"下架"),
    ;

    private Integer code;
    private String message;

    ProductStatusEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }
}