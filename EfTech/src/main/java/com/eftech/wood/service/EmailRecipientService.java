package com.eftech.wood.service;

import java.util.List;

import com.eftech.wood.entity.EmailRecipient;

public interface EmailRecipientService {

    public List<EmailRecipient> findAll();

    public EmailRecipient findOne(String email);

    public EmailRecipient save(EmailRecipient emailRecipient);
}
