package by.bntu.hosting.controller;

import java.io.File;
import java.net.URLDecoder;
import java.security.Principal;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import by.bntu.hosting.model.Search;
import by.bntu.hosting.model.User;
import by.bntu.hosting.model.Video;
import by.bntu.hosting.service.UserService;
import by.bntu.hosting.service.VideoService;
import by.bntu.hosting.utils.EditVideoName;
import by.bntu.hosting.utils.ManagementResourses;

@Controller
@RequestMapping(value = "user")
public class UserController {

    private static final String DIR_VIDEO_KEY = "download.dir.video";
    private static final String DIR_IMAGE_KEY = "download.dir.image";
    private static final String MP4_KEY = "video.type.mp4";
    private static final String PNG_KEY = "image.type.png";

    @Autowired
    VideoService videoService;

    @Autowired
    UserService userService;

    @Autowired
    MessageSource messageSource;

    @ModelAttribute
    private Search createNewSearch() {
	return new Search();
    }

    @RequestMapping(value = "{userName:.+}", method = RequestMethod.GET)
    public ModelAndView accessDenied(@PathVariable String userName) {
	ModelAndView model = new ModelAndView();
	model.setViewName("user");
	User user = userService.getUser(userName);
	List<Video> list = videoService.listVideo(user.getUsername());
	model.addObject("user", user);
	model.addObject("videoListSize", list.size());
	model.addObject("videoList", list);
	return model;
    }

    @RequestMapping(value = "addUserDescription", method = RequestMethod.GET)
    @ResponseBody
    public String addUserDescription(@RequestParam String description, Principal user) {
	try {
	    description = URLDecoder.decode(description);
	    description = description.trim();
	    userService.updateDescription(description, user.getName());
	    return "true";
	} catch (Exception e) {
	    e.printStackTrace();
	    return "false";
	}
    }

    @RequestMapping(value = "blockUser", method = RequestMethod.GET, produces = { "text/html; charset=UTF-8" })
    @ResponseBody
    public String blockUser(@RequestParam("username") String username, @RequestParam("enabled") int enabled,
	    Principal user, Locale locale) {
	if (user.getName().equals("admin")) {
	    if (enabled == 1) {
		userService.updateResolve(URLDecoder.decode(username), 0);
		return messageSource.getMessage("user.releaseButton", null, locale);
	    } else {
		userService.updateResolve(URLDecoder.decode(username), 1);
		return messageSource.getMessage("user.blockButton", null, locale);
	    }
	} else {
	    return null;
	}
    }

    @RequestMapping(value = "addVideoDescription", method = RequestMethod.GET)
    @ResponseBody
    public String addVideoDescription(@RequestParam("description") String description, @RequestParam("id") Long id) {
	try {
	    description = URLDecoder.decode(description);
	    description = description.trim();
	    videoService.updateDescription(description, id);
	    return "true";
	} catch (Exception e) {
	    e.printStackTrace();
	    return "false";
	}
    }

    @RequestMapping(value = "setVideoName", method = RequestMethod.GET)
    @ResponseBody
    public String setVideoName(@RequestParam("nameVideo") String nameVideo, @RequestParam("id") Long id) {
	try {
	    nameVideo = URLDecoder.decode(nameVideo);
	    nameVideo = nameVideo.trim();
	    Video video = videoService.getVideo(id);

	    File fileVideo = new File(ManagementResourses.getPath(DIR_VIDEO_KEY) + File.separator
		    + EditVideoName.setType(video.getName(), MP4_KEY));
	    File newFileVideo = new File(ManagementResourses.getPath(DIR_VIDEO_KEY) + File.separator
		    + EditVideoName.setType(nameVideo, MP4_KEY));
	    fileVideo.renameTo(newFileVideo);

	    File fileImage = new File(ManagementResourses.getPath(DIR_IMAGE_KEY) + File.separator
		    + EditVideoName.setType(video.getName(), PNG_KEY));
	    File newFileImage = new File(ManagementResourses.getPath(DIR_IMAGE_KEY) + File.separator
		    + EditVideoName.setType(nameVideo, PNG_KEY));
	    fileImage.renameTo(newFileImage);

	    videoService.updateName(nameVideo, id);
	    return "true";
	} catch (Exception e) {
	    e.printStackTrace();
	    return "false";
	}
    }

}
