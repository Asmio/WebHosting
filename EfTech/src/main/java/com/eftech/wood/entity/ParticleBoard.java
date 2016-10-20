package com.eftech.wood.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * The persistent class for the `particle board` database table.
 * 
 */
@Entity
@Table(name = "particle_board")
public class ParticleBoard implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "Product_ID")
    private String product_ID;

    @Column(name = "Description_bench")
    private String description_bench;

    @Column(name = "Foto_1")
    private String foto_1;

    @Column(name = "Foto_2")
    private String foto_2;

    @Column(name = "Foto_3")
    private String foto_3;

    @Column(name = "Foto_4")
    private String foto_4;

    @Column(name = "Laminated")
    private int laminated;

    @Column(name = "Length")
    private int length;

    @Column(name = "Price")
    private int price;

    @Column(name = "Thickness")
    private int thickness;

    @Column(name = "Weight")
    private int weight;

    public ParticleBoard() {
    }

    public String getProduct_ID() {
	return this.product_ID;
    }

    public void setProduct_ID(String product_ID) {
	this.product_ID = product_ID;
    }

    public String getDescription_bench() {
	return this.description_bench;
    }

    public void setDescription_bench(String description_bench) {
	this.description_bench = description_bench;
    }

    public String getFoto_1() {
	return this.foto_1;
    }

    public void setFoto_1(String foto_1) {
	this.foto_1 = foto_1;
    }

    public String getFoto_2() {
	return this.foto_2;
    }

    public void setFoto_2(String foto_2) {
	this.foto_2 = foto_2;
    }

    public String getFoto_3() {
	return this.foto_3;
    }

    public void setFoto_3(String foto_3) {
	this.foto_3 = foto_3;
    }

    public String getFoto_4() {
	return this.foto_4;
    }

    public void setFoto_4(String foto_4) {
	this.foto_4 = foto_4;
    }

    public int getLaminated() {
	return this.laminated;
    }

    public void setLaminated(int laminated) {
	this.laminated = laminated;
    }

    public int getLength() {
	return this.length;
    }

    public void setLength(int length) {
	this.length = length;
    }

    public int getPrice() {
	return this.price;
    }

    public void setPrice(int price) {
	this.price = price;
    }

    public int getThickness() {
	return this.thickness;
    }

    public void setThickness(int thickness) {
	this.thickness = thickness;
    }

    public int getWeight() {
	return this.weight;
    }

    public void setWeight(int weight) {
	this.weight = weight;
    }

    @Override
    public String toString() {
	return "Particle Board '" + this.product_ID + "'";
    }

    public String getFullInfo() {
	return "Particle Board '" + this.product_ID + "', thickness: " + this.thickness + ", length: " + this.length
		+ ", weight: " + this.weight + ", laminated: " + this.laminated + ", foto: " + this.foto_1 + ","
		+ this.foto_2 + "," + this.foto_3 + "," + this.foto_4 + ", description bench: "
		+ this.description_bench;
    }

}