package by.bntu.hosting.controller;

import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import by.bntu.hosting.model.Search;
import by.bntu.hosting.model.Video;
import by.bntu.hosting.service.VideoService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @Autowired
    VideoService videoService;

    @ModelAttribute
    private Search createNewSearch() {
	return new Search();
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView home() {
	ModelAndView model = new ModelAndView();
	model.setViewName("home");
	List<Video> list = videoService.listVideo(0, 30);
	model.addObject("videoList", list);
	return model;
    }

    @RequestMapping(value = "/getVideoContent", method = RequestMethod.GET)
    public @ResponseBody List<Video> getVideoContent(@RequestParam("firstResult") Integer firstResult,
	    @RequestParam("maxResults") Integer maxResults) {

	List<Video> list = videoService.listVideo(firstResult, maxResults);
	return list;
    }

    @RequestMapping(value = "/webcam", method = RequestMethod.GET)
    public String webcamPage() {
	return "webcam";
    }

    @RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
    public String accessDenied(Principal user) {
	return "accessDenied";
    }

    @RequestMapping(value = { "/search", "/*/search" }, method = RequestMethod.GET)
    public ModelAndView search(@ModelAttribute("search") Search search) throws UnsupportedEncodingException {
	ModelAndView model = new ModelAndView();
	model.setViewName("search");
	String dataSearch = new String(search.getDataSearch().getBytes("ISO8859-1"), "UTF-8").trim();
	model.addObject("messageSearch", dataSearch);
	if (dataSearch.isEmpty()) {
	    return model;
	}
	List<Video> videoList = videoService.listVideoFromSearch(dataSearch);
	model.addObject(videoList);
	return model;
    }

}
