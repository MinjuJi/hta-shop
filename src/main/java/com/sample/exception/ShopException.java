package com.sample.exception;

public class ShopException extends RuntimeException{
	
	private static final long serialVersionUID = -949852503870116647L;
	
	public ShopException() {}
	
	public ShopException(String message) {
		super(message);
	}
	
	public ShopException(String message, Throwable cause) {
		super(message, cause);
	}
	
}
