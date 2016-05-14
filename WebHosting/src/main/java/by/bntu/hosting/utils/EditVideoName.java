package by.bntu.hosting.utils;

public class EditVideoName {

    public static String editName(String fileName) {
	return fileName.substring(0, fileName.lastIndexOf("."));
    }

    public static String getType(String fileName) {
	return fileName.substring(fileName.lastIndexOf(".") + 1);
    }

    public static String getName(String fileURL) {
	return fileURL.substring(fileURL.lastIndexOf("/") + 1);
    }

    public static String updateName(String oldName, String newName) {
	String type = "." + EditVideoName.getType(oldName);
	return newName + type;
    }

}
