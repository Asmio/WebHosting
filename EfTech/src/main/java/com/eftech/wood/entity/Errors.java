package com.eftech.wood.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * The persistent class for the errors database table.
 * 
 */
@Entity
@NamedQuery(name = "Errors.findAll", query = "SELECT e FROM Errors e")
public class Errors implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    private int iderrors;

    private String action;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "date_error")
    private Date dateError;

    @Column(name = "error_description")
    private String errorDescription;

    public Errors() {
    }

    public Errors(String action, String errorDescription) {
	this.action = action;
	this.errorDescription = errorDescription;
    }

    public int getIderrors() {
	return this.iderrors;
    }

    public void setIderrors(int iderrors) {
	this.iderrors = iderrors;
    }

    public String getAction() {
	return this.action;
    }

    public void setAction(String action) {
	this.action = action;
    }

    public Date getDateError() {
	return this.dateError;
    }

    public void setDateError(Date dateError) {
	this.dateError = dateError;
    }

    public String getErrorDescription() {
	return this.errorDescription;
    }

    public void setErrorDescription(String errorDescription) {
	this.errorDescription = errorDescription;
    }

}