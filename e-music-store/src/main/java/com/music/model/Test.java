package com.music.model;

import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class Test {
	public static void main(String[] args) {
		BCryptPasswordEncoder en = new BCryptPasswordEncoder(11);
		String encodedPassword = en.encode("admin");
		
		System.out.println((encodedPassword));
		
	}
}
