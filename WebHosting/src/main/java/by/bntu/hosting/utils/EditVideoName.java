package by.bntu.hosting.utils;

public class EditVideoName {

    public static String editName(String fileName) {
	return fileName.substring(0, fileName.lastIndexOf("."));
    }

    public static String getType(String fileName) {
	return fileName.substring(fileName.lastIndexOf(".") + 1);
    }
}
