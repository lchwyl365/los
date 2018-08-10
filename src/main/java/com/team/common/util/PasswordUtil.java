package com.team.common.util;

import org.springframework.util.DigestUtils;

public class PasswordUtil {

	public static void main(String[] args) {
		String md5 = DigestUtils.md5DigestAsHex("666888".getBytes());
		System.out.println(md5);
	}
}
