package by.bntu.hosting.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.security.Principal;
import java.util.Locale;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import by.bntu.hosting.model.Search;
import by.bntu.hosting.model.User;
import by.bntu.hosting.service.UserService;
import by.bntu.hosting.utils.MDPasswordEncoder;
import by.bntu.hosting.utils.Sender;

@Controller
public class LoginController {

    @ModelAttribute
    private User createNewUser() {
	return new User();
    }

    @Autowired
    UserService userService;

    @Autowired
    MessageSource messageSource;

    @ModelAttribute
    private Search createNewSearch() {
	return new Search();
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(@RequestParam(value = "error", required = false) String error, Locale locale) {
	ModelAndView model = new ModelAndView();
	if (error != null) {
	    model.addObject("error", messageSource.getMessage("logAndReg.login.errors.incorrect", null, locale));
	}
	model.setViewName("login");

	return model;
    }

    @RequestMapping(value = "/restorePassword", method = RequestMethod.GET, produces = { "text/html; charset=UTF-8" })
    public @ResponseBody String restorePassword(@RequestParam("username") String username, Locale locale) {
	username = URLDecoder.decode(username);
	try {
	    User user = userService.getUser(username);
	    if (user != null) {
		if (user.getEnabled() == 0) {
		    return messageSource.getMessage("logAndReg.restore.userBlocked", null, locale);
		}
		String alphabet = "0123456789qwertyuiopasdfghjklzxcvbnmWERTYUIOPASDFGHJKLZXCVBNM";
		Random random = new Random();
		String password = "";
		for (int i = 0; i < 8; i++) {
		    password = password + alphabet.charAt(random.nextInt(alphabet.length()));
		}
		Sender sender = new Sender("webhosting003@gmail.com", "webhosting1q2w3e");
		sender.send(messageSource.getMessage("logAndReg.restore.theme", null, locale),
			messageSource.getMessage("logAndReg.restore.theme", null, locale) + ": " + password, username);
		MDPasswordEncoder encoder = new MDPasswordEncoder();
		password = encoder.encodeMD5(password);
		userService.updatePassword(password, username);
		return messageSource.getMessage("logAndReg.restore.newPasswordSend", null, locale);
	    } else {
		return messageSource.getMessage("logAndReg.restore.userNotFound", null, locale);
	    }

	} catch (Exception e) {
	    return messageSource.getMessage("logAndReg.restore.error", null, locale);
	}

    }

    @RequestMapping(value = "/password/change", method = RequestMethod.GET)
    public String getPageChangePassword() {
	return "changePassword";
    }

    @RequestMapping(value = "/password/changePassword", method = RequestMethod.GET, produces = {
	    "text/html; charset=UTF-8" })
    public @ResponseBody String changePassword(@RequestParam(value = "currentPas") String currentPas,
	    @RequestParam(value = "newPas") String newPas, @RequestParam(value = "repeatPas") String repeatPas,
	    Locale locale, Principal principalUser) throws UnsupportedEncodingException {
	MDPasswordEncoder encoder = new MDPasswordEncoder();
	currentPas = encoder.encodeMD5(currentPas);
	newPas = encoder.encodeMD5(newPas);
	repeatPas = encoder.encodeMD5(repeatPas);

	User user = userService.getUser(principalUser.getName());
	if (user.getPassword().equals(currentPas)) {
	    if (!currentPas.equals(newPas)) {
		if (newPas.equals(repeatPas)) {
		    userService.updatePassword(newPas, user.getUsername());
		    return messageSource.getMessage("changePassword.success", null, locale);
		} else {
		    return messageSource.getMessage("changePassword.dontMatch", null, locale);
		}
	    } else {
		return messageSource.getMessage("changePassword.passwordsSame", null, locale);
	    }
	} else {
	    return messageSource.getMessage("changePassword.incorrectPassword", null, locale);
	}
    }

}
