package by.bntu.hosting.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.security.Principal;
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
import by.bntu.hosting.model.Video;
import by.bntu.hosting.service.VideoService;

@Controller
public class UploadController {

    private static final String SERVERHOME_NAME = "catalina.home";

    @Autowired
    MessageSource messageSource;

    @Autowired
    VideoService videoService;

    UploadedFile uploadedFile = null;

    @RequestMapping(value = "/uploadpage", method = RequestMethod.GET)
    public String getUploadPage() {
	return "upload";
    }

    @RequestMapping(value = "/download", method = RequestMethod.POST, produces = { "text/html; charset=UTF-8" })
    public @ResponseBody String upload(MultipartHttpServletRequest request, HttpServletResponse response, Locale locale,
	    Principal user) {

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
		addVideoDB(uploadedFile.getFileName(), user.getName());
	    } catch (Exception e) {
		e.printStackTrace();
		return messageSource.getMessage("upload.file.error", null, locale);
	    }
	}
	return messageSource.getMessage("upload.file", null, locale) + " '" + uploadedFile.getFileName() + "' "
		+ messageSource.getMessage("upload.file.success", null, locale);

    }

    public void addVideoDB(String videoName, String userName) {
	Video video = new Video(videoName, userName);
	videoService.addVideo(video);
    }
}
