package by.bntu.hosting.controller;

import java.io.File;
import java.net.URLDecoder;
import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import by.bntu.hosting.model.User;
import by.bntu.hosting.model.Video;
import by.bntu.hosting.service.UserService;
import by.bntu.hosting.service.VideoService;
import by.bntu.hosting.utils.EditVideoName;
import by.bntu.hosting.utils.ManagementResourses;

@Controller
@RequestMapping(value = "user")
public class UserController {

    @Autowired
    VideoService videoService;

    @Autowired
    UserService userService;

    @RequestMapping(value = "{userName:.+}", method = RequestMethod.GET)
    public ModelAndView accessDenied(@PathVariable String userName) {
	ModelAndView model = new ModelAndView();
	model.setViewName("user");
	User user = userService.getUser(userName);
	List<Video> list = videoService.listVideo(user.getUsername());
	for (Video video : list) {
	    video.setName(EditVideoName.editName(video.getName()));
	}
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
	    String newName = EditVideoName.updateName(video.getName(), nameVideo);

	    File fileVideo = new File(
		    ManagementResourses.getPath("download.dir.video") + File.separator + video.getName());
	    File newFileVideo = new File(ManagementResourses.getPath("download.dir.video") + File.separator + newName);
	    fileVideo.renameTo(newFileVideo);

	    File fileImage = new File(ManagementResourses.getPath("download.dir.image") + File.separator
		    + EditVideoName.editName(video.getName()) + "." + ManagementResourses.getValue("image.type.png"));
	    File newFileImage = new File(ManagementResourses.getPath("download.dir.image") + File.separator
		    + EditVideoName.editName(newName) + "." + ManagementResourses.getValue("image.type.png"));
	    fileImage.renameTo(newFileImage);

	    videoService.updateName(newName, id);
	    return "true";
	} catch (Exception e) {
	    e.printStackTrace();
	    return "false";
	}
    }

}
