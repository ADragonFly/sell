package com.imooc.sell.dataobject;

import com.imooc.sell.dataobject.mapper.ProductCategoryMapper;
import lombok.extern.slf4j.Slf4j;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.HashMap;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class ProductCategoryMapperTest {

    @Autowired
    private ProductCategoryMapper mapper;

    @Test
    public void insertByMap() {
        Map<String , Object> map = new HashMap<>();
        map.put("category_name","大师兄二师兄");
        map.put("category_type","111");
        int result = mapper.insertByMap(map);
        Assert.assertEquals("1",result);
    }

    @Test
    public void insertByObject() {
        ProductCategory productCategory = new ProductCategory();
        productCategory.setCategoryName("大师兄二师兄");
        productCategory.setCategoryType(112);
        int result = mapper.insertByObject(productCategory);
        Assert.assertEquals("1",result);
    }

    @Test
    public void findByCategoryType() {
        ProductCategory productCategory = new ProductCategory();
        ProductCategory result = mapper.findByCategoryType(111);
        Assert.assertNotNull(result);
    }



}