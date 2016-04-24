package by.bntu.hosting.controller;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLDecoder;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import by.bntu.hosting.model.Video;
import by.bntu.hosting.service.VideoService;
import by.bntu.hosting.utils.EditVideoName;

@Controller
public class VideoController {

    private static final String SERVERHOME_NAME = "catalina.home";
    private static final String DOWNLOAD_DIR = "hostingDownload";
    private static final String DOWNLOAD_DIR_V = "video";
    private static final String DOWNLOAD_DIR_I = "image";
    private static final String VIDEO_TYPE_MP4 = "mp4";

    @Autowired
    VideoService videoService;

    @Autowired
    MessageSource messageSource;

    @RequestMapping(value = "/getVideo", method = RequestMethod.GET)
    public ModelAndView getVideoPage(@RequestParam("id") Long id) {
	ModelAndView model = new ModelAndView();
	model.setViewName("video");
	model.addObject("video", videoService.getVideo(id));
	return model;
    }

    @RequestMapping(value = "/download/video", method = RequestMethod.GET)
    public ResponseEntity<byte[]> getVideo(@RequestParam("fileId") Long fileId) throws IOException {
	Video video = videoService.getVideo(fileId);
	String filename = video.getName();
	String rootPath = System.getProperty(SERVERHOME_NAME) + File.separator + DOWNLOAD_DIR + File.separator
		+ DOWNLOAD_DIR_V;
	ByteArrayOutputStream out = null;
	InputStream input = null;
	try {
	    out = new ByteArrayOutputStream();
	    input = new BufferedInputStream(new FileInputStream(rootPath + File.separator + filename));
	    int data = 0;
	    while ((data = input.read()) != -1) {
		out.write(data);
	    }
	} finally {
	    if (null != input) {
		input.close();
	    }
	    if (null != out) {
		out.close();
	    }
	}
	byte[] bytes = out.toByteArray();

	final HttpHeaders headers = new HttpHeaders();
	headers.setContentType(MediaType.MULTIPART_FORM_DATA);
	return new ResponseEntity<byte[]>(bytes, headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/download/image", method = RequestMethod.GET)
    public ResponseEntity<byte[]> getImage(@RequestParam("fileId") Long fileId) throws IOException {
	Video video = videoService.getVideo(fileId);
	String filename = EditVideoName.editName(video.getName()) + ".png";
	String rootPath = System.getProperty(SERVERHOME_NAME) + File.separator + DOWNLOAD_DIR + File.separator
		+ DOWNLOAD_DIR_I;
	ByteArrayOutputStream out = null;
	InputStream input = null;
	try {
	    out = new ByteArrayOutputStream();
	    input = new BufferedInputStream(new FileInputStream(rootPath + File.separator + filename));
	    int data = 0;
	    while ((data = input.read()) != -1) {
		out.write(data);
	    }
	} finally {
	    if (null != input) {
		input.close();
	    }
	    if (null != out) {
		out.close();
	    }
	}
	byte[] bytes = out.toByteArray();

	final HttpHeaders headers = new HttpHeaders();
	headers.setContentType(MediaType.IMAGE_PNG);
	return new ResponseEntity<byte[]>(bytes, headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/checkVideo", method = RequestMethod.GET, produces = { "text/html; charset=UTF-8" })
    @ResponseBody
    public String checkVideo(@RequestParam String nameVideo, Locale locale) {

	String decodeName = URLDecoder.decode(nameVideo);
	Video video = videoService.getVideo(decodeName);
	if (video != null) {
	    return "error/" + messageSource.getMessage("upload.file", null, locale) + " " + decodeName + " "
		    + messageSource.getMessage("upload.file.error.exist", null, locale);
	} else {
	    String asd = EditVideoName.getType(decodeName);
	    if (!asd.equals(VIDEO_TYPE_MP4)) {
		return "error/" + messageSource.getMessage("upload.file", null, locale) + " " + decodeName + " "
			+ messageSource.getMessage("upload.file.error.wrongFormat", null, locale);
	    }
	}
	return "ok/" + messageSource.getMessage("upload.file.processing", null, locale);

    }
}
