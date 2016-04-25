package by.bntu.hosting.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import by.bntu.hosting.model.User;
import by.bntu.hosting.model.Video;
import by.bntu.hosting.service.UserService;
import by.bntu.hosting.service.VideoService;
import by.bntu.hosting.utils.EditVideoName;

@Controller
public class UserController {

    @Autowired
    VideoService videoService;

    @Autowired
    UserService userService;

    @RequestMapping(value = "/user/{userName:.+}", method = RequestMethod.GET)
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

}
