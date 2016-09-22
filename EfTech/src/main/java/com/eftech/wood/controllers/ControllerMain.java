/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eftech.wood.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eftech.wood.entity.ParticleBoard;
import com.eftech.wood.entity.Plywood;
import com.eftech.wood.phone.compare_phone.CompareCart;
import com.eftech.wood.service.ParticleBoardService;
import com.eftech.wood.service.PlywoodService;

/**
 *
 * @author Admin
 */

@Controller
public class ControllerMain {

    private static final String PRODUCT_PLYWOOD = "Plywood";
    private static final String PRODUCT_PARTICLE_BOARD = "ParticleBoard";

    @Autowired
    private PlywoodService plywoodService;

    @Autowired
    private ParticleBoardService particleBoardService;

    @RequestMapping(value = { "/index", "/" }, method = RequestMethod.GET)
    public ModelAndView userSorexInfo(HttpSession session) {
	ModelAndView modelAndView = new ModelAndView("index");

	List<ParticleBoard> list = particleBoardService.findAll();
	modelAndView.addObject("list", list);
	session.setAttribute("page", "index");
	return modelAndView;
    }

    @RequestMapping(value = "/plywood")
    public String allPlywood(HttpServletRequest request, ModelMap modelMap, HttpSession session) {
	PagedListHolder<Plywood> pagedListHolder = new PagedListHolder<Plywood>(plywoodService.findAll());
	int page = ServletRequestUtils.getIntParameter(request, "p", 0);
	pagedListHolder.setPage(page);
	pagedListHolder.setPageSize(6);
	modelMap.put("pagedListHolder", pagedListHolder);
	session.setAttribute("pagedUrl", request.getRequestURL().toString());
	session.setAttribute("product", PRODUCT_PLYWOOD);
	return "all_products";
    }

    @RequestMapping(value = "/particleBoard")
    public String allParticleBoard(HttpServletRequest request, ModelMap modelMap, HttpSession session) {
	PagedListHolder<ParticleBoard> pagedListHolder = new PagedListHolder<ParticleBoard>(
		particleBoardService.findAll());
	int page = ServletRequestUtils.getIntParameter(request, "p", 0);
	pagedListHolder.setPage(page);
	pagedListHolder.setPageSize(6);
	modelMap.put("pagedListHolder", pagedListHolder);
	session.setAttribute("pagedUrl", request.getRequestURL().toString());
	session.setAttribute("product", PRODUCT_PARTICLE_BOARD);
	return "all_products";
    }

    @RequestMapping(value = "/single-product", method = RequestMethod.GET)
    public ModelAndView singleProduct(@RequestParam(value = "id") String id,
	    @RequestParam(value = "product") String product, HttpSession session) {
	ModelAndView model = new ModelAndView("product");

	if (product.equals(PRODUCT_PLYWOOD)) {
	    Plywood plywood = plywoodService.findById(id);
	    model.addObject("item", plywood);
	    session.setAttribute("product", PRODUCT_PLYWOOD);
	}
	if (product.equals(PRODUCT_PARTICLE_BOARD)) {
	    ParticleBoard particleBoard = particleBoardService.findById(id);
	    model.addObject("item", particleBoard);
	    session.setAttribute("product", PRODUCT_PARTICLE_BOARD);
	}
	return model;
    }

    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public ModelAndView p403(HttpSession session) {
	ModelAndView mv = new ModelAndView("403");

	// session.setAttribute("page", "index");
	return mv;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(HttpSession session) {
	ModelAndView mv = new ModelAndView("login");
	session.setAttribute("product", PRODUCT_PLYWOOD);

	return mv;
    }

    @RequestMapping(value = "/iphones_from_any_page", method = RequestMethod.GET)
    public String vmc_from_any_page(@RequestParam(value = "page_nomber") int page_nomber, HttpSession session) {
	session.setAttribute("page_nomber", page_nomber);
	return "redirect:/iphones.htm";
    }

    @RequestMapping(value = "/iphones_select", method = RequestMethod.GET)
    public String vmc_select(
	    // @RequestParam(value = "page") String page,
	    @RequestParam(value = "checkbox_iphone5c", defaultValue = "0") int chIphone5c,
	    @RequestParam(value = "checkbox_iphone5s", defaultValue = "0") int chIphone5s,
	    @RequestParam(value = "checkbox_iphone6", defaultValue = "0") int chIphone6,
	    @RequestParam(value = "checkbox_iphone6plus", defaultValue = "0") int chIphone6plus,
	    @RequestParam(value = "checkbox_iphone6s", defaultValue = "0") int chIphone6s,
	    @RequestParam(value = "checkbox_iphone6splus", defaultValue = "0") int chIphone6splus,
	    // @RequestParam(value = "checkboxUsa", defaultValue = "0") int
	    // chUsa,
	    // @RequestParam(value = "checkboxGermany", defaultValue = "0") int
	    // chGermany
	    @RequestParam(value = "color", defaultValue = "n") String color,
	    @RequestParam(value = "memory", defaultValue = "n") String memory, HttpSession session) {

	session.setAttribute("chIphone5c", chIphone5c);
	session.setAttribute("chIphone5s", chIphone5s);
	session.setAttribute("chIphone6", chIphone6);
	session.setAttribute("chIphone6plus", chIphone6plus);
	session.setAttribute("chIphone6s", chIphone6s);
	session.setAttribute("chIphone6splus", chIphone6splus);
	session.setAttribute("color", color);
	session.setAttribute("memory", memory);
	session.setAttribute("page_nomber", 1);

	return "redirect:/iphones.htm";
    }

    @RequestMapping(value = "/iphone-{id}", method = RequestMethod.GET)
    public ModelAndView iphine(@PathVariable("id") int id, HttpSession session) {

	// ModelAndView mv = new ModelAndView("one_iph");
	ModelAndView mv = new ModelAndView("ru_one_iphone");
	// Iphone iphone = iphoneJDBCTemplate.getIphone(id);
	// printInFile("HMC exeption2.txt", hmc.toString());
	// mv.addObject("iphone", iphone);
	session.setAttribute("page", "iphone-" + id);

	return mv;
    }

    /// ------------ Compare : Start -----------------

    @RequestMapping(value = "/compare", method = RequestMethod.GET)
    public ModelAndView compare(HttpSession session) {
	ModelAndView mv = new ModelAndView("ru_compare");

	CompareCart compareCart = (CompareCart) session.getAttribute("compareCart");
	if (compareCart == null)
	    compareCart = new CompareCart();

	mv.addObject("compareCart", compareCart);

	session.setAttribute("page", "compare");
	return mv;
    }

    @RequestMapping("/add-product-to-compare-list")
    public String addProductToCompareList(@RequestParam(value = "id") int id, HttpSession session) {
	// @RequestParam(value = "page") Integer page,
	CompareCart compareCart = (CompareCart) session.getAttribute("compareCart");
	if (compareCart == null)
	    compareCart = new CompareCart();

	// Iphone iphone = iphoneJDBCTemplate.getIphone(id);
	// compareCart.addItem(iphone);
	session.setAttribute("compareCart", compareCart);

	String page;
	try {
	    page = (String) session.getAttribute("page");
	} catch (Exception e) {
	    page = "index";
	}
	return "redirect:/" + page + ".htm";

    }

    // @RequestMapping(value = "/comparedel-{id}", method = RequestMethod.GET)
    @RequestMapping(value = "/delete-phone-{id}-from-compare", method = RequestMethod.GET)
    public String delfromcompare(@PathVariable("id") int id, HttpSession session) {
	// ModelAndView mv = new ModelAndView("hmc/compare");

	CompareCart compareCart = (CompareCart) session.getAttribute("compareCart");
	if (compareCart == null)
	    compareCart = new CompareCart();
	// Iphone iphone = iphoneJDBCTemplate.getIphone(id);
	// compareCart.update(iphone, "0"); // delete from compare
	session.setAttribute("compareCart", compareCart);

	return "redirect:/compare.htm";
    }

}
