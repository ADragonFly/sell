package com.imooc.sell.DTO;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.imooc.sell.dataobject.OrderDetail;
import com.imooc.sell.enums.OrderStatusEnum;
import com.imooc.sell.enums.PayStatusEnum;
import com.imooc.sell.utils.EnumUtil;
import com.imooc.sell.utils.serializer.Date2LongSerializer;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * @author Administrator
 */
@Data
//@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
//@JsonInclude(JsonInclude.Include.NON_NULL)
public class OrderDTO {
        /**
         * 订单ID
         */
        private String orderId;
        /**
         * 买家名字
         */
        private String buyerName;
        /**
         * 电话
         */
        private String buyerPhone;
        /**
         * 地址
         */
        private String buyerAddress;
        /**
         * 买家openid
         */
        private String buyerOpenid;
        /**
         * 订单总金额
         */
        private BigDecimal orderAmount;
        /**
         * 订单状态,默认为0新订单
         */
        private Integer orderStatus;
        /**
         * 支付状态，默认为未支付
         */
        private Integer payStatus;
        /**
         * 创建时间 更新时间
         */
        @JsonSerialize(using = Date2LongSerializer.class)
        private Date createTime;
        @JsonSerialize(using = Date2LongSerializer.class)
        private Date updateTime;
        /**
         * 项目需要可设初始值 返回字符串
         */
//        List<OrderDetail> orderDetailList = new ArrayList<>();
        List<OrderDetail> orderDetailList;

        @JsonIgnore
        public OrderStatusEnum getOrderStatusEnum(){
                return EnumUtil.getCode(orderStatus , OrderStatusEnum.class);
        }

        @JsonIgnore
        public PayStatusEnum getPayStatusEnum(){
                return EnumUtil.getCode(payStatus , PayStatusEnum.class);
        }


}