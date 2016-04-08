package by.bntu.hosting.validator;

import java.util.Locale;

import org.apache.commons.validator.routines.EmailValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import by.bntu.hosting.controller.HomeController;
import by.bntu.hosting.model.User;
import by.bntu.hosting.service.UserService;

@Component
public class SignupValidator extends EntityValidator implements Validator {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @Autowired
    UserService userService;

    @Autowired
    MessageSource messageSource;

    private Locale locale;

    @Override
    public boolean supports(Class<?> aClass) {
	return User.class.isAssignableFrom(aClass);
    }

    @Override
    public void validate(Object target, Errors errors) {
	User user = (User) target;
	if (userService.getUser(user.getUsername()) != null) {
	    errors.rejectValue("username", "login.userExists",
		    messageSource.getMessage("logAndReg.registr.errors.login.userExists", null, locale));
	    return;
	}

	if (!EmailValidator.getInstance().isValid(user.getUsername())) {
	    errors.rejectValue("username", "login.notValid",
		    messageSource.getMessage("logAndReg.registr.errors.login.notValid", null, locale));
	    return;
	}

	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "password.empty",
		messageSource.getMessage("logAndReg.registr.errors.password.empty", null, locale));
	if (!(user.getPassword()).equals(user.getConfirmPassword())) {
	    errors.rejectValue("confirmPassword", "password.don'tMatch",
		    messageSource.getMessage("logAndReg.registr.errors.password.don'tMatch", null, locale));
	}
    }

}
