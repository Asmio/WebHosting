package by.bntu.hosting.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import by.bntu.hosting.model.User;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @ModelAttribute
    private User createNewUser() {
	return new User();
    }

    @RequestMapping(value = "/")
    public String home() {
	return "home";
    }

}
