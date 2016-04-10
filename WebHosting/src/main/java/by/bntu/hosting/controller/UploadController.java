package by.bntu.hosting.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import by.bntu.hosting.model.UploadedFile;

@Controller
public class UploadController {

    private static final String SERVERHOME_NAME = "catalina.home";

    @Autowired
    MessageSource messageSource;

    UploadedFile uploadedFile = null;

    @RequestMapping(value = "/uploadpage", method = RequestMethod.GET)
    public String getUploadPage() {
	return "upload";
    }

    @RequestMapping(value = "/download", method = RequestMethod.POST, produces = { "text/html; charset=UTF-8" })
    public @ResponseBody String upload(MultipartHttpServletRequest request, HttpServletResponse response,
	    Locale locale) {

	Iterator<String> itr = request.getFileNames();
	MultipartFile mpf = null;
	while (itr.hasNext()) {

	    mpf = request.getFile(itr.next());

	    uploadedFile = new UploadedFile();
	    uploadedFile.setFileName(mpf.getOriginalFilename());
	    uploadedFile.setFileSize(mpf.getSize() / 1024 + " Kb");
	    uploadedFile.setFileType(mpf.getContentType());
	    try {
		uploadedFile.setBytes(mpf.getBytes());

		String rootPath = System.getProperty(SERVERHOME_NAME);
		File dir = new File(rootPath + File.separator + "tmpFiles");

		if (!dir.exists()) {
		    dir.mkdirs();
		}

		FileCopyUtils.copy(mpf.getBytes(),
			new FileOutputStream(dir.getAbsolutePath() + File.separator + mpf.getOriginalFilename()));

	    } catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return messageSource.getMessage("upload.file.error", null, locale);
	    }
	}
	return messageSource.getMessage("upload.file", null, locale) + " '" + uploadedFile.getFileName() + "' "
		+ messageSource.getMessage("upload.file.success", null, locale);

    }
}
