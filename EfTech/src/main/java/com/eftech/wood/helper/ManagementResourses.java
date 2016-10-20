package com.eftech.wood.helper;

import java.io.InputStream;
import java.util.Properties;

public class ManagementResourses {

    public static String getValue(String key) {
	String type = null;
	Properties property = new Properties();
	try {
	    ClassLoader classloader = Thread.currentThread().getContextClassLoader();
	    InputStream is = classloader.getResourceAsStream("config.properties");
	    property.load(is);
	    is.close();
	    type = property.getProperty(key);
	} catch (Exception e) {
	    e.printStackTrace();
	    return null;
	}
	return type;
    }

}
