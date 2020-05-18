package com.imooc.sell.form;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @author Administrator
 */
@Data
public class ProductForm {

    private String productId;
    private String productName;
    private BigDecimal productPrice;
    private Integer productStock;
    private String productDescription;
    private String productIcon;
    /**
     * 商品状态 0上架 1下架
     */
//    private Integer productStatus;
    /**
     * 类目编号
     */
    private Integer categoryType;

}
