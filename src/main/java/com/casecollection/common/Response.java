package com.casecollection.common;

/**
 * 数据响应对象 
 * @author luqq
 * 2016-03-22
 * @param <T>
 */
public class Response<T> {

    public static final int OK_CODE = 0;

    public static final int ERROR_CODE = -1;

	private T data;

    private int retCode;

    private String msg;

    public Response(){

    }

    public Response(int retCode , String message, T t){
        this.retCode = retCode;
        this.msg = message;
        this.data = t;
    }

    public static <T> Response<T> getResponseOK(T t){
        return new Response<>(Response.OK_CODE, null ,t);
    }

    public static <T> Response<T> getResponseError(T t,String message){
        return new Response<>(Response.ERROR_CODE, message ,t);
    }

    public int getRetCode(){
        return retCode;
    }

    public void setRetCode(int retCode){
        this.retCode = retCode;
        
    }

    public T getData(){
        return data;
    }

    public void setData(T data){
        this.data = data;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
