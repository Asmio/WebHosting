package com.eftech.wood.controllers;

import java.security.Principal;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.eftech.wood.entity.Actions;
import com.eftech.wood.entity.EmailRecipient;
import com.eftech.wood.entity.Errors;
import com.eftech.wood.entity.ParticleBoard;
import com.eftech.wood.entity.Plywood;
import com.eftech.wood.entity.UploadedFile;
import com.eftech.wood.service.ActionsService;
import com.eftech.wood.service.EmailRecipientService;
import com.eftech.wood.service.ErrorsService;
import com.eftech.wood.service.FileService;
import com.eftech.wood.service.ParticleBoardService;
import com.eftech.wood.service.PlywoodService;

@Controller
@RequestMapping("/admin")
public class ControllerAdmin {

    private static final String PRODUCT_PLYWOOD = "Plywood";
    private static final String PRODUCT_PARTICLE_BOARD = "ParticleBoard";

    @Autowired
    private PlywoodService plywoodService;

    @Autowired
    private ParticleBoardService particleBoardService;

    @Autowired
    private FileService fileService;

    @Autowired
    private EmailRecipientService emailRecipientService;

    @Autowired
    private ActionsService actionsService;

    @Autowired
    private ErrorsService errorsService;

    @Autowired
    private ServletContext servletContext;

    @Autowired
    private MessageSource messageSource;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView admin(HttpSession session) {
	ModelAndView mv = new ModelAndView("admin");
	try {
	    mv.addObject("emailRecipients", emailRecipientService.findAll());
	} catch (Exception e) {
	    errorsService.save(new Errors("Show admin page", e.getMessage()));
	}
	return mv;
    }

    @RequestMapping(value = "/changeEmailRecipient", method = RequestMethod.POST)
    public ModelAndView changeEmailRecipient(@RequestParam(value = "oldEmail") String oldEmail,
	    @RequestParam(value = "newEmail") String newEmail, HttpSession session, HttpServletRequest request,
	    RedirectAttributes redirectAttributes, Locale locale, Principal principal) {
	ModelAndView modelAndView = new ModelAndView("");
	try {
	    EmailRecipient emailRecipient = emailRecipientService.findOne(oldEmail);
	    emailRecipient.setEmail(newEmail);
	    emailRecipientService.save(emailRecipient);
	    Actions actions = new Actions(principal.getName(),
		    "Change email recipient: " + oldEmail + " -> " + newEmail);
	    actionsService.save(actions);
	} catch (Exception e) {
	    errorsService.save(new Errors("Change email sender", e.getMessage()));
	}
	RedirectView redirectView = new RedirectView(request.getContextPath() + "/admin");
	redirectAttributes.addFlashAttribute("emailRecipients", emailRecipientService.findAll());
	modelAndView.setView(redirectView);
	return modelAndView;
    }

    @RequestMapping(value = "/plywood", method = RequestMethod.GET)
    public ModelAndView plywood(HttpSession session) {
	ModelAndView mv = new ModelAndView("admin_pl");
	try {
	    List<Plywood> list = plywoodService.findAll();
	    mv.addObject("list", list);
	    session.setAttribute("product", PRODUCT_PLYWOOD);
	} catch (Exception e) {
	    errorsService.save(new Errors("Show admin product page", e.getMessage()));
	}
	return mv;
    }

    @RequestMapping(value = "/particleboard", method = RequestMethod.GET)
    public ModelAndView particleBoard(HttpSession session) {
	ModelAndView mv = new ModelAndView("admin_pb");
	try {
	    List<ParticleBoard> list = particleBoardService.findAll();
	    mv.addObject("list", list);
	    session.setAttribute("product", PRODUCT_PARTICLE_BOARD);
	} catch (Exception e) {
	    errorsService.save(new Errors("Show admin product page", e.getMessage()));
	}
	return mv;
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView add(HttpSession session) {
	ModelAndView mv = new ModelAndView("add_product");
	try {
	    if (session.getAttribute("product").equals(PRODUCT_PLYWOOD)) {
		mv.addObject("newProduct", new Plywood());
	    } else {
		if (session.getAttribute("product").equals(PRODUCT_PARTICLE_BOARD)) {
		    mv.addObject("newProduct", new ParticleBoard());
		}
	    }
	} catch (Exception e) {
	    errorsService.save(new Errors("Show admin add product page", e.getMessage()));
	}
	return mv;
    }

    @RequestMapping(value = "/addProductPlywood", method = RequestMethod.POST)
    public ModelAndView addProductPlywood(@ModelAttribute(value = "newProduct") Plywood newProduct, HttpSession session,
	    RedirectAttributes redirectAttributes, Locale locale, Principal principal) {
	ModelAndView modelAndView = new ModelAndView();
	String resultAddMessage = "";
	try {
	    plywoodService.save(newProduct);
	    RedirectView redirectView = new RedirectView("add");
	    modelAndView.setView(redirectView);
	    resultAddMessage = messageSource.getMessage("code_messages.successfully", null, locale);
	    Actions actions = new Actions(principal.getName(), "Add product: " + newProduct.getFullInfo());
	    actionsService.save(actions);
	} catch (Exception e) {
	    resultAddMessage = e.getMessage();
	    errorsService.save(new Errors("Add product", e.getMessage()));
	}
	redirectAttributes.addFlashAttribute("resultAddMessage", resultAddMessage);
	return modelAndView;
    }

    @RequestMapping(value = "/addProductParticleBoard", method = RequestMethod.POST)
    public ModelAndView addProductParticleBoard(@ModelAttribute(value = "newProduct") ParticleBoard newProduct,
	    HttpSession session, RedirectAttributes redirectAttributes, Locale locale, Principal principal) {
	ModelAndView modelAndView = new ModelAndView();
	String resultAddMessage = "";
	try {
	    particleBoardService.save(newProduct);
	    RedirectView redirectView = new RedirectView("add");
	    modelAndView.setView(redirectView);
	    resultAddMessage = messageSource.getMessage("code_messages.successfully", null, locale);
	    Actions actions = new Actions(principal.getName(), "Add product: " + newProduct.getFullInfo());
	    actionsService.save(actions);
	} catch (Exception e) {
	    resultAddMessage = e.getMessage();
	    errorsService.save(new Errors("Add product", e.getMessage()));
	}
	redirectAttributes.addFlashAttribute("resultAddMessage", resultAddMessage);
	return modelAndView;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam(value = "id") String id, @RequestParam(value = "product") String product) {
	ModelAndView modelAndView = new ModelAndView("edit_product");
	try {
	    if (product.equals(PRODUCT_PLYWOOD)) {
		Plywood plywood = plywoodService.findById(id);
		modelAndView.addObject("editProduct", plywood);
	    } else {
		if (product.equals(PRODUCT_PARTICLE_BOARD)) {
		    ParticleBoard particleBoard = particleBoardService.findById(id);
		    modelAndView.addObject("editProduct", particleBoard);
		}
	    }
	} catch (Exception e) {
	    errorsService.save(new Errors("Show admin edit product page", e.getMessage()));
	}
	return modelAndView;
    }

    @RequestMapping(value = "/editPlywood", method = RequestMethod.POST)
    public ModelAndView editPlywood(@ModelAttribute(value = "editProduct") Plywood editProduct, HttpSession session,
	    RedirectAttributes redirectAttributes, Locale locale, Principal principal) {
	ModelAndView modelAndView = new ModelAndView("");
	String resultEditMessage = "";
	try {
	    Actions actions = new Actions(principal.getName(),
		    "Edit product: " + plywoodService.findById(editProduct.getProduct_ID()).getFullInfo() + " -> "
			    + editProduct.getFullInfo());
	    plywoodService.save(editProduct);
	    RedirectView redirectView = new RedirectView(
		    "edit?product=" + PRODUCT_PLYWOOD + "&id=" + editProduct.getProduct_ID());
	    modelAndView.setView(redirectView);
	    resultEditMessage = messageSource.getMessage("code_messages.successfully", null, locale);
	    actionsService.save(actions);
	} catch (Exception e) {
	    resultEditMessage = e.getMessage();
	    errorsService.save(new Errors("Edit product", e.getMessage()));
	}
	redirectAttributes.addFlashAttribute("resultEditMessage", resultEditMessage);
	return modelAndView;
    }

    @RequestMapping(value = "/editParticleBoard", method = RequestMethod.POST)
    public ModelAndView editPlywood(@ModelAttribute(value = "editProduct") ParticleBoard editProduct,
	    HttpSession session, RedirectAttributes redirectAttributes, Locale locale, Principal principal) {
	ModelAndView modelAndView = new ModelAndView("");
	String resultEditMessage = "";
	try {
	    Actions actions = new Actions(principal.getName(),
		    "Edit product: " + particleBoardService.findById(editProduct.getProduct_ID()).getFullInfo() + " -> "
			    + editProduct.getFullInfo());
	    particleBoardService.save(editProduct);
	    RedirectView redirectView = new RedirectView(
		    "edit?product=" + PRODUCT_PARTICLE_BOARD + "&id=" + editProduct.getProduct_ID());
	    modelAndView.setView(redirectView);
	    resultEditMessage = messageSource.getMessage("code_messages.successfully", null, locale);
	    actionsService.save(actions);
	} catch (Exception e) {
	    resultEditMessage = e.getMessage();
	    errorsService.save(new Errors("Edit product", e.getMessage()));
	}
	redirectAttributes.addFlashAttribute("resultEditMessage", resultEditMessage);
	return modelAndView;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public ModelAndView delete(@RequestParam(value = "id") String id, @RequestParam(value = "product") String product,
	    HttpSession session, Principal principal) {
	ModelAndView modelAndView = new ModelAndView("");

	if (product.equals(PRODUCT_PLYWOOD)) {
	    try {
		Plywood plywood = plywoodService.findById(id);
		plywoodService.delete(plywood);

		RedirectView redirectView = new RedirectView("plywood");
		modelAndView.setView(redirectView);
		Actions actions = new Actions(principal.getName(), "Delete product: " + plywood.getFullInfo());
		actionsService.save(actions);
	    } catch (Exception e) {
		errorsService.save(new Errors("Delete product", e.getMessage()));
	    }
	} else {
	    if (product.equals(PRODUCT_PARTICLE_BOARD)) {
		try {
		    ParticleBoard particleBoard = particleBoardService.findById(id);
		    particleBoardService.delete(particleBoard);

		    RedirectView redirectView = new RedirectView("particleboard");
		    modelAndView.setView(redirectView);
		    Actions actions = new Actions(principal.getName(),
			    "Delete product: " + particleBoard.getFullInfo());
		    actionsService.save(actions);
		} catch (Exception e) {
		    errorsService.save(new Errors("Delete product", e.getMessage()));
		}
	    }
	}
	return modelAndView;
    }

    @RequestMapping(value = "/uploadExcelPriceFile", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView uploadExcelPriceFile(@ModelAttribute("uploadFiles") UploadedFile uploadFile,
	    HttpSession session, RedirectAttributes redirectAttributes, Principal principal) {

	ModelAndView modelAndView = new ModelAndView("add");
	String resultExcelPriceMessage = "";
	try {
	    List<MultipartFile> files = uploadFile.getFiles();
	    for (MultipartFile multipartFile : files) {
		resultExcelPriceMessage += fileService.uploadExcelPriceFile(multipartFile, plywoodService,
			particleBoardService);
	    }
	    RedirectView redirectView = new RedirectView("add");
	    redirectAttributes.addFlashAttribute("resultExcelPriceMessage", resultExcelPriceMessage);
	    modelAndView.setView(redirectView);
	    Actions actions = new Actions(principal.getName(), "Update price from file: " + resultExcelPriceMessage);
	    actionsService.save(actions);
	} catch (Exception e) {
	    errorsService.save(new Errors("Upload price from file", e.getMessage()));
	}
	return modelAndView;
    }

    @RequestMapping(value = "/uploadExcelInfoFile", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView uploadExcelInfoFile(@ModelAttribute("uploadFiles") UploadedFile uploadFile, HttpSession session,
	    RedirectAttributes redirectAttributes, Principal principal) {

	ModelAndView modelAndView = new ModelAndView("add");
	String resultExcelInfoMessage = "";
	try {
	    List<MultipartFile> files = uploadFile.getFiles();
	    for (MultipartFile multipartFile : files) {
		resultExcelInfoMessage += fileService.uploadExcelInfoFile(multipartFile, plywoodService,
			particleBoardService);
	    }
	    RedirectView redirectView = new RedirectView("add");
	    redirectAttributes.addFlashAttribute("resultExcelInfoMessage", resultExcelInfoMessage);
	    modelAndView.setView(redirectView);
	    Actions actions = new Actions(principal.getName(), "Upload info from file: " + resultExcelInfoMessage);
	    actionsService.save(actions);
	} catch (Exception e) {
	    errorsService.save(new Errors("Upload info from file", e.getMessage()));
	}
	return modelAndView;
    }

    @RequestMapping(value = "/uploadPhoto", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView uploadPhoto(@ModelAttribute("uploadFiles") UploadedFile uploadFile, HttpSession session,
	    RedirectAttributes redirectAttributes, Principal principal) {

	ModelAndView modelAndView = new ModelAndView("add");
	String resultPhotoMessage = "";
	try {
	    List<MultipartFile> files = uploadFile.getFiles();
	    for (MultipartFile multipartFile : files) {
		resultPhotoMessage += fileService.uploadPhoto(multipartFile, servletContext);
	    }
	    RedirectView redirectView = new RedirectView("add");
	    redirectAttributes.addFlashAttribute("resultPhotoMessage", resultPhotoMessage);
	    modelAndView.setView(redirectView);
	    Actions actions = new Actions(principal.getName(), "Upload photo: " + resultPhotoMessage);
	    actionsService.save(actions);
	} catch (Exception e) {
	    errorsService.save(new Errors("Upload photo", e.getMessage()));
	}
	return modelAndView;
    }

}
