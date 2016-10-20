package com.eftech.wood.controllers;

import java.security.Principal;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.eftech.wood.entity.Actions;
import com.eftech.wood.entity.Cart;
import com.eftech.wood.entity.EmailRecipient;
import com.eftech.wood.entity.Errors;
import com.eftech.wood.entity.Indent;
import com.eftech.wood.entity.ParticleBoard;
import com.eftech.wood.entity.Plywood;
import com.eftech.wood.helper.EmailSender;
import com.eftech.wood.helper.ManagementResourses;
import com.eftech.wood.service.ActionsService;
import com.eftech.wood.service.CartService;
import com.eftech.wood.service.EmailRecipientService;
import com.eftech.wood.service.ErrorsService;
import com.eftech.wood.service.IndentService;
import com.eftech.wood.service.ParticleBoardService;
import com.eftech.wood.service.PlywoodService;
import com.eftech.wood.shopping.ShoppingCart;
import com.eftech.wood.shopping.ShoppingCartParticleBoard;
import com.eftech.wood.shopping.ShoppingCartPlywood;

@Controller
public class ControllerCart {

    private static final String PRODUCT_PLYWOOD = "Plywood";
    private static final String PRODUCT_PARTICLE_BOARD = "ParticleBoard";

    @Autowired
    private PlywoodService plywoodService;

    @Autowired
    private ParticleBoardService particleBoardService;

    @Autowired
    private CartService cartService;

    @Autowired
    private EmailRecipientService emailRecipientService;

    @Autowired
    private ActionsService actionsService;

    @Autowired
    private ErrorsService errorsService;

    @Autowired
    private IndentService indentService;

    @Autowired
    private MessageSource messageSource;

    @RequestMapping(value = "cart/addToCart", method = RequestMethod.GET)
    public @ResponseBody int[] addToCart(@RequestParam("product") String product, @RequestParam("id") String id,
	    HttpSession session, Principal principal) {
	try {
	    ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("shoppingCart");
	    if (shoppingCart == null) {
		shoppingCart = initializationCart(principal.getName());
	    }
	    Cart cart;
	    switch (product) {
	    case PRODUCT_PLYWOOD:
		shoppingCart.addPlywood(plywoodService.findById(id));
		for (ShoppingCartPlywood item : shoppingCart.getItemsPlywood()) {
		    if (item.getProduct().getProduct_ID().equals(id)) {
			cart = new Cart(principal.getName(), PRODUCT_PLYWOOD, id, item.getQuantity());
			Cart existCart = cartService.findOne(principal.getName(), product, id);
			Actions actions = new Actions(principal.getName(), "Add to cart: " + item.getProduct());
			if (existCart != null) {
			    cart.setId(existCart.getId());
			    actions = new Actions(principal.getName(),
				    "Updated the number in the cart: " + item.getProduct() + ", " + item.getQuantity()
					    + " -> " + (item.getQuantity() + 1));
			}
			cartService.save(cart);
			actionsService.save(actions);
			break;
		    }
		}
		break;
	    case PRODUCT_PARTICLE_BOARD:
		shoppingCart.addParticleBoard(particleBoardService.findById(id));
		for (ShoppingCartParticleBoard item : shoppingCart.getItemsParticleBoard()) {
		    if (item.getProduct().getProduct_ID().equals(id)) {
			cart = new Cart(principal.getName(), PRODUCT_PARTICLE_BOARD, id, item.getQuantity());
			Cart existCart = cartService.findOne(principal.getName(), product, id);
			Actions actions = new Actions(principal.getName(), "Add to cart: " + item.getProduct());
			if (existCart != null) {
			    cart.setId(existCart.getId());
			    actions = new Actions(principal.getName(),
				    "Updated the number in the cart: " + item.getProduct() + ", " + item.getQuantity()
					    + " -> " + (item.getQuantity() + 1));
			}
			cartService.save(cart);
			actionsService.save(actions);
			break;
		    }
		}
		break;
	    default:
		break;
	    }
	    session.setAttribute("shoppingCart", shoppingCart);
	    int[] array = { shoppingCart.getNumberOfItems(), shoppingCart.getTotal() };
	    return array;
	} catch (Exception e) {
	    errorsService.save(new Errors("Add to cart", e.getMessage()));
	}
	return null;
    }

    @RequestMapping(value = "cart/updateCart", method = RequestMethod.GET)
    public @ResponseBody int[] updateCart(HttpSession session, Principal principal) {
	try {
	    ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("shoppingCart");
	    if (shoppingCart == null) {
		shoppingCart = initializationCart(principal.getName());
	    }
	    session.setAttribute("shoppingCart", shoppingCart);
	    int[] array = { shoppingCart.getNumberOfItems(), shoppingCart.getTotal() };
	    return array;
	} catch (Exception e) {
	    errorsService.save(new Errors("Update cart", e.getMessage()));
	}
	return null;
    }

    @RequestMapping(value = "cart", method = RequestMethod.GET)
    public ModelAndView cart(HttpSession session, Principal principal) {
	ModelAndView modelAndView = new ModelAndView("cart");
	try {
	    ShoppingCart shoppingCart = initializationCart(principal.getName());
	    session.setAttribute("shoppingCart", shoppingCart);
	    modelAndView.addObject("cart", shoppingCart);
	} catch (Exception e) {
	    errorsService.save(new Errors("Show cart page", e.getMessage()));
	}
	return modelAndView;
    }

    @RequestMapping(value = "cart/changeTheNumberOf", method = RequestMethod.GET)
    public @ResponseBody int[] changeTheNumberOf(@RequestParam("operation") String operation,
	    @RequestParam("product") String product, @RequestParam("id") String id, HttpSession session,
	    Principal principal) {
	try {
	    ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("shoppingCart");
	    if (shoppingCart == null) {
		return null;
	    }
	    Cart cart;
	    int[] array = {};
	    switch (product) {
	    case PRODUCT_PLYWOOD:
		for (ShoppingCartPlywood items : shoppingCart.getItemsPlywood()) {
		    if (items.getProduct().getProduct_ID().equals(id)) {
			Actions actions = new Actions();
			switch (operation) {
			case "minus":
			    actions = new Actions(principal.getName(),
				    "Updated the number in the cart: " + items.getProduct() + ", " + items.getQuantity()
					    + " -> " + (items.getQuantity() - 1));
			    items.decrementQuantity();
			    break;
			case "plus":
			    actions = new Actions(principal.getName(),
				    "Updated the number in the cart: " + items.getProduct() + ", " + items.getQuantity()
					    + " -> " + (items.getQuantity() + 1));
			    items.incrementQuantity();
			    break;
			default:
			    break;
			}
			cart = cartService.findOne(principal.getName(), product, items.getProduct().getProduct_ID());
			cart.setCount_product(items.getQuantity());
			array = new int[] { items.getQuantity(), items.getProduct().getPrice(),
				shoppingCart.getNumberOfItems(), shoppingCart.getTotal() };
			cartService.save(cart);
			actionsService.save(actions);
			break;
		    }
		}
		break;
	    case PRODUCT_PARTICLE_BOARD:
		for (ShoppingCartParticleBoard items : shoppingCart.getItemsParticleBoard()) {
		    if (items.getProduct().getProduct_ID().equals(id)) {
			Actions actions = new Actions();
			switch (operation) {
			case "minus":
			    items.decrementQuantity();
			    actions = new Actions(principal.getName(),
				    "Updated the number in the cart: " + items.getProduct() + ", " + items.getQuantity()
					    + " -> " + (items.getQuantity() - 1));
			    break;
			case "plus":
			    items.incrementQuantity();
			    actions = new Actions(principal.getName(),
				    "Updated the number in the cart: " + items.getProduct() + ", " + items.getQuantity()
					    + " -> " + (items.getQuantity() + 1));
			    break;
			default:
			    break;
			}
			cart = cartService.findOne(principal.getName(), product, items.getProduct().getProduct_ID());
			cart.setCount_product(items.getQuantity());
			array = new int[] { items.getQuantity(), items.getProduct().getPrice(),
				shoppingCart.getNumberOfItems(), shoppingCart.getTotal() };
			cartService.save(cart);
			actionsService.save(actions);
			break;
		    }
		}
		break;
	    default:
		break;
	    }
	    session.setAttribute("shoppingCart", shoppingCart);
	    return array;
	} catch (Exception e) {
	    errorsService.save(new Errors("Changing the number in the cart", e.getMessage()));
	}
	return null;
    }

    @RequestMapping(value = "cart/deleteFromCart", method = RequestMethod.GET)
    public String deleteFromCart(@RequestParam("product") String product, @RequestParam("id") String id,
	    HttpSession session, Principal principal) {
	try {
	    ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("shoppingCart");
	    if (shoppingCart == null) {
		return null;
	    }
	    Actions actions;
	    Cart cart;
	    switch (product) {
	    case PRODUCT_PLYWOOD:
		Plywood plywood = new Plywood();
		plywood.setProduct_ID(id);
		shoppingCart.updatePlywood(plywood, 0);
		cart = cartService.findOne(principal.getName(), product, id);
		cartService.delete(cart);
		actions = new Actions(principal.getName(), "Delete from cart: " + plywood);
		actionsService.save(actions);
		break;
	    case PRODUCT_PARTICLE_BOARD:
		ParticleBoard particleBoard = new ParticleBoard();
		particleBoard.setProduct_ID(id);
		shoppingCart.updateParticleBoard(particleBoard, 0);
		cart = cartService.findOne(principal.getName(), product, id);
		cartService.delete(cart);
		actions = new Actions(principal.getName(), "Delete from cart: " + particleBoard);
		actionsService.save(actions);
		break;
	    default:
		break;
	    }
	} catch (Exception e) {
	    errorsService.save(new Errors("Delete from cart", e.getMessage()));
	}
	return "redirect:/cart.html";
    }

    @RequestMapping(value = "cart/checkout.html", method = RequestMethod.GET)
    public ModelAndView add(HttpSession session, Principal principal, RedirectAttributes redirectAttributes,
	    Locale locale) {
	ModelAndView mv = new ModelAndView("checkout");
	try {
	    ShoppingCart shoppingCart = initializationCart(principal.getName());
	    if (shoppingCart.getNumberOfItems() <= 0) {
		redirectAttributes.addFlashAttribute("resultMessage",
			messageSource.getMessage("main.cart.empty", null, locale));
		RedirectView redirectView = new RedirectView(
			session.getServletContext().getContextPath() + "/cart.html");
		mv.setView(redirectView);
		return mv;
	    }
	    mv.addObject("indent", new Indent());
	    mv.addObject("cart", shoppingCart);
	} catch (Exception e) {
	    errorsService.save(new Errors("Show checkout page", e.getMessage()));
	}
	return mv;
    }

    @RequestMapping(value = "cart/makeOrder", method = RequestMethod.POST)
    public ModelAndView makeOrder(@ModelAttribute("indent") Indent indent, HttpSession session,
	    RedirectAttributes redirectAttributes, Principal principal, Locale locale) {
	ModelAndView modelAndView = new ModelAndView();
	String resultMessage = "";
	try {
	    ShoppingCart shoppingCart = initializationCart(principal.getName());
	    if (shoppingCart.getNumberOfItems() <= 0) {
		RedirectView redirectView = new RedirectView(
			session.getServletContext().getContextPath() + "/cart.html");
		modelAndView.setView(redirectView);
		redirectAttributes.addFlashAttribute("resultMessage",
			messageSource.getMessage("main.cart.empty", null, locale));
		return modelAndView;
	    }
	    indent.setTookOrder(principal.getName());
	    String contentsOrder = "";
	    for (ShoppingCartPlywood item : shoppingCart.getItemsPlywood()) {
		contentsOrder += item.getProduct().toString() + ", " + item.getQuantity() + "pcs, " + item.getTotal()
			+ "$; <br>";
	    }
	    for (ShoppingCartParticleBoard item : shoppingCart.getItemsParticleBoard()) {
		contentsOrder += item.getProduct().toString() + ", " + item.getQuantity() + "pcs, " + item.getTotal()
			+ "$; <br>";
	    }
	    indent.setContentsOrder(contentsOrder);
	    indent.setStatus("Open");
	    indentService.save(indent);

	    EmailSender emailSender = new EmailSender(ManagementResourses.getValue("email.login"),
		    ManagementResourses.getValue("email.password"));
	    String message = messageSource.getMessage("main.checkout.fio_customer", null, locale) + ": "
		    + indent.getFioCustomer() + ",\n"
		    + messageSource.getMessage("main.checkout.phone_customer", null, locale) + ": "
		    + indent.getPhoneCustomer() + ",\n"
		    + messageSource.getMessage("main.checkout.address_customer", null, locale) + ": "
		    + indent.getAddress() + ",\n" + messageSource.getMessage("main.cart.order", null, locale) + ": "
		    + indent.getContentsOrder().replaceAll("<br>", "") + ",\n"
		    + messageSource.getMessage("main.checkout.status_order", null, locale) + ": " + indent.getStatus()
		    + ",\n" + messageSource.getMessage("main.checkout.took_order", null, locale) + ": "
		    + indent.getTookOrder() + ".";
	    List<EmailRecipient> listRecipients = emailRecipientService.findAll();

	    for (EmailRecipient recipient : listRecipients) {
		emailSender.send(messageSource.getMessage("main.cart.order", null, locale), message,
			recipient.getEmail());
	    }

	    for (ShoppingCartPlywood item : shoppingCart.getItemsPlywood()) {
		Cart cart = cartService.findOne(principal.getName(), PRODUCT_PLYWOOD,
			item.getProduct().getProduct_ID());
		cartService.delete(cart);
	    }
	    for (ShoppingCartParticleBoard item : shoppingCart.getItemsParticleBoard()) {
		Cart cart = cartService.findOne(principal.getName(), PRODUCT_PARTICLE_BOARD,
			item.getProduct().getProduct_ID());
		cartService.delete(cart);
	    }
	    shoppingCart.clear();
	    session.setAttribute("shoppingCart", shoppingCart);
	    resultMessage = messageSource.getMessage("code_messages.successfully", null, locale);

	    Actions actions = new Actions(principal.getName(), "Sent an order: " + message);
	    actionsService.save(actions);
	} catch (Exception e) {
	    resultMessage = messageSource.getMessage("code_messages.error", null, locale);
	    errorsService.save(new Errors("Make order", e.getMessage()));
	}
	RedirectView redirectView = new RedirectView(session.getServletContext().getContextPath() + "/cart.html");
	modelAndView.setView(redirectView);
	redirectAttributes.addFlashAttribute("resultMessage", resultMessage);
	return modelAndView;
    }

    @RequestMapping(value = "cart/track-your-order", method = RequestMethod.GET)
    public ModelAndView plywood(HttpSession session) {
	ModelAndView mv = new ModelAndView("order");
	try {
	    List<Indent> list = indentService.findAll();
	    mv.addObject("list", list);
	} catch (Exception e) {
	    errorsService.save(new Errors("Show order page", e.getMessage()));
	}
	return mv;
    }

    private ShoppingCart initializationCart(String username) {
	ShoppingCart shoppingCart = new ShoppingCart();
	List<Cart> listCart = cartService.findAllByName(username);
	Plywood plywood;
	ParticleBoard particleBoard;
	for (Cart itemCart : listCart) {
	    switch (itemCart.getProduct()) {
	    case PRODUCT_PLYWOOD:
		plywood = plywoodService.findById(itemCart.getProduct_ID());
		if (plywood != null) {
		    shoppingCart.addPlywood(plywood);
		    if (itemCart.getCount_product() > 1) {
			shoppingCart.updatePlywood(plywood, itemCart.getCount_product());
		    }
		} else {
		    cartService.delete(cartService.findOne(username, itemCart.getProduct(), itemCart.getProduct_ID()));
		}

		break;
	    case PRODUCT_PARTICLE_BOARD:
		particleBoard = particleBoardService.findById(itemCart.getProduct_ID());
		if (particleBoard != null) {
		    shoppingCart.addParticleBoard(particleBoard);
		    if (itemCart.getCount_product() > 1) {
			shoppingCart.updateParticleBoard(particleBoard, itemCart.getCount_product());
		    }
		} else {
		    cartService.delete(cartService.findOne(username, itemCart.getProduct(), itemCart.getProduct_ID()));
		}
		break;
	    default:
		break;
	    }
	}
	return shoppingCart;
    }
}
