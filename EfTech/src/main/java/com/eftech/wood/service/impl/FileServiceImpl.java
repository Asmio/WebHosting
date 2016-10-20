package com.eftech.wood.service.impl;

import java.io.File;

import javax.servlet.ServletContext;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.eftech.wood.entity.ParticleBoard;
import com.eftech.wood.entity.Plywood;
import com.eftech.wood.service.FileService;
import com.eftech.wood.service.ParticleBoardService;
import com.eftech.wood.service.PlywoodService;

@Service
@Component
public class FileServiceImpl implements FileService {

    private static final String PRODUCT_PLYWOOD = "Plywood";
    private static final String PRODUCT_PARTICLE_BOARD = "ParticleBoard";
    private static final String PATH_PRODUCT_PHOTO = "/assets/images/products/";

    @Override
    public String uploadExcelPriceFile(MultipartFile multipartFile, PlywoodService plywoodService,
	    ParticleBoardService particleBoardService) {
	String resultExcelPriceMessage = "";
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
		String id = "";
		for (int i = 1; i < sheet.getPhysicalNumberOfRows(); i++) {
		    try {
			row = sheet.getRow(i);
			product = String.valueOf(row.getCell(0).getRichStringCellValue());
			switch (product) {
			case PRODUCT_PLYWOOD:
			    rowType = row.getCell(1).getCellType();
			    switch (rowType) {
			    case 0:
				id = String.valueOf(row.getCell(1).getNumericCellValue());
				plywood = plywoodService.findById(id);
				break;
			    case 1:
				id = String.valueOf(row.getCell(1).getStringCellValue());
				plywood = plywoodService.findById(id);
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
			    resultExcelPriceMessage += product + " " + id + "-updated;  ";

			    break;

			case PRODUCT_PARTICLE_BOARD:
			    rowType = row.getCell(1).getCellType();
			    switch (rowType) {
			    case 0:
				id = String.valueOf(row.getCell(1).getNumericCellValue());
				particleBoard = particleBoardService.findById(id);
				break;
			    case 1:
				id = String.valueOf(row.getCell(1).getStringCellValue());
				particleBoard = particleBoardService.findById(id);
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
			    resultExcelPriceMessage += product + " " + id + "-updated;  ";

			    break;

			default:
			    resultExcelPriceMessage += " (row " + (i + 1) + ")-error;  ";
			    break;
			}
		    } catch (Exception e) {
			resultExcelPriceMessage += product + " " + id + "-error: " + e.getMessage() + ";  ";
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
	return resultExcelPriceMessage;
    }

    @SuppressWarnings("resource")
    @Override
    public String uploadExcelInfoFile(MultipartFile multipartFile, PlywoodService plywoodService,
	    ParticleBoardService particleBoardService) {
	String resultExcelInfoMessage = "";
	int rowType;
	try {
	    if (multipartFile.getSize() > 0) {
		XSSFWorkbook workBook = new XSSFWorkbook(multipartFile.getInputStream());
		XSSFSheet sheet = workBook.getSheetAt(0);

		String product = String.valueOf(sheet.getRow(0).getCell(1).getRichStringCellValue());
		switch (product) {
		case PRODUCT_PLYWOOD:
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
		    plywood.setDescription_bench(String.valueOf(sheet.getRow(11).getCell(1).getRichStringCellValue()));

		    plywoodService.save(plywood);

		    workBook.close();
		    resultExcelInfoMessage += multipartFile.getOriginalFilename() + "-successfully;  ";

		    break;

		case PRODUCT_PARTICLE_BOARD:
		    ParticleBoard particleBoard = new ParticleBoard();
		    rowType = sheet.getRow(1).getCell(1).getCellType();
		    switch (rowType) {
		    case 0:
			particleBoard.setProduct_ID(String.valueOf(sheet.getRow(1).getCell(1).getNumericCellValue()));
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
			particleBoard.setLaminated(Integer.parseInt(sheet.getRow(2).getCell(1).getStringCellValue()));
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
			particleBoard.setThickness(Integer.parseInt(sheet.getRow(3).getCell(1).getStringCellValue()));
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
			particleBoard.setLength(Integer.parseInt(sheet.getRow(4).getCell(1).getStringCellValue()));
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
			particleBoard.setWeight(Integer.parseInt(sheet.getRow(5).getCell(1).getStringCellValue()));
			break;
		    default:
			throw new Exception("Incorrect cell type");
		    }
		    particleBoard.setFoto_1(String.valueOf(sheet.getRow(6).getCell(1).getStringCellValue()));
		    particleBoard.setFoto_2(String.valueOf(sheet.getRow(7).getCell(1).getStringCellValue()));
		    particleBoard.setFoto_3(String.valueOf(sheet.getRow(8).getCell(1).getStringCellValue()));
		    particleBoard.setFoto_4(String.valueOf(sheet.getRow(9).getCell(1).getStringCellValue()));
		    particleBoard
			    .setDescription_bench(String.valueOf(sheet.getRow(10).getCell(1).getStringCellValue()));

		    particleBoardService.save(particleBoard);

		    workBook.close();
		    resultExcelInfoMessage += multipartFile.getOriginalFilename() + "-successfully;  ";

		    break;

		default:
		    workBook.close();
		    resultExcelInfoMessage += multipartFile.getOriginalFilename() + "-error;  ";
		    break;
		}

	    } else {
		resultExcelInfoMessage += multipartFile.getOriginalFilename() + "-error: empty;  ";
	    }
	} catch (Exception e) {
	    resultExcelInfoMessage += multipartFile.getOriginalFilename() + "-error: " + e.getMessage() + ";  ";
	    e.printStackTrace();
	}
	return resultExcelInfoMessage;
    }

    @Override
    public String uploadPhoto(MultipartFile multipartFile, ServletContext servletContext) {
	String resultPhotoMessage = "";
	try {
	    if (multipartFile.getSize() > 0) {
		String rootResources = servletContext.getRealPath("/resources/") + PATH_PRODUCT_PHOTO;
		File file = new File(rootResources + multipartFile.getOriginalFilename());
		if (file.exists()) {
		    resultPhotoMessage += multipartFile.getOriginalFilename() + "-error: exists;  ";
		} else {
		    multipartFile.transferTo(file);
		    resultPhotoMessage += multipartFile.getOriginalFilename() + "-successfully;  ";
		}
	    } else {
		resultPhotoMessage += multipartFile.getOriginalFilename() + "-error: empty;  ";
	    }

	} catch (Exception e) {
	    resultPhotoMessage += multipartFile.getOriginalFilename() + "-error: " + e.getMessage() + ";  ";
	    e.printStackTrace();
	}
	return resultPhotoMessage;
    }

}
