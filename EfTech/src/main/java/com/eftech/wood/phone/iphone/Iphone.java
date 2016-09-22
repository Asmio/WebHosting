/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eftech.wood.phone.iphone;

import com.eftech.wood.phone.phoneshopcart.ShopProduct;

/**
 *
 * @author Admin
 */
public class Iphone implements ShopProduct {

    // table iphone
    int id;
    String model;
    String manufacturer;
    int year;
    String type;
    String os;
    int display_size;
    String display_resolution;
    int ram_memory;
    int flash_memory;
    String sim_several;
    String camera;
    int matrix_points;
    String design_case;
    String material;
    String color;
    String sim_format;
    String dimensions;
    int weight;
    String battery_type;
    int battery_capacity;
    String battery_removable;
    int time_talk;
    int time_out;
    int price;
    String description;
    String photo1;
    String photo2;
    String photo3;

    public Iphone() {
    }

    public Iphone(String model, String manufacturer, int year, String type, String os, int display_size,
	    String display_resolution, int ram_memory, int flash_memory, String sim_several, String camera,
	    int matrix_points, String design_case, String material, String color, String sim_format, String dimensions,
	    int weight, String battery_type, int battery_capacity, String battery_removable, int time_talk,
	    int time_out, int price, String description, String photo1, String photo2, String photo3) {
	this.model = model;
	this.manufacturer = manufacturer;
	this.year = year;
	this.type = type;
	this.os = os;
	this.display_size = display_size;
	this.display_resolution = display_resolution;
	this.ram_memory = ram_memory;
	this.flash_memory = flash_memory;
	this.sim_several = sim_several;
	this.camera = camera;
	this.matrix_points = matrix_points;
	this.design_case = design_case;
	this.material = material;
	this.color = color;
	this.sim_format = sim_format;
	this.dimensions = dimensions;
	this.weight = weight;
	this.battery_type = battery_type;
	this.battery_capacity = battery_capacity;
	this.battery_removable = battery_removable;
	this.time_talk = time_talk;
	this.time_out = time_out;
	this.price = price;
	this.description = description;
	this.photo1 = photo1;
	this.photo2 = photo2;
	this.photo3 = photo3;
    }

    public Iphone(int id, String model, String manufacturer, int year, String type, String os, int display_size,
	    String display_resolution, int ram_memory, int flash_memory, String sim_several, String camera,
	    int matrix_points, String design_case, String material, String color, String sim_format, String dimensions,
	    int weight, String battery_type, int battery_capacity, String battery_removable, int time_talk,
	    int time_out, int price, String description, String photo1, String photo2, String photo3) {
	this.id = id;
	this.model = model;
	this.manufacturer = manufacturer;
	this.year = year;
	this.type = type;
	this.os = os;
	this.display_size = display_size;
	this.display_resolution = display_resolution;
	this.ram_memory = ram_memory;
	this.flash_memory = flash_memory;
	this.sim_several = sim_several;
	this.camera = camera;
	this.matrix_points = matrix_points;
	this.design_case = design_case;
	this.material = material;
	this.color = color;
	this.sim_format = sim_format;
	this.dimensions = dimensions;
	this.weight = weight;
	this.battery_type = battery_type;
	this.battery_capacity = battery_capacity;
	this.battery_removable = battery_removable;
	this.time_talk = time_talk;
	this.time_out = time_out;
	this.price = price;
	this.description = description;
	this.photo1 = photo1;
	this.photo2 = photo2;
	this.photo3 = photo3;
    }

    @Override
    public int getId() {
	return id;
    }

    public void setId(int id) {
	this.id = id;
    }

    public String getModel() {
	return model;
    }

    public void setModel(String model) {
	this.model = model;
    }

    public String getManufacturer() {
	return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
	this.manufacturer = manufacturer;
    }

    public int getYear() {
	return year;
    }

    public void setYear(int year) {
	this.year = year;
    }

    public String getType() {
	return type;
    }

    public void setType(String type) {
	this.type = type;
    }

    public String getOs() {
	return os;
    }

    public void setOs(String os) {
	this.os = os;
    }

    public int getDisplay_size() {
	return display_size;
    }

    public void setDisplay_size(int display_size) {
	this.display_size = display_size;
    }

    public String getDisplay_resolution() {
	return display_resolution;
    }

    public void setDisplay_resolution(String display_resolution) {
	this.display_resolution = display_resolution;
    }

    public int getRam_memory() {
	return ram_memory;
    }

    public void setRam_memory(int ram_memory) {
	this.ram_memory = ram_memory;
    }

    public int getFlash_memory() {
	return flash_memory;
    }

    public void setFlash_memory(int flash_memory) {
	this.flash_memory = flash_memory;
    }

    public String getSim_several() {
	return sim_several;
    }

    public void setSim_several(String sim_several) {
	this.sim_several = sim_several;
    }

    public String getCamera() {
	return camera;
    }

    public void setCamera(String camera) {
	this.camera = camera;
    }

    public int getMatrix_points() {
	return matrix_points;
    }

    public void setMatrix_points(int matrix_points) {
	this.matrix_points = matrix_points;
    }

    public String getDesign_case() {
	return design_case;
    }

    public void setDesign_case(String design_case) {
	this.design_case = design_case;
    }

    public String getMaterial() {
	return material;
    }

    public void setMaterial(String material) {
	this.material = material;
    }

    public String getColor() {
	return color;
    }

    public void setColor(String color) {
	this.color = color;
    }

    public String getSim_format() {
	return sim_format;
    }

    public void setSim_format(String sim_format) {
	this.sim_format = sim_format;
    }

    public String getDimensions() {
	return dimensions;
    }

    public void setDimensions(String dimensions) {
	this.dimensions = dimensions;
    }

    public int getWeight() {
	return weight;
    }

    public void setWeight(int weight) {
	this.weight = weight;
    }

    public String getBattery_type() {
	return battery_type;
    }

    public void setBattery_type(String battery_type) {
	this.battery_type = battery_type;
    }

    public int getBattery_capacity() {
	return battery_capacity;
    }

    public void setBattery_capacity(int battery_capacity) {
	this.battery_capacity = battery_capacity;
    }

    public String getBattery_removable() {
	return battery_removable;
    }

    public void setBattery_removable(String battery_removable) {
	this.battery_removable = battery_removable;
    }

    public int getTime_talk() {
	return time_talk;
    }

    public void setTime_talk(int time_talk) {
	this.time_talk = time_talk;
    }

    public int getTime_out() {
	return time_out;
    }

    public void setTime_out(int time_out) {
	this.time_out = time_out;
    }

    @Override
    public int getPrice() {
	return price;
    }

    public void setPrice(int price) {
	this.price = price;
    }

    public String getDescription() {
	return description;
    }

    public void setDescription(String description) {
	this.description = description;
    }

    public String getPhoto1() {
	return photo1;
    }

    public void setPhoto1(String photo1) {
	this.photo1 = photo1;
    }

    public String getPhoto2() {
	return photo2;
    }

    public void setPhoto2(String photo2) {
	this.photo2 = photo2;
    }

    public String getPhoto3() {
	return photo3;
    }

    public void setPhoto3(String photo3) {
	this.photo3 = photo3;
    }

}
