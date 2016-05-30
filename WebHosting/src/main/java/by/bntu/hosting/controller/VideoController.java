package by.bntu.hosting.controller;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.security.Principal;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import by.bntu.hosting.model.Comment;
import by.bntu.hosting.model.Search;
import by.bntu.hosting.model.Video;
import by.bntu.hosting.service.VideoService;
import by.bntu.hosting.utils.EditVideoName;
import by.bntu.hosting.utils.ManagementResourses;

@Controller
public class VideoController {

    private static final String DIR_VIDEO_KEY = "download.dir.video";
    private static final String DIR_IMAGE_KEY = "download.dir.image";
    private static final String MP4_KEY = "video.type.mp4";
    private static final String PNG_KEY = "image.type.png";
    private static final String FILE_MAX_SIZE_KEY = "video.size.max";

    @Autowired
    VideoService videoService;

    @Autowired
    MessageSource messageSource;

    @ModelAttribute
    private Search createNewSearch() {
	return new Search();
    }

    @RequestMapping(value = "/video/{id}", method = RequestMethod.GET)
    public ModelAndView getVideoPage(@PathVariable Long id) {
	ModelAndView model = new ModelAndView();
	model.setViewName("video");
	Video video = videoService.getVideo(id);
	model.addObject("video", video);
	List<Comment> comments = videoService.listComments(id);
	model.addObject("comments", comments);
	List<Video> list = videoService.listVideo(video.getUsername(), 0, 4);
	model.addObject("videoList", list);
	return model;
    }

    @RequestMapping(value = "/video/addComment", method = RequestMethod.GET)
    public @ResponseBody List<Comment> addComment(@RequestParam("comment") String value, @RequestParam("id") Long id,
	    Principal user) {
	try {
	    value = URLDecoder.decode(value).trim();
	    Comment comment = new Comment(value, id, user.getName());
	    videoService.addComment(comment);
	    List<Comment> comments = videoService.listComments(id);
	    return comments;
	} catch (Exception e) {
	    e.printStackTrace();
	    return null;
	}
    }

    @RequestMapping(value = "/video/deleteComment", method = RequestMethod.GET)
    public @ResponseBody boolean deleteComment(@RequestParam("id") Long id) {
	try {
	    if (videoService.removeComment(id)) {
		return true;
	    } else {
		return false;
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	    return false;
	}
    }

    @RequestMapping(value = "user/deleteVideo", method = RequestMethod.GET, produces = { "text/html; charset=UTF-8" })
    @ResponseBody
    public String deleteVideo(@RequestParam Long idVideo, Locale locale) {
	try {
	    Video video = videoService.getVideo(idVideo);
	    if (videoService.removeVideo(idVideo)) {
		String pathFileVideo = ManagementResourses.getPath(DIR_VIDEO_KEY) + File.separator
			+ EditVideoName.setType(video.getName(), MP4_KEY);
		String pathFileImage = ManagementResourses.getPath(DIR_IMAGE_KEY) + File.separator
			+ EditVideoName.setType(video.getName(), PNG_KEY);
		File fileVideo = new File(pathFileVideo);
		File fileImage = new File(pathFileImage);
		fileVideo.delete();
		fileImage.delete();
		return "true";
	    } else {
		return messageSource.getMessage("user.video.delete.error", null, locale);
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	    return messageSource.getMessage("user.video.delete.error", null, locale);
	}

    }

    @RequestMapping(value = "/download/video/{id}", method = RequestMethod.GET)
    public void getVideo(@PathVariable Long id, HttpServletRequest request, HttpServletResponse response)
	    throws IOException {

	String videoPath = ManagementResourses.getPath(DIR_VIDEO_KEY);

	if (id == null) {
	    response.sendError(HttpServletResponse.SC_NOT_FOUND);
	    return;
	}

	File file = new File(videoPath, EditVideoName.setType(videoService.getVideo(id).getName(), MP4_KEY));

	if (!file.exists()) {
	    response.sendError(HttpServletResponse.SC_NOT_FOUND);
	    return;
	}

	String contentType = "video/mp4";

	if (contentType == null || !contentType.startsWith("video")) {
	    response.sendError(HttpServletResponse.SC_NOT_FOUND);
	    return;
	}

	response.reset();
	response.setContentType(contentType);
	response.setHeader("Content-Length", String.valueOf(file.length()));

	Files.copy(file.toPath(), response.getOutputStream());
    }

    @RequestMapping(value = "/download/image", method = RequestMethod.GET)
    public ResponseEntity<byte[]> getImage(@RequestParam("fileId") Long fileId) throws IOException {
	Video video = videoService.getVideo(fileId);
	String pathFile = ManagementResourses.getPath(DIR_IMAGE_KEY) + File.separator
		+ EditVideoName.setType(video.getName(), PNG_KEY);
	ByteArrayOutputStream out = null;
	InputStream input = null;
	try {
	    out = new ByteArrayOutputStream();
	    input = new BufferedInputStream(new FileInputStream(pathFile));
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
    public String checkVideo(@RequestParam("nameVideo") String nameVideo, @RequestParam("fileSize") String fileSize,
	    Locale locale) {

	String decodeName = URLDecoder.decode(nameVideo);
	Video video = videoService.getVideo(EditVideoName.editName(decodeName));
	if (video != null) {
	    return "error/" + messageSource.getMessage("upload.file", null, locale) + " " + decodeName + " "
		    + messageSource.getMessage("upload.file.error.exist", null, locale);
	} else {
	    String asd = EditVideoName.getType(decodeName);
	    if (!asd.equals(ManagementResourses.getValue("video.type.mp4"))) {
		return "error/" + messageSource.getMessage("upload.file", null, locale) + " " + decodeName + " "
			+ messageSource.getMessage("upload.file.error.wrongFormat", null, locale);
	    }
	}
	if (Integer.parseInt(fileSize) > Integer.parseInt(ManagementResourses.getValue(FILE_MAX_SIZE_KEY))) {
	    return "error/" + messageSource.getMessage("upload.file", null, locale) + " " + decodeName + " "
		    + messageSource.getMessage("upload.file.error.size", null, locale);
	}
	return "ok/" + messageSource.getMessage("upload.file.processing", null, locale);

    }
}
