package com.imooc.sell.service;

import com.imooc.sell.dataobject.SellerInfo;

/**
 * 卖家端扫码登录service
 * @author Administrator
 */
public interface SellerService {

    SellerInfo findSellerInfoByOpenid(String openid);

}
