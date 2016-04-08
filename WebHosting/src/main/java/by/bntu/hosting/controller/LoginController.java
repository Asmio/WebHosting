package by.bntu.hosting.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import by.bntu.hosting.model.User;

@Controller
public class LoginController {

    @ModelAttribute
    private User createNewUser() {
	return new User();
    }

    @Autowired
    MessageSource messageSource;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(@RequestParam(value = "error", required = false) String error, Locale locale) {
	ModelAndView model = new ModelAndView();
	if (error != null) {
	    model.addObject("error", messageSource.getMessage("logAndReg.login.errors.incorrect", null, locale));
	}
	model.setViewName("login");

	return model;
    }

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public String test() {
	return "signup";
    }

}
