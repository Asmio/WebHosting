/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eftech.wood.controllers.test;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

//import org.aspectj.lang.annotation.Aspect;
/**
 *
 * @author Admin
 */
@Aspect
@Component
public class Logger {

    String str = "About to take photo!";

    @Before("execution(* controllers.*.*.*(..)")
    public void aboutToTakePhoto() {
	printInFile("Logger befor.txt", str);
    }

    protected void printInFile(String fileName, String str) { // For Check

	File file = new File("d:\\2\\" + fileName);

	// File file = new File("HMC exeption2.txt");
	try (FileWriter fileWriter = new FileWriter(file, true)) {
	    fileWriter.write("-------> " + new Date() + "): \n");
	    fileWriter.write(str + "\n\n");
	} catch (IOException ex) {
	    // Logger.getLogger(ControllerMachine.class.getName()).log(Level.SEVERE,
	    // null, ex);
	}

    }

}
