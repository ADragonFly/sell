package com.imooc.sell;

import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class LoggerTest {

//    private static final Logger logger = LoggerFactory.getLogger(LoggerTest.class);

    @Test
    public void Test1(){
        /**
         *     public static final Level OFF;
         *     public static final Level FATAL;
         *     public static final Level ERROR;
         *     public static final Level WARN;
         *     public static final Level INFO;
         *     public static final Level DEBUG;
         *     public static final Level TRACE;
         *     public static final Level ALL;
         */
        String name = "imook";
        String password = "1234";
        log.info("info...");
        log.debug("debug...");
        log.error("error...");
        log.info("name:{},password:{}",name,password);


//        logger.debug("debug...");
//        logger.info("logger...");
//        logger.error("error...");


    }
}
