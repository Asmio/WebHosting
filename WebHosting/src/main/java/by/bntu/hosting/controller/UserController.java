package by.bntu.hosting.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import by.bntu.hosting.model.Video;
import by.bntu.hosting.service.VideoService;

@Controller
public class UserController {

    @Autowired
    VideoService videoService;

    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public ModelAndView accessDenied(Principal user) {
	ModelAndView model = new ModelAndView();
	model.setViewName("user");
	List<Video> list = videoService.listVideo(user.getName());
	model.addObject("videoListSize", list.size());
	model.addObject("videoList", list);
	return model;
    }

}
