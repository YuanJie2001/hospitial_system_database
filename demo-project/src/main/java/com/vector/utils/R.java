/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 * <p>
 * https://www.renren.io
 * <p>
 * 版权所有，侵权必究！
 */

package com.vector.utils;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Getter;
import lombok.Setter;

import java.io.Serial;
import java.io.Serializable;
/**
 * 返回数据
 *
 * @author Mark sunlightcs@gmail.com
 */

/**
 * 响应信息主体
 *
 * @author ruoyi
 */
@Getter
@Setter
@JsonInclude(JsonInclude.Include.NON_NULL)
public class R<T> implements Serializable{
    @Serial
    private static final long serialVersionUID = 1L;
    private Integer code;
    private String msg;
    private T data;

    public R() {
        this.code = 200;
        this.msg = "ok";
    }

    public static R okResult() {
        R result = new R();
        return result;
    }

    public static R okResult(Object data) {
        R result = setHttpCodeEnum(200, "ok");
        if (data != null) {
            result.setData(data);
        }
        return result;
    }

    public static R errorResult(int code, String msg) {
        R result = new R();
        return result.error(code, msg);
    }


    public static R errorResult(Integer code, String msg) {
        return setHttpCodeEnum(code, msg);
    }
    public static R errorResult(Object data) {
        R result = setHttpCodeEnum(500, "error");
        if (data != null) {
            result.setData(data);
        }
        return result;
    }

    public static R errorResult(String message) {
        return setHttpCodeEnum(500, message);
    }

    private static R setHttpCodeEnum(Integer code, String msg) {
        R result = new R();
        return result.ok(code, null, msg);
    }

    public R<?> error(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
        return this;
    }

    private R<?> ok(Integer code, T data, String msg) {
        this.code = code;
        this.data = data;
        this.msg = msg;
        return this;
    }
}
