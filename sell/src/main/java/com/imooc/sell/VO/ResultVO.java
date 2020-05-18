package com.imooc.sell.VO;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.io.Serializable;

/**
 * http请求返回的最外层对象
 * @author Administrator
 */
@Data
//@JsonInclude(JsonInclude.Include.NON_NULL) 配置文件 全局控制
public class ResultVO< T > implements Serializable {

    private static final long serialVersionUID = 8848731630266574133L;
    /**
     * 错误码
     */
    private Integer code;
    /**
     * 提示信息
     */
    private String msg;
    /**
     * 返回的具体内容
     */
    private T data;

}
