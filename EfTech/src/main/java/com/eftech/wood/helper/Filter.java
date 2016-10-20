package com.eftech.wood.helper;

public class Filter {

    private String thickness;
    private String length;
    private String weight;
    private String laminated;
    private String price;
    private String water_resistance;
    private String sanded_or_unsanded;

    public Filter() {
    };

    public Filter(String thickness, String length, String weight, String price, String water_resistance,
	    String sanded_or_unsanded) {
	super();
	this.thickness = thickness;
	this.length = length;
	this.weight = weight;
	this.price = price;
	this.water_resistance = water_resistance;
	this.sanded_or_unsanded = sanded_or_unsanded;
    }

    public Filter(String thickness, String length, String weight, String laminated, String price) {
	super();
	this.thickness = thickness;
	this.length = length;
	this.weight = weight;
	this.price = price;
	this.laminated = laminated;
    }

    public String getThickness() {
	return thickness;
    }

    public void setThickness(String thickness) {
	this.thickness = thickness;
    }

    public String getLength() {
	return length;
    }

    public void setLength(String length) {
	this.length = length;
    }

    public String getWeight() {
	return weight;
    }

    public void setWeight(String weight) {
	this.weight = weight;
    }

    public String getLaminated() {
	return laminated;
    }

    public void setLaminated(String laminated) {
	this.laminated = laminated;
    }

    public String getPrice() {
	return price;
    }

    public void setPrice(String price) {
	this.price = price;
    }

    public String getWater_resistance() {
	return water_resistance;
    }

    public void setWater_resistance(String water_resistance) {
	this.water_resistance = water_resistance;
    }

    public String getSanded_or_unsanded() {
	return sanded_or_unsanded;
    }

    public void setSanded_or_unsanded(String sanded_or_unsanded) {
	this.sanded_or_unsanded = sanded_or_unsanded;
    }

    public int getMinThickness() {
	return Integer.parseInt(this.thickness.split(",")[0].trim());
    }

    public int getMaxThickness() {
	return Integer.parseInt(this.thickness.split(",")[1].trim());
    }

    public int getMinLength() {
	return Integer.parseInt(this.length.split(",")[0].trim());
    }

    public int getMaxLength() {
	return Integer.parseInt(this.length.split(",")[1].trim());
    }

    public int getMinWeight() {
	return Integer.parseInt(this.weight.split(",")[0].trim());
    }

    public int getMaxWeight() {
	return Integer.parseInt(this.weight.split(",")[1].trim());
    }

    public int getMinLaminated() {
	return Integer.parseInt(this.laminated.split(",")[0].trim());
    }

    public int getMaxLaminated() {
	return Integer.parseInt(this.laminated.split(",")[1].trim());
    }

    public int getMinPrice() {
	return Integer.parseInt(this.price.split(",")[0].trim());
    }

    public int getMaxPrice() {
	return Integer.parseInt(this.price.split(",")[1].trim());
    }
}
