package com.eftech.wood.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * The persistent class for the actions database table.
 * 
 */
@Entity
@Table(name = "actions")
public class Actions implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    private int idaction;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "date_action")
    private Date dateAction;

    private String username;

    @Column(name = "what_is_done")
    private String whatIsDone;

    public Actions() {
    }

    public Actions(String username, String whatIsDone) {
	this.username = username;
	this.whatIsDone = whatIsDone;
    }

    public int getIdaction() {
	return this.idaction;
    }

    public void setIdaction(int idaction) {
	this.idaction = idaction;
    }

    public Date getDateAction() {
	return this.dateAction;
    }

    public void setDateAction(Date dateAction) {
	this.dateAction = dateAction;
    }

    public String getUsername() {
	return this.username;
    }

    public void setUsername(String username) {
	this.username = username;
    }

    public String getWhatIsDone() {
	return this.whatIsDone;
    }

    public void setWhatIsDone(String whatIsDone) {
	this.whatIsDone = whatIsDone;
    }

}