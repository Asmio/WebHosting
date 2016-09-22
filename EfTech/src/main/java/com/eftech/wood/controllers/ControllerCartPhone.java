/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eftech.wood.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.eftech.wood.phone.phoneshopcart.ShoppingCart;

@Controller
public class ControllerCartPhone {

    /*
     * @Autowired IphoneJDBCTemplate iphoneJDBCTemplate;
     */

    @RequestMapping(value = "/basket", method = RequestMethod.GET)
    public String cart(HttpSession session) {

	ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
	if (cart == null)
	    cart = new ShoppingCart();
	cart.calculateTotal("0"); // GDP (for example)
	session.setAttribute("cart", cart);
	session.setAttribute("page", "basket"); //

	return "ru_cart";
    }

    @RequestMapping("/add-product-to-customer-basket")
    public String addProductToShoppingCart(@RequestParam(value = "id") int id, HttpSession session) {

	ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
	if (cart == null)
	    cart = new ShoppingCart();

	// Iphone iphone = iphoneJDBCTemplate.getIphone(id);
	// ShopProduct prod = iphone;
	// cart.addItem(prod);
	session.setAttribute("cart", cart);

	String page;
	try {
	    page = (String) session.getAttribute("page");
	} catch (Exception e) {
	    page = "index";
	}
	return "redirect:/" + page + ".htm";

    }

    @RequestMapping(value = "/del-from-basket", method = RequestMethod.GET)
    public String del_from_basket1(@RequestParam("id") int id, HttpSession session) {

	ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("cart");
	if (shoppingCart == null)
	    shoppingCart = new ShoppingCart();

	// Iphone iphone = iphoneJDBCTemplate.getIphone(id);
	// shoppingCart.update(iphone, "0"); // delete from compare
	session.setAttribute("cart", shoppingCart);

	String page = "index";
	try {
	    page = (String) session.getAttribute("page");
	} catch (Exception e) {
	}
	return "redirect:/" + page + ".htm";
    }

    @RequestMapping(value = "/updatequantity", method = RequestMethod.GET)
    public String Minus(@RequestParam(value = "id") int id, @RequestParam(value = "quantity") int quantity,
	    HttpSession session) {

	ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
	if (cart == null)
	    cart = new ShoppingCart();
	// Iphone iphone = iphoneJDBCTemplate.getIphone(id);
	// cart.update(iphone, "" + quantity); // We do less on 1 position

	session.setAttribute("cart", cart);
	return "redirect:basket.htm";
    }

    /// ------------ </ Basket :End > ---------------

}
