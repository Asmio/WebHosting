package com.eftech.wood.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
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

import com.eftech.wood.entity.ParticleBoard;
import com.eftech.wood.entity.Plywood;
import com.eftech.wood.entity.UploadedFile;
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

    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView admin(HttpSession session) {
	ModelAndView mv = new ModelAndView("admin_pl");

	List<Plywood> list = plywoodService.findAll();
	mv.addObject("list", list);
	session.setAttribute("product", PRODUCT_PLYWOOD);
	return mv;
    }

    @RequestMapping(value = "/plywood", method = RequestMethod.GET)
    public ModelAndView plywood(HttpSession session) {
	ModelAndView mv = new ModelAndView("admin_pl");

	List<Plywood> list = plywoodService.findAll();
	mv.addObject("list", list);
	session.setAttribute("product", PRODUCT_PLYWOOD);
	return mv;
    }

    @RequestMapping(value = "/particleboard", method = RequestMethod.GET)
    public ModelAndView particleBoard(HttpSession session) {
	ModelAndView mv = new ModelAndView("admin_pb");

	List<ParticleBoard> list = particleBoardService.findAll();
	mv.addObject("list", list);
	session.setAttribute("product", PRODUCT_PARTICLE_BOARD);
	return mv;
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView add(HttpSession session) {
	ModelAndView mv = new ModelAndView("add_product");
	if (session.getAttribute("product").equals(PRODUCT_PLYWOOD)) {
	    mv.addObject("newProduct", new Plywood());
	} else {
	    if (session.getAttribute("product").equals(PRODUCT_PARTICLE_BOARD)) {
		mv.addObject("newProduct", new ParticleBoard());
	    }
	}
	return mv;
    }

    @RequestMapping(value = "/addProductPlywood", method = RequestMethod.POST)
    public ModelAndView addProductPlywood(@ModelAttribute(value = "newProduct") Plywood newProduct, HttpSession session,
	    RedirectAttributes redirectAttributes) {
	ModelAndView modelAndView = new ModelAndView();
	String resultAddMessage = "";
	try {
	    plywoodService.save(newProduct);
	    RedirectView redirectView = new RedirectView("add");
	    modelAndView.setView(redirectView);
	    resultAddMessage = "Successfully";
	} catch (Exception e) {
	    resultAddMessage = e.getMessage();
	}
	redirectAttributes.addFlashAttribute("resultAddMessage", resultAddMessage);
	return modelAndView;
    }

    @RequestMapping(value = "/addProductParticleBoard", method = RequestMethod.POST)
    public ModelAndView addProductParticleBoard(@ModelAttribute(value = "newProduct") ParticleBoard newProduct,
	    HttpSession session, RedirectAttributes redirectAttributes) {
	ModelAndView modelAndView = new ModelAndView();
	String resultAddMessage = "";
	try {
	    particleBoardService.save(newProduct);
	    RedirectView redirectView = new RedirectView("add");
	    modelAndView.setView(redirectView);
	    resultAddMessage = "Successfully";
	} catch (Exception e) {
	    resultAddMessage = e.getMessage();
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
	    e.printStackTrace();
	}
	return modelAndView;
    }

    @RequestMapping(value = "/editPlywood", method = RequestMethod.POST)
    public ModelAndView editPlywood(@ModelAttribute(value = "editProduct") Plywood editProduct, HttpSession session,
	    RedirectAttributes redirectAttributes) {
	ModelAndView modelAndView = new ModelAndView("");
	String resultEditMessage = "";
	try {
	    plywoodService.save(editProduct);
	    RedirectView redirectView = new RedirectView(
		    "edit?product=" + PRODUCT_PLYWOOD + "&id=" + editProduct.getProduct_ID());
	    modelAndView.setView(redirectView);
	    resultEditMessage = "Successfully";
	} catch (Exception e) {
	    resultEditMessage = e.getMessage();
	}
	redirectAttributes.addFlashAttribute("resultEditMessage", resultEditMessage);
	return modelAndView;
    }

    @RequestMapping(value = "/editParticleBoard", method = RequestMethod.POST)
    public ModelAndView editPlywood(@ModelAttribute(value = "editProduct") ParticleBoard editProduct,
	    HttpSession session, RedirectAttributes redirectAttributes) {
	ModelAndView modelAndView = new ModelAndView("");
	String resultEditMessage = "";
	try {
	    particleBoardService.save(editProduct);
	    RedirectView redirectView = new RedirectView(
		    "edit?product=" + PRODUCT_PARTICLE_BOARD + "&id=" + editProduct.getProduct_ID());
	    modelAndView.setView(redirectView);
	    resultEditMessage = "Successfully";
	} catch (Exception e) {
	    resultEditMessage = e.getMessage();
	}
	redirectAttributes.addFlashAttribute("resultEditMessage", resultEditMessage);
	return modelAndView;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public ModelAndView delete(@RequestParam(value = "id") String id, @RequestParam(value = "product") String product,
	    HttpSession session) {
	ModelAndView modelAndView = new ModelAndView("");

	if (product.equals(PRODUCT_PLYWOOD)) {
	    try {
		Plywood plywood = plywoodService.findById(id);
		plywoodService.delete(plywood);

		RedirectView redirectView = new RedirectView("plywood");
		modelAndView.setView(redirectView);
	    } catch (Exception e) {
		e.printStackTrace();
	    }
	} else {
	    if (product.equals(PRODUCT_PARTICLE_BOARD)) {
		try {
		    ParticleBoard particleBoard = particleBoardService.findById(id);
		    particleBoardService.delete(particleBoard);

		    RedirectView redirectView = new RedirectView("particleboard");
		    modelAndView.setView(redirectView);
		} catch (Exception e) {
		    e.printStackTrace();
		}
	    }
	}
	return modelAndView;
    }

    @RequestMapping(value = "/uploadExcelPriceFile", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView uploadExcelPriceFile(@ModelAttribute("uploadFiles") UploadedFile uploadFile,
	    HttpSession session, RedirectAttributes redirectAttributes) {

	ModelAndView modelAndView = new ModelAndView("add");
	String resultExcelPriceMessage = "";

	List<MultipartFile> files = uploadFile.getFiles();
	for (MultipartFile multipartFile : files) {
	    try {
		if (multipartFile.getSize() > 0) {
		    XSSFWorkbook workBook = new XSSFWorkbook(multipartFile.getInputStream());
		    XSSFSheet sheet = workBook.getSheetAt(0);
		    XSSFRow row;
		    String product = "";
		    Plywood plywood = new Plywood();
		    ParticleBoard particleBoard = new ParticleBoard();
		    resultExcelPriceMessage += multipartFile.getOriginalFilename() + ": ";
		    int rowType;
		    for (int i = 0; i < sheet.getPhysicalNumberOfRows(); i++) {
			try {
			    row = sheet.getRow(i);
			    product = String.valueOf(row.getCell(0).getRichStringCellValue());
			    if (product.equals(PRODUCT_PLYWOOD)) {
				rowType = row.getCell(1).getCellType();
				switch (rowType) {
				case 0:
				    plywood = plywoodService
					    .findById(String.valueOf(row.getCell(1).getNumericCellValue()));
				    break;
				case 1:
				    plywood = plywoodService
					    .findById(String.valueOf(row.getCell(1).getStringCellValue()));
				    break;
				default:
				    throw new Exception("Incorrect cell type");
				}
				rowType = row.getCell(2).getCellType();
				switch (rowType) {
				case 0:
				    plywood.setPrice((int) (row.getCell(2).getNumericCellValue()));
				    break;
				case 1:
				    plywood.setPrice(Integer.parseInt(row.getCell(2).getStringCellValue()));
				    break;
				default:
				    throw new Exception("Incorrect cell type");
				}
				plywoodService.save(plywood);
				resultExcelPriceMessage += product + " " + "(row:" + (i + 1) + ")-updated;  ";
			    } else {
				if (product.equals(PRODUCT_PARTICLE_BOARD)) {
				    rowType = row.getCell(1).getCellType();
				    switch (rowType) {
				    case 0:
					particleBoard = particleBoardService
						.findById(String.valueOf(row.getCell(1).getNumericCellValue()));
					break;
				    case 1:
					particleBoard = particleBoardService
						.findById(String.valueOf(row.getCell(1).getStringCellValue()));
					break;
				    default:
					throw new Exception("Incorrect cell type");
				    }
				    rowType = row.getCell(2).getCellType();
				    switch (rowType) {
				    case 0:
					particleBoard.setPrice((int) (row.getCell(2).getNumericCellValue()));
					break;
				    case 1:
					particleBoard.setPrice(Integer.parseInt(row.getCell(2).getStringCellValue()));
					break;
				    default:
					throw new Exception("Incorrect cell type");
				    }
				    particleBoardService.save(particleBoard);
				    resultExcelPriceMessage += product + "(row:" + (i + 1) + ")-updated;  ";
				}
			    }
			} catch (Exception e) {
			    resultExcelPriceMessage += product + "(row:" + (i + 1) + ")-error: " + e.getMessage()
				    + ";  ";
			}
		    }
		    workBook.close();
		} else {
		    resultExcelPriceMessage += multipartFile.getOriginalFilename() + "-error: empty;  ";
		}
	    } catch (Exception e) {
		resultExcelPriceMessage += multipartFile.getOriginalFilename() + "-error: " + e.getMessage() + ";  ";
		e.printStackTrace();
	    }
	}
	RedirectView redirectView = new RedirectView("add");
	redirectAttributes.addFlashAttribute("resultExcelPriceMessage", resultExcelPriceMessage);
	modelAndView.setView(redirectView);
	return modelAndView;
    }

    @SuppressWarnings("resource")
    @RequestMapping(value = "/uploadExcelInfoFile", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView uploadExcelInfoFile(@ModelAttribute("uploadFiles") UploadedFile uploadFile, HttpSession session,
	    RedirectAttributes redirectAttributes) {

	ModelAndView modelAndView = new ModelAndView("add");
	String resultExcelInfoMessage = "";
	int rowType;

	List<MultipartFile> files = uploadFile.getFiles();
	for (MultipartFile multipartFile : files) {
	    try {
		if (multipartFile.getSize() > 0) {
		    XSSFWorkbook workBook = new XSSFWorkbook(multipartFile.getInputStream());
		    XSSFSheet sheet = workBook.getSheetAt(0);

		    String product = String.valueOf(sheet.getRow(0).getCell(1).getRichStringCellValue());
		    if (product.equals(PRODUCT_PLYWOOD)) {
			Plywood plywood = new Plywood();
			rowType = sheet.getRow(1).getCell(1).getCellType();
			switch (rowType) {
			case 0:
			    plywood.setProduct_ID(String.valueOf(sheet.getRow(1).getCell(1).getNumericCellValue()));
			    break;
			case 1:
			    plywood.setProduct_ID(sheet.getRow(1).getCell(1).getStringCellValue());
			    break;
			default:
			    throw new Exception("Incorrect cell type");
			}
			plywood.setWater_resistance(String.valueOf(sheet.getRow(2).getCell(1).getStringCellValue()));
			plywood.setSanded_or_unsanded(String.valueOf(sheet.getRow(3).getCell(1).getStringCellValue()));
			rowType = sheet.getRow(4).getCell(1).getCellType();
			switch (rowType) {
			case 0:
			    plywood.setThickness((int) (sheet.getRow(4).getCell(1).getNumericCellValue()));
			    break;
			case 1:
			    plywood.setThickness(Integer.parseInt(sheet.getRow(4).getCell(1).getStringCellValue()));
			    break;
			default:
			    throw new Exception("Incorrect cell type");
			}
			rowType = sheet.getRow(5).getCell(1).getCellType();
			switch (rowType) {
			case 0:
			    plywood.setLength((int) (sheet.getRow(5).getCell(1).getNumericCellValue()));
			    break;
			case 1:
			    plywood.setLength(Integer.parseInt(sheet.getRow(5).getCell(1).getStringCellValue()));
			    break;
			default:
			    throw new Exception("Incorrect cell type");
			}
			rowType = sheet.getRow(6).getCell(1).getCellType();
			switch (rowType) {
			case 0:
			    plywood.setWeight((int) (sheet.getRow(6).getCell(1).getNumericCellValue()));
			    break;
			case 1:
			    plywood.setWeight(Integer.parseInt(sheet.getRow(6).getCell(1).getStringCellValue()));
			    break;
			default:
			    throw new Exception("Incorrect cell type");
			}
			plywood.setFoto_1(String.valueOf(sheet.getRow(7).getCell(1).getStringCellValue()));
			plywood.setFoto_2(String.valueOf(sheet.getRow(8).getCell(1).getStringCellValue()));
			plywood.setFoto_3(String.valueOf(sheet.getRow(9).getCell(1).getStringCellValue()));
			plywood.setFoto_4(String.valueOf(sheet.getRow(10).getCell(1).getStringCellValue()));
			plywood.setDescription_bench(
				String.valueOf(sheet.getRow(11).getCell(1).getRichStringCellValue()));

			plywoodService.save(plywood);
		    } else {
			if (product.equals(PRODUCT_PARTICLE_BOARD)) {
			    ParticleBoard particleBoard = new ParticleBoard();
			    rowType = sheet.getRow(1).getCell(1).getCellType();
			    switch (rowType) {
			    case 0:
				particleBoard.setProduct_ID(
					String.valueOf(sheet.getRow(1).getCell(1).getNumericCellValue()));
				break;
			    case 1:
				particleBoard.setProduct_ID(sheet.getRow(1).getCell(1).getStringCellValue());
				break;
			    default:
				throw new Exception("Incorrect cell type");
			    }
			    rowType = sheet.getRow(2).getCell(1).getCellType();
			    switch (rowType) {
			    case 0:
				particleBoard.setLaminated((int) (sheet.getRow(2).getCell(1).getNumericCellValue()));
				break;
			    case 1:
				particleBoard.setLaminated(
					Integer.parseInt(sheet.getRow(2).getCell(1).getStringCellValue()));
				break;
			    default:
				throw new Exception("Incorrect cell type");
			    }
			    rowType = sheet.getRow(4).getCell(1).getCellType();
			    switch (rowType) {
			    case 0:
				particleBoard.setThickness((int) (sheet.getRow(3).getCell(1).getNumericCellValue()));
				break;
			    case 1:
				particleBoard.setThickness(
					Integer.parseInt(sheet.getRow(3).getCell(1).getStringCellValue()));
				break;
			    default:
				throw new Exception("Incorrect cell type");
			    }
			    rowType = sheet.getRow(5).getCell(1).getCellType();
			    switch (rowType) {
			    case 0:
				particleBoard.setLength((int) (sheet.getRow(4).getCell(1).getNumericCellValue()));
				break;
			    case 1:
				particleBoard
					.setLength(Integer.parseInt(sheet.getRow(4).getCell(1).getStringCellValue()));
				break;
			    default:
				throw new Exception("Incorrect cell type");
			    }
			    rowType = sheet.getRow(6).getCell(1).getCellType();
			    switch (rowType) {
			    case 0:
				particleBoard.setWeight((int) (sheet.getRow(5).getCell(1).getNumericCellValue()));
				break;
			    case 1:
				particleBoard
					.setWeight(Integer.parseInt(sheet.getRow(5).getCell(1).getStringCellValue()));
				break;
			    default:
				throw new Exception("Incorrect cell type");
			    }
			    particleBoard.setFoto_1(String.valueOf(sheet.getRow(6).getCell(1).getStringCellValue()));
			    particleBoard.setFoto_2(String.valueOf(sheet.getRow(7).getCell(1).getStringCellValue()));
			    particleBoard.setFoto_3(String.valueOf(sheet.getRow(8).getCell(1).getStringCellValue()));
			    particleBoard.setFoto_4(String.valueOf(sheet.getRow(9).getCell(1).getStringCellValue()));
			    particleBoard.setDescription_bench(
				    String.valueOf(sheet.getRow(10).getCell(1).getStringCellValue()));

			    particleBoardService.save(particleBoard);
			}
		    }
		    workBook.close();
		    resultExcelInfoMessage += multipartFile.getOriginalFilename() + "-successfully;  ";
		} else {
		    resultExcelInfoMessage += multipartFile.getOriginalFilename() + "-error: empty;  ";
		}
	    } catch (Exception e) {
		resultExcelInfoMessage += multipartFile.getOriginalFilename() + "-error: " + e.getMessage() + ";  ";
		e.printStackTrace();
	    }
	}
	RedirectView redirectView = new RedirectView("add");
	redirectAttributes.addFlashAttribute("resultExcelInfoMessage", resultExcelInfoMessage);
	modelAndView.setView(redirectView);
	return modelAndView;
    }
}
