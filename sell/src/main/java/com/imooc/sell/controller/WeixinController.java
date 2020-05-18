package com.imooc.sell.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@RequestMapping("/weixin")
@Slf4j
public class WeixinController {

    @GetMapping("/auth")
    public void auth(@RequestParam("code") String code){
        log.info("进入auth方法...");
        log.info(code);
        String url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=wx660f702dd52f07cc&secret=01f5a515d74f77ba7995ec237b631d03&code="+code+"&grant_type=authorization_code";
        RestTemplate template = new RestTemplate();
        String response = template.getForObject(url, String.class);
        log.info("response = {}",response);

    }

}
