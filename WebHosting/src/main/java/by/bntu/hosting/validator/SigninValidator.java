package by.bntu.hosting.validator;

import java.util.Locale;

import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import by.bntu.hosting.model.User;

@Component
public class SigninValidator extends EntityValidator implements Validator {
    
    private Locale locale;
    
    @Autowired
    MessageSource messageSource;

    @Override
    public boolean supports(Class<?> aClass) {
	return User.class.isAssignableFrom(aClass);
    }

    @Override
    public void validate(Object target, Errors errors) {
	User user = (User) target;

	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "login",
		messageSource.getMessage("logAndReg.registr.errors.login.empty", null, locale));
	if (!EmailValidator.getInstance().isValid(user.getLogin())) {
	    errors.rejectValue("login",
		    messageSource.getMessage("logAndReg.registr.errors.login.notValid", null, locale));
	}
	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password",
		messageSource.getMessage("logAndReg.registr.errors.password.empty", null, locale));
	if (!(user.getPassword()).equals(user.getConfirmPassword())) {
	    errors.rejectValue("confirmPassword",
		    messageSource.getMessage("logAndReg.registr.errors.password.don'tMatch", null, locale));
	}
    }

}
