package by.bntu.hosting.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.security.crypto.password.PasswordEncoder;

public class MDPasswordEncoder implements PasswordEncoder {

    private MessageDigest md;

    public MDPasswordEncoder() {
	try {
	    md = MessageDigest.getInstance("MD5");
	} catch (NoSuchAlgorithmException e) {
	    e.printStackTrace();
	}
    }

    public String encodeMD5(String password) {

	md.update(password.getBytes());
	byte byteDate[] = md.digest();
	StringBuffer hexString = new StringBuffer();

	for (int i = 0; i < byteDate.length; i++) {
	    String hex = Integer.toHexString(0xff & byteDate[i]);
	    if (hex.length() == 1) {
		hexString.append('0');
	    }
	    hexString.append(hex);
	}
	return hexString.toString();
    }

    @Override
    public String encode(CharSequence rawPassword) {
	return this.encodeMD5(rawPassword.toString());
    }

    @Override
    public boolean matches(CharSequence rawPassword, String encodedPassword) {
	return this.encode(rawPassword).equals(encodedPassword);
    }

}
