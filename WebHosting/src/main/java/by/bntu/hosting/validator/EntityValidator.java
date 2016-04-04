package by.bntu.hosting.validator;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;

public class EntityValidator {

    @Autowired
    private MessageSource messageSource;
    private Locale locale;

    public void setLocale(Locale locale) {
	this.locale = locale;
    }

    public Locale getLocale() {
	return locale;
    }

}
