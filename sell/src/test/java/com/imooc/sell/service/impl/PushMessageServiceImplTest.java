package com.imooc.sell.service.impl;

import com.imooc.sell.DTO.OrderDTO;
import com.imooc.sell.service.OrderService;
import com.imooc.sell.service.PushMessageService;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class PushMessageServiceImplTest {

    @Autowired
    private PushMessageServiceImpl pushMessageService;
    @Autowired
    private OrderService orderService;

    @Test
    public void orderStatus() {

        OrderDTO orderDTO = orderService.findOne("1574334886519556254");
        pushMessageService.orderStatus(orderDTO);
    }
}