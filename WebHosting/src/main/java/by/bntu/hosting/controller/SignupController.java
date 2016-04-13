package by.bntu.hosting.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import by.bntu.hosting.model.User;
import by.bntu.hosting.service.UserService;
import by.bntu.hosting.validator.SignupValidator;

@Controller
public class SignupController {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @Autowired
    SignupValidator signupValidator;

    @Autowired
    UserService userService;

    @ModelAttribute
    private User createNewUser() {
	return new User();
    }

    @RequestMapping(value = "/signup")
    public String signup() {
	return "signup";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String signup(@ModelAttribute("user") User user, BindingResult bindingResult, Locale locale,
	    RedirectAttributes redirectAttributes) {
	signupValidator.setLocale(locale);
	signupValidator.validate(user, bindingResult);
	if (bindingResult.hasErrors()) {
	    redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.user", bindingResult);
	    redirectAttributes.addFlashAttribute("user", user);
	    return "redirect:/signup";
	}
	userService.addUser(user);
	return "redirect:/";
    }

}
