package com.imooc.sell.enums;

import lombok.Getter;

/**
 * @author Administrator
 */

@Getter
public enum OrderStatusEnum implements CodeEnum{
    /**
     * code代表值 msg 订单状态信息
     */
        NEW(0,"新订单"),
        FINISHED(1,"完结订单"),
        CANCEL(2,"取消订单"),
        ;
        private Integer code;
        private String msg;

    OrderStatusEnum(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
