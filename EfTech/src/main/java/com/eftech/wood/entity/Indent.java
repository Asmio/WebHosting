package com.eftech.wood.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * The persistent class for the indent database table.
 * 
 */
@Entity
@Table(name = "indent")
public class Indent implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    private int idorder;

    private String address;

    @Column(name = "contents_order")
    private String contentsOrder;

    @Column(name = "fio_customer")
    private String fioCustomer;

    @Column(name = "phone_customer")
    private String phoneCustomer;

    private String status;

    @Column(name = "took_order")
    private String tookOrder;

    @Column(name = "date_order")
    private String dateOrder;

    public Indent() {
    }

    public int getIdorder() {
	return this.idorder;
    }

    public void setIdorder(int idorder) {
	this.idorder = idorder;
    }

    public String getAddress() {
	return this.address;
    }

    public void setAddress(String address) {
	this.address = address;
    }

    public String getContentsOrder() {
	return this.contentsOrder;
    }

    public void setContentsOrder(String contentsOrder) {
	this.contentsOrder = contentsOrder;
    }

    public String getFioCustomer() {
	return this.fioCustomer;
    }

    public void setFioCustomer(String fioCustomer) {
	this.fioCustomer = fioCustomer;
    }

    public String getPhoneCustomer() {
	return this.phoneCustomer;
    }

    public void setPhoneCustomer(String phoneCustomer) {
	this.phoneCustomer = phoneCustomer;
    }

    public String getStatus() {
	return this.status;
    }

    public void setStatus(String status) {
	this.status = status;
    }

    public String getTookOrder() {
	return this.tookOrder;
    }

    public void setTookOrder(String tookOrder) {
	this.tookOrder = tookOrder;
    }

    public String getDateOrder() {
	return dateOrder;
    }

    public void setDateOrder(String dateOrder) {
	this.dateOrder = dateOrder;
    }

}