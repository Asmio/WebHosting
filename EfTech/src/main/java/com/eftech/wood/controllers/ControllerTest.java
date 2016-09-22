/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eftech.wood.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.eftech.wood.controllers.test.Camera;

/**
 *
 * @author Admin
 */

@Controller
public class ControllerTest {

    @Autowired
    Camera camara;

    @RequestMapping(value = "/camera", method = RequestMethod.GET)
    public ModelAndView userSorexInfo(HttpSession session) {
	ModelAndView mv = new ModelAndView("test");

	// List<Hmc> listHmc = hmcJDBCTemplate.listHmc();
	//// printInFile(listHmc.toString());
	camara.snap();
	String str = camara.getSnap();

	mv.addObject("str", str);
	// session.setAttribute("page", "index");

	return mv;
    }

}
