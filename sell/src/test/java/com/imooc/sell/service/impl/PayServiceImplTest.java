package com.imooc.sell.service.impl;

import com.imooc.sell.DTO.OrderDTO;
import com.imooc.sell.service.OrderService;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.core.AutoConfigureCache;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class PayServiceImplTest {

    @Autowired
    private PayServiceImpl payService;
    @Autowired
    private OrderService orderService;

    @Test
    public void create() {
        OrderDTO orderDTO = orderService.findOne("1574334886519556254");
        payService.create(orderDTO);
        log.info("[]");
    }

    @Test
    public void refund() {

        OrderDTO orderDTO = orderService.findOne("1574334886519556254");
        payService.refund(orderDTO);

    }
}