package com.eftech.wood.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eftech.wood.entity.EmailRecipient;
import com.eftech.wood.repository.EmailRecipientRepository;
import com.eftech.wood.service.EmailRecipientService;

@Service
@Transactional
@Component
public class EmailRecipientServiceImpl implements EmailRecipientService {

    @Autowired
    EmailRecipientRepository emailRecipientRepository;

    @Override
    public List<EmailRecipient> findAll() {
	return emailRecipientRepository.findAll();
    }

    @Override
    public EmailRecipient findOne(String email) {
	return emailRecipientRepository.findOneByEmail(email);
    }

    @Override
    public EmailRecipient save(EmailRecipient emailRecipient) {
	return emailRecipientRepository.saveAndFlush(emailRecipient);
    }

}
