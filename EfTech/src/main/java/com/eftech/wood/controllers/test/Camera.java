/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eftech.wood.controllers.test;

import org.springframework.stereotype.Component;

/**
 *
 * @author Admin
 */
@Component
public class Camera {

    String snap = "Snap1";

    // public void snap(){
    //
    // }

    public void snap() {
	snap = snap + " test!";
    }

    public String getSnap() {
	return snap;
    }

}
