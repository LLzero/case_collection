package com.casecollection.backend.framework.exception;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.List;

/**
 * 业务异常类
 * @Create_by Ranger
 * @Create_Date 2015年6月26日下午5:34:56
 */
public class BusinessException extends RuntimeException {

	private static final long serialVersionUID = -8013200853461709878L;
	private int errCode;

	private String[] params;

	private String message;


	/**
	 * 
	 */
	public BusinessException() {

	}

    public BusinessException(String message, Throwable cause) {
        super(message, cause);
    }
    public BusinessException(int errCode, String message, Throwable cause) {
        super(message, cause);
        this.errCode =errCode;
    }
	public BusinessException(int errCode) {
		this.errCode = errCode;
		if (message == null) {
			this.message = errCode+"";
		}
	}
	public BusinessException(String message) {
		this.message=message;
	}
	public BusinessException(int errCode, List<String> params) {
		this.errCode = errCode;
		this.params = (String[]) params.toArray();
		if (message == null) {
			this.message = errCode+"";
		}
	}

	public BusinessException(int errCode, String... params) {
		this.errCode = errCode;
		this.params = params;
		if (message == null) {
			this.message = errCode+"";
		}
	}

	public int getErrCode() {
		return errCode;
	}

	public void setErrCode(int errCode) {
		this.errCode = errCode;
		if (message == null) {
			this.message = errCode+"";
		}
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String[] getParams() {
		return params;
	}

	public void setParams(String[] params) {
		this.params = params;
	}
	public static String getStackTrace(Throwable t)
	{
		StringWriter sw = new StringWriter();
		PrintWriter pw = new PrintWriter(sw, true);
		t.printStackTrace(pw);
		pw.flush();
		sw.flush();
		return sw.toString();
	}
	
	@Override
	public synchronized Throwable fillInStackTrace() {
	    return null;
	}
}