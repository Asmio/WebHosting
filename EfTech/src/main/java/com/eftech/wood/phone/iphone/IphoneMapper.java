/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eftech.wood.phone.iphone;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author Admin
 */
public class IphoneMapper implements RowMapper<Iphone> {

    @Override
    public Iphone mapRow(ResultSet rs, int i) throws SQLException {
	Iphone iphone = new Iphone();
	iphone.setId(rs.getInt("id"));
	iphone.setModel(rs.getString("model"));
	iphone.setManufacturer(rs.getString("manufacturer"));
	iphone.setYear(rs.getInt("year"));
	iphone.setType(rs.getString("type"));
	iphone.setOs(rs.getString("os"));
	iphone.setDisplay_size(rs.getInt("display_size"));
	iphone.setDisplay_resolution(rs.getString("display_resolution"));
	iphone.setRam_memory(rs.getInt("ram_memory"));
	iphone.setFlash_memory(rs.getInt("flash_memory"));
	iphone.setSim_several(rs.getString("sim_several"));
	iphone.setCamera(rs.getString("camera"));
	iphone.setMatrix_points(rs.getInt("matrix_points"));
	iphone.setDesign_case(rs.getString("design_case"));
	iphone.setMaterial(rs.getString("material"));
	iphone.setColor(rs.getString("color"));
	iphone.setSim_format(rs.getString("sim_format"));
	iphone.setDimensions(rs.getString("dimensions"));
	iphone.setWeight(rs.getInt("weight"));
	iphone.setBattery_type(rs.getString("battery_type"));
	iphone.setBattery_capacity(rs.getInt("battery_capacity"));
	iphone.setTime_talk(rs.getInt("time_talk"));
	iphone.setTime_out(rs.getInt("time_out"));
	iphone.setPrice(rs.getInt("price"));
	iphone.setDescription(rs.getString("description"));
	iphone.setPhoto1(rs.getString("photo1"));
	iphone.setPhoto2(rs.getString("photo2"));
	iphone.setPhoto3(rs.getString("photo3"));
	return iphone;
    }
}

/// ------------------
// CREATE TABLE IF NOT EXISTS `phones`.`iphone` (
// `id` INT NOT NULL AUTO_INCREMENT,
// `model` VARCHAR(255) NULL,
// `manufacturer` VARCHAR(100) NULL,
// `year` INT NULL,
// `type` VARCHAR(45) NULL,
// `os` VARCHAR(45) NULL,
// `display_size` INT NULL,
// `display_resolution` VARCHAR(45) NULL,
// `ram_memory` INT NULL,
// `flash_memory` INT NULL,
// `sim_several` VARCHAR(55) NULL,

// `camera` VARCHAR(45) NULL,
// `matrix_points` INT NULL,
// `design_case` VARCHAR(45) NULL,
// `material` VARCHAR(45) NULL,
// `color` VARCHAR(45) NULL,
// `sim_format` VARCHAR(45) NULL,
// `dimensions` VARCHAR(255) NULL,
// `weight` DOUBLE NULL,
// `battery_type` VARCHAR(55) NULL,
// `battery_capacity` INT NULL,
// `battery_removable` VARCHAR(55) NULL,
// `time_talk` INT NULL,
// `time_out` INT NULL,
// `price` INT NULL,
// `description` TEXT NULL,
// `photo1` VARCHAR(45) NULL,
// `photo2` VARCHAR(45) NULL,
// `photo3` VARCHAR(45) NULL,
// PRIMARY KEY (`id`))
// ENGINE = InnoDB;