package by.bntu.hosting.controller;

import java.security.Principal;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import by.bntu.hosting.model.Video;
import by.bntu.hosting.service.VideoService;
import by.bntu.hosting.utils.EditVideoName;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @Autowired
    VideoService videoService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView home() {
	ModelAndView model = new ModelAndView();
	model.setViewName("home");
	List<Video> list = videoService.listVideo();
	for (Video video : list) {
	    video.setName(EditVideoName.editName(video.getName()));
	}
	model.addObject("videoList", list);
	return model;
    }

    @RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
    public String accessDenied(Principal user) {
	return "accessDenied";
    }

}
