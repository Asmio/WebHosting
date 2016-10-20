package com.eftech.wood.service;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

public interface FileService {

    public String uploadExcelPriceFile(MultipartFile multipartFile, PlywoodService plywoodService,
	    ParticleBoardService particleBoardService);

    public String uploadExcelInfoFile(MultipartFile multipartFile, PlywoodService plywoodService,
	    ParticleBoardService particleBoardService);

    public String uploadPhoto(MultipartFile multipartFile, ServletContext servletContext);
}
