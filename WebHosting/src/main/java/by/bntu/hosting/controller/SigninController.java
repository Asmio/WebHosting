package by.bntu.hosting.controller;

import java.io.UnsupportedEncodingException;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import by.bntu.hosting.model.Search;
import by.bntu.hosting.model.User;

@Controller
public class SigninController {

    @ModelAttribute
    private User createNewUser() {
	return new User();
    }

    @ModelAttribute
    private Search createNewSearch() {
	return new Search();
    }

    @RequestMapping(value = "/signin")
    public String signin() {
	return "login";
    }

    @RequestMapping(value = "/check-user", method = RequestMethod.POST)
    public String checkUser(@ModelAttribute("user") User user, BindingResult bindingResult,
	    RedirectAttributes redirectAttributes) throws UnsupportedEncodingException {
	if (bindingResult.hasErrors()) {
	    redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.user", bindingResult);
	    redirectAttributes.addFlashAttribute("user", user);
	    return "redirect:/";
	}
	return "redirect:/mainpage";
    }
}
