package by.bntu.hosting.utils;

import java.io.File;
import java.io.InputStream;
import java.util.Properties;

public class ManagementResourses {

    public static String getPath(String dirKey) {
	String dir = null;
	Properties property = new Properties();
	try {
	    ClassLoader classloader = Thread.currentThread().getContextClassLoader();
	    InputStream is = classloader.getResourceAsStream("config.properties");
	    property.load(is);
	    String serverhome = property.getProperty("serverhome");
	    dir = System.getProperty(serverhome) + File.separator + property.getProperty("download.dir")
		    + File.separator + property.getProperty(dirKey);
	} catch (Exception e) {
	    e.printStackTrace();
	    return null;
	}
	return dir;
    }

    public static String getValue(String key) {
	String type = null;
	Properties property = new Properties();
	try {
	    ClassLoader classloader = Thread.currentThread().getContextClassLoader();
	    InputStream is = classloader.getResourceAsStream("config.properties");
	    property.load(is);
	    type = property.getProperty(key);
	} catch (Exception e) {
	    e.printStackTrace();
	    return null;
	}
	return type;
    }
}
