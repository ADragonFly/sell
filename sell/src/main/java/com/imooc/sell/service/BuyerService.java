package com.imooc.sell.service;

import com.imooc.sell.DTO.OrderDTO;

/**
 * @author Administrator
 */
public interface BuyerService {
    OrderDTO findOrderOne(String openid , String orderId);
    OrderDTO cancelOrder(String openid , String orderId);
}
