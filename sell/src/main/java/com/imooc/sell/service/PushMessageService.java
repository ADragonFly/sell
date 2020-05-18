package com.imooc.sell.service;

import com.imooc.sell.DTO.OrderDTO;

/**推送消息
 * @author Administrator
 */
public interface PushMessageService {

    void orderStatus(OrderDTO orderDTO);

}
