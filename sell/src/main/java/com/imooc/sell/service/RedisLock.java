package com.imooc.sell.service;

import lombok.extern.slf4j.Slf4j;
import org.simpleframework.xml.core.Commit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

/**
 * @author Administrator
 */
@Component
@Slf4j
public class RedisLock {

    @Autowired
    private StringRedisTemplate redisTemplate;

    /**
     * @param key  productId
     * @param value 当前时间 + 超时时间
     * @return
     */
    public boolean lock(String key, String value){

        if (redisTemplate.opsForValue().setIfAbsent(key, value)){
            return true;
        }
        /**
         * 设置不进去，查下Redis的值是否过期
         * 先查下当前的value
         */
        String currentValue = redisTemplate.opsForValue().get(key);
        /**
         * 如果锁过期，先查旧的value并设置新的值（getAndSet），判断旧值
         * 是否为空 .equals为高并发考虑
         */
        if (!StringUtils.isEmpty(currentValue) && Long.parseLong(currentValue) < System.currentTimeMillis()){
            String oldValue = redisTemplate.opsForValue().getAndSet(key, value);
            if (!StringUtils.isEmpty(oldValue) && oldValue.equals(currentValue)){
                return true;
            }
        }
        return false;

    }

    /**
     * 解锁
     */
    public void unlock(String key , String value){

        try {
            String currentValue = redisTemplate.opsForValue().get(key);
            if (StringUtils.isEmpty(currentValue) && currentValue.equals(value)){
                redisTemplate.opsForValue().getOperations().delete(key);
            }
        } catch (Exception e) {
            log.error("[Redis分布式锁] 解锁异常,{}",e);
        }

    }

}
