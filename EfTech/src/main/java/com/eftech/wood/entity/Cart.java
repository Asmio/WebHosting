package com.eftech.wood.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * The persistent class for the cart database table.
 * 
 */
@Entity
@Table(name = "cart")
public class Cart implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "Id")
    private int id;

    @Column(name = "Count_product")
    private int count_product;

    @Column(name = "Product")
    private String product;

    @Column(name = "Product_ID")
    private String product_ID;

    @Column(name = "Username")
    private String username;

    public Cart() {
    }

    public Cart(String username, String product, String product_ID, int count_product) {
	this.username = username;
	this.product = product;
	this.product_ID = product_ID;
	this.count_product = count_product;
    }

    public int getId() {
	return this.id;
    }

    public void setId(int id) {
	this.id = id;
    }

    public int getCount_product() {
	return this.count_product;
    }

    public void setCount_product(int count_product) {
	this.count_product = count_product;
    }

    public String getProduct() {
	return this.product;
    }

    public void setProduct(String product) {
	this.product = product;
    }

    public String getProduct_ID() {
	return this.product_ID;
    }

    public void setProduct_ID(String product_ID) {
	this.product_ID = product_ID;
    }

    public String getUsername() {
	return this.username;
    }

    public void setUsername(String username) {
	this.username = username;
    }

}