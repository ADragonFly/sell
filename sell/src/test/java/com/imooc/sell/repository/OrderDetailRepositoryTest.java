package com.imooc.sell.repository;

import com.imooc.sell.dataobject.OrderDetail;
import org.junit.After;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.math.BigDecimal;
import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest
public class OrderDetailRepositoryTest {

    @Autowired
    OrderDetailRepository repository;

    @Test
    public void saveTest(){

        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setDetailId("1234567890");
        orderDetail.setOrderId("1111110");
        orderDetail.setProductIcon("http://aaa.jpg");
        orderDetail.setProductId("1111110");
        orderDetail.setProductName("皮蛋粥");
        orderDetail.setProductPrice(new BigDecimal(1.2));
        orderDetail.setProductQuantity(3);
        OrderDetail result = repository.save(orderDetail);
        Assert.assertNotNull(result);

    }


    @Test
    public void findByOrderId() {

        List<OrderDetail> details = repository.findByOrderId("1111110");
        Assert.assertEquals(0,details.size());


    }
}