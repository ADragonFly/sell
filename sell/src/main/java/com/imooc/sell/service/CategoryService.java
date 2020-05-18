package com.imooc.sell.service;


import com.imooc.sell.dataobject.ProductCategory;

import java.util.List;

public interface CategoryService {
    ProductCategory findOne(Integer categoryId);
        /**
     * 卖家端
     * @return
     */
    List<ProductCategory> findAll();

    /**
     * 买家端
     * @param categoryTypeList
     * @return
     */
        List<ProductCategory> findByCategoryTypeIn(List<Integer> categoryTypeList);

      ProductCategory save(ProductCategory productCategory);
}
