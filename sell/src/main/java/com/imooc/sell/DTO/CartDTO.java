package com.imooc.sell.DTO;

import lombok.Data;

/**
 * @author Administrator
 */
@Data
public class CartDTO {

    /**
     * 商品 ID 数量
     */
    private String productId;
    private Integer productQuantity;

    public CartDTO(String productId, Integer productPrice) {
        this.productId = productId;
        this.productQuantity = productPrice;
    }
}
