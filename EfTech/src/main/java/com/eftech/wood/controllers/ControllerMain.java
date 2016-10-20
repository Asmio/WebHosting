/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eftech.wood.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.eftech.wood.compare.CompareList;
import com.eftech.wood.entity.Errors;
import com.eftech.wood.entity.ParticleBoard;
import com.eftech.wood.entity.Plywood;
import com.eftech.wood.helper.Filter;
import com.eftech.wood.service.ErrorsService;
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

    @Autowired
    private ErrorsService errorsService;

    @RequestMapping(value = { "/index", "/" }, method = RequestMethod.GET)
    public ModelAndView userSorexInfo(HttpSession session) {
	ModelAndView modelAndView = new ModelAndView("index");
	try {
	    List<Plywood> listPlywood = plywoodService.findAll();
	    List<ParticleBoard> listParticleBoard = particleBoardService.findAll();
	    if (listPlywood.size() > 0) {
		List<Plywood> sliderList = new ArrayList<Plywood>();
		for (int i = 1; i <= 3; i++) {
		    sliderList.add(listPlywood.get(listPlywood.size() - i));
		}
		modelAndView.addObject("sliderList", sliderList);
	    }
	    if (listPlywood.size() > 0) {
		List<Plywood> recentlyUplPl = new ArrayList<Plywood>();
		for (int i = 1; i <= 3; i++) {
		    recentlyUplPl.add(listPlywood.get(listPlywood.size() - i));
		}
		modelAndView.addObject("recentlyUplPl", recentlyUplPl);
	    }
	    if (listParticleBoard.size() > 0) {
		List<ParticleBoard> recentlyUplPB = new ArrayList<ParticleBoard>();
		for (int i = 1; i <= 3; i++) {
		    recentlyUplPB.add(listParticleBoard.get(listParticleBoard.size() - i));
		}
		modelAndView.addObject("recentlyUplPB", recentlyUplPB);
	    }
	} catch (Exception e) {
	    errorsService.save(new Errors("Show index page", e.getMessage()));
	}
	return modelAndView;
    }

    @RequestMapping(value = "/site_map", method = RequestMethod.GET)
    public ModelAndView getSiteMap(HttpSession session) {
	ModelAndView modelAndView = new ModelAndView("site_map");
	try {
	    List<Plywood> listPlywood = plywoodService.findAll();
	    List<ParticleBoard> listParticleBoard = particleBoardService.findAll();
	    modelAndView.addObject("listPlywood", listPlywood);
	    modelAndView.addObject("listParticleBoard", listParticleBoard);
	} catch (Exception e) {
	    errorsService.save(new Errors("Show site map page", e.getMessage()));
	}
	return modelAndView;
    }

    @RequestMapping(value = "/plywood")
    public String allPlywood(HttpServletRequest request, ModelMap modelMap, HttpSession session) {
	try {
	    PagedListHolder<Plywood> pagedListHolder = new PagedListHolder<Plywood>(plywoodService.findAll());
	    int page = ServletRequestUtils.getIntParameter(request, "p", 0);
	    pagedListHolder.setPage(page);
	    pagedListHolder.setPageSize(6);
	    modelMap.put("pagedListHolder", pagedListHolder);
	    session.setAttribute("maxLength", plywoodService.getMaxValue("length"));
	    session.setAttribute("maxThickness", plywoodService.getMaxValue("thickness"));
	    session.setAttribute("maxWeight", plywoodService.getMaxValue("weight"));
	    session.setAttribute("maxPrice", plywoodService.getMaxValue("price"));
	    session.setAttribute("pagedUrl", request.getRequestURL().toString());
	    session.setAttribute("product", PRODUCT_PLYWOOD);
	    setAttributeFilter(null, false, session);
	} catch (Exception e) {
	    errorsService.save(new Errors("Show products page", e.getMessage()));
	}
	return "all_products";
    }

    @RequestMapping(value = "/particleBoard")
    public String allParticleBoard(HttpServletRequest request, ModelMap modelMap, HttpSession session) {
	try {
	    PagedListHolder<ParticleBoard> pagedListHolder = new PagedListHolder<ParticleBoard>(
		    particleBoardService.findAll());
	    int page = ServletRequestUtils.getIntParameter(request, "p", 0);
	    pagedListHolder.setPage(page);
	    pagedListHolder.setPageSize(6);
	    modelMap.put("pagedListHolder", pagedListHolder);
	    session.setAttribute("maxLength", particleBoardService.getMaxValue("length"));
	    session.setAttribute("maxThickness", particleBoardService.getMaxValue("thickness"));
	    session.setAttribute("maxWeight", particleBoardService.getMaxValue("weight"));
	    session.setAttribute("maxPrice", particleBoardService.getMaxValue("price"));
	    session.setAttribute("maxLaminated", particleBoardService.getMaxValue("laminated"));
	    session.setAttribute("pagedUrl", request.getRequestURL().toString());
	    session.setAttribute("product", PRODUCT_PARTICLE_BOARD);
	    setAttributeFilter(null, false, session);
	} catch (Exception e) {
	    errorsService.save(new Errors("Show products page", e.getMessage()));
	}
	return "all_products";
    }

    @RequestMapping(value = "/single-product", method = RequestMethod.GET)
    public ModelAndView singleProduct(@RequestParam(value = "id") String id,
	    @RequestParam(value = "product") String product, HttpSession session) {
	ModelAndView model = new ModelAndView("product");
	try {
	    if (product.equals(PRODUCT_PLYWOOD)) {
		Plywood plywood = plywoodService.findById(id);
		if (plywood != null) {
		    model.addObject("item", plywood);
		} else {
		    model.setView(new RedirectView("error?404"));
		}
		session.setAttribute("product", PRODUCT_PLYWOOD);
	    }
	    if (product.equals(PRODUCT_PARTICLE_BOARD)) {
		ParticleBoard particleBoard = particleBoardService.findById(id);
		if (particleBoard != null) {
		    model.addObject("item", particleBoard);
		} else {
		    model.setView(new RedirectView("error?404"));
		}

		session.setAttribute("product", PRODUCT_PARTICLE_BOARD);
	    }
	} catch (Exception e) {
	    errorsService.save(new Errors("Show product page", e.getMessage()));
	}
	return model;
    }

    @RequestMapping(value = "filterPlywood", method = RequestMethod.GET)
    public String filterPlywood(@RequestParam(value = "thickness") String thickness,
	    @RequestParam(value = "length") String length, @RequestParam(value = "weight") String weight,
	    @RequestParam(value = "water_resistance") String water_resistance,
	    @RequestParam(value = "sanded_or_unsanded") String sanded_or_unsanded,
	    @RequestParam(value = "price") String price, HttpServletRequest request, ModelMap modelMap,
	    HttpSession session) {
	try {
	    Filter filter = new Filter(thickness, length, weight, price, water_resistance, sanded_or_unsanded);
	    PagedListHolder<Plywood> pagedListHolder = new PagedListHolder<Plywood>(
		    plywoodService.findAllByFilter(filter));
	    int page = ServletRequestUtils.getIntParameter(request, "p", 0);
	    pagedListHolder.setPage(page);
	    pagedListHolder.setPageSize(6);
	    modelMap.put("pagedListHolder", pagedListHolder);
	    String url = "?thickness=" + thickness + "&length=" + length + "&weight=" + weight + "&water_resistance="
		    + water_resistance + "&sanded_or_unsanded=" + sanded_or_unsanded + "&price=" + price;

	    session.setAttribute("pagedUrl", request.getRequestURL().toString() + url);
	    session.setAttribute("product", PRODUCT_PLYWOOD);
	    setAttributeFilter(filter, true, session);
	} catch (Exception e) {
	    errorsService.save(new Errors("Apply filter product", e.getMessage()));
	}
	return "all_products";
    }

    @RequestMapping(value = "filterParticleBoard", method = RequestMethod.GET)
    public String filterParticleBoard(@RequestParam(value = "thickness") String thickness,
	    @RequestParam(value = "length") String length, @RequestParam(value = "weight") String weight,
	    @RequestParam(value = "laminated") String laminated, @RequestParam(value = "price") String price,
	    HttpServletRequest request, ModelMap modelMap, HttpSession session) {
	try {
	    Filter filter = new Filter(thickness, length, weight, laminated, price);
	    PagedListHolder<ParticleBoard> pagedListHolder = new PagedListHolder<ParticleBoard>(
		    particleBoardService.findAllByFilter(filter));
	    int page = ServletRequestUtils.getIntParameter(request, "p", 0);
	    pagedListHolder.setPage(page);
	    pagedListHolder.setPageSize(6);
	    modelMap.put("pagedListHolder", pagedListHolder);
	    String url = "?thickness=" + thickness + "&length=" + length + "&weight=" + weight + "&laminated="
		    + laminated + "&price=" + price;
	    session.setAttribute("pagedUrl", request.getRequestURL().toString() + url);
	    session.setAttribute("product", PRODUCT_PARTICLE_BOARD);
	    setAttributeFilter(filter, true, session);
	} catch (Exception e) {
	    errorsService.save(new Errors("Apply filter product", e.getMessage()));
	}
	return "all_products";
    }

    private void setAttributeFilter(Filter filter, boolean filterState, HttpSession session) {
	if (filterState) {
	    session.setAttribute("thickness", filter.getThickness());
	    session.setAttribute("length", filter.getLength());
	    session.setAttribute("weight", filter.getWeight());
	    session.setAttribute("price", filter.getPrice());
	    session.setAttribute("laminated", filter.getLaminated());
	} else {
	    if (session.getAttribute("product").equals(PRODUCT_PLYWOOD)) {
		session.setAttribute("thickness", "0, " + plywoodService.getMaxValue("thickness"));
		session.setAttribute("length", "0, " + plywoodService.getMaxValue("length"));
		session.setAttribute("weight", "0, " + plywoodService.getMaxValue("weight"));
		session.setAttribute("price", "0, " + plywoodService.getMaxValue("price"));
	    } else {
		if (session.getAttribute("product").equals(PRODUCT_PARTICLE_BOARD)) {
		    session.setAttribute("thickness", "0, " + particleBoardService.getMaxValue("thickness"));
		    session.setAttribute("length", "0, " + particleBoardService.getMaxValue("length"));
		    session.setAttribute("weight", "0, " + particleBoardService.getMaxValue("weight"));
		    session.setAttribute("price", "0, " + particleBoardService.getMaxValue("price"));
		    session.setAttribute("laminated", "0, " + particleBoardService.getMaxValue("laminated"));
		}
	    }
	}
    }

    @RequestMapping(value = "/error-{id}", method = RequestMethod.GET)
    public ModelAndView errorPage(@PathVariable("id") String error) {
	ModelAndView mv = new ModelAndView("error");
	mv.addObject("error", error);
	return mv;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(HttpSession session) {
	ModelAndView mv = new ModelAndView("login");
	session.setAttribute("product", PRODUCT_PLYWOOD);
	return mv;
    }

    @RequestMapping(value = "updateCompareList", method = RequestMethod.GET)
    public @ResponseBody int updateCompareList(@RequestParam("product") String product, @RequestParam("id") String id,
	    HttpSession session) {
	try {
	    CompareList compareList = (CompareList) session.getAttribute("compareList");
	    if (compareList == null) {
		compareList = new CompareList();
	    }
	    switch (product) {
	    case PRODUCT_PLYWOOD:
		compareList.updatePlywoodList(plywoodService.findById(id));
		session.setAttribute("compareList", compareList);
		return compareList.getTotal();
	    case PRODUCT_PARTICLE_BOARD:
		compareList.updateParticleBoardList(particleBoardService.findById(id));
		session.setAttribute("compareList", compareList);
		return compareList.getTotal();
	    }
	} catch (Exception e) {
	    errorsService.save(new Errors("Update compare list", e.getMessage()));
	}
	return 0;
    }

    @RequestMapping(value = "delete-from-compare", method = RequestMethod.GET)
    public String deleteFromCompare(@RequestParam("product") String product, @RequestParam("id") String id,
	    HttpSession session) {
	try {
	    this.updateCompareList(product, id, session);
	} catch (Exception e) {
	    errorsService.save(new Errors("Delete from compare list", e.getMessage()));
	}
	return "redirect:/compare.html?product=" + product;
    }

    @RequestMapping(value = "compare", method = RequestMethod.GET)
    public ModelAndView compare(HttpSession session) {
	ModelAndView modelAndView = new ModelAndView("compare");
	try {
	    CompareList compareList = (CompareList) session.getAttribute("compareList");
	    if (compareList == null) {
		compareList = new CompareList();
	    }
	    modelAndView.addObject(compareList);
	    session.setAttribute("compareList", compareList);
	} catch (Exception e) {
	    errorsService.save(new Errors("Show compare page", e.getMessage()));
	}
	return modelAndView;
    }

    @Autowired
    ServletContext servletContext;

    @RequestMapping(value = "/downloadPDF", method = RequestMethod.GET)
    public ModelAndView downloadPDF(@RequestParam("product") String product, @RequestParam("id") String id,
	    HttpServletRequest request) {
	try {
	    request.setAttribute("product", product);
	    request.setAttribute("rootResources", servletContext.getRealPath("/resources/"));
	    if (product.equals(PRODUCT_PLYWOOD)) {
		Plywood plywood = plywoodService.findById(id);
		return new ModelAndView("pdfView", "item", plywood);
	    } else {
		if (product.equals(PRODUCT_PARTICLE_BOARD)) {
		    ParticleBoard particleBoard = particleBoardService.findById(id);
		    return new ModelAndView("pdfView", "item", particleBoard);
		}
	    }
	} catch (Exception e) {
	    errorsService.save(new Errors("Download PDF", e.getMessage()));
	}
	return new ModelAndView("pdfView");
    }

}
