package com.imooc.sell.config;


import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import javax.net.ssl.SSLContext;
import java.util.Map;

@Data
@Component
@ConfigurationProperties(prefix = "wechat")
public class WechatAccountConfig {

    /**
     * 公众平台id
     */
    private String mpAppId;
    /**
     * 公众平台密匙
     */
    private String mpAppSecret;
    /**
     * 开放平台id
     */
    private String openAppId;
    /**
     * 开放平台密匙
     */
    private String openAppSecret;


    /**
     * 商户号
     */
    private String mchId;
    /**
     * 商户秘钥
     */
    private String mchKey;
    /**
     * 商户证书路径
     */
    private String mchPath;
    /**
     * 异步通知
     */
    private String notifyUrl;

    private SSLContext sslContext;

    /**
     * 微信模板ID*/

    private Map<String , String> templateId;


}
