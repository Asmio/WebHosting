package com.eftech.wood.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * The persistent class for the email_recipient database table.
 * 
 */
@Entity
@Table(name = "email_recipient")
public class EmailRecipient implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id_email_recipient")
    private int idEmailRecipient;

    private String email;

    public EmailRecipient() {
    }

    public int getIdEmailRecipient() {
	return this.idEmailRecipient;
    }

    public void setIdEmailRecipient(int idEmailRecipient) {
	this.idEmailRecipient = idEmailRecipient;
    }

    public String getEmail() {
	return this.email;
    }

    public void setEmail(String email) {
	this.email = email;
    }

}