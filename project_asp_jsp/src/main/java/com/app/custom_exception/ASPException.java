package com.app.custom_exception;

@SuppressWarnings("serial")
public class ASPException extends RuntimeException {

	public ASPException(String message) {
		super(message);
		System.out.println("-----in ASPException-----");
	}

}
