package com.eftech.wood.pdf;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eftech.wood.entity.ParticleBoard;
import com.eftech.wood.entity.Plywood;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.List;
import com.itextpdf.text.ListItem;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.CMYKColor;
import com.itextpdf.text.pdf.PdfWriter;

public class PDFBuilder extends AbstractPdfView {

    private static final String PRODUCT_PLYWOOD = "Plywood";
    private static final String PRODUCT_PARTICLE_BOARD = "ParticleBoard";

    @Override
    protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer,
	    HttpServletRequest request, HttpServletResponse response) throws Exception {
	String product = (String) request.getAttribute("product");
	String rootResources = (String) request.getAttribute("rootResources");

	Paragraph paragraph = new Paragraph("EfTech",
		FontFactory.getFont(FontFactory.COURIER, 30, Font.BOLD, new CMYKColor(81, 6, 0, 67)));
	paragraph.setAlignment(Element.ALIGN_CENTER);
	document.add(paragraph);

	BaseFont bf = BaseFont.createFont("c:/windows/fonts/times.ttf", "cp1251", BaseFont.EMBEDDED);
	Font font = new Font(bf);
	paragraph = new Paragraph("Руководителю предприятия", font);
	paragraph.setAlignment(Element.ALIGN_RIGHT);
	document.add(paragraph);

	List l;
	Image img;
	switch (product) {
	case PRODUCT_PLYWOOD:
	    Plywood plywood = (Plywood) model.get("item");
	    paragraph = new Paragraph(plywood.toString(),
		    FontFactory.getFont(FontFactory.COURIER, 20, Font.BOLD, new CMYKColor(81, 6, 0, 67)));
	    paragraph.setAlignment(Element.ALIGN_CENTER);
	    document.add(paragraph);

	    paragraph = new Paragraph();
	    paragraph.setSpacingBefore(20f);
	    paragraph.setSpacingAfter(20f);
	    img = Image.getInstance(rootResources + "/assets/images/products/" + plywood.getFoto_1());
	    img.scaleAbsolute(100, 100);
	    paragraph.add(img);
	    document.add(paragraph);
	    img = Image.getInstance(rootResources + "/assets/images/products/" + plywood.getFoto_2());
	    img.scaleAbsolute(100, 100);
	    img.setAbsolutePosition(176, 580);
	    document.add(img);
	    img = Image.getInstance(rootResources + "/assets/images/products/" + plywood.getFoto_3());
	    img.scaleAbsolute(100, 100);
	    img.setAbsolutePosition(316, 580);
	    document.add(img);
	    img = Image.getInstance(rootResources + "/assets/images/products/" + plywood.getFoto_4());
	    img.scaleAbsolute(100, 100);
	    img.setAbsolutePosition(456, 580);
	    document.add(img);

	    l = new List(false, false, 10);
	    l.add(new ListItem("Толщина: " + plywood.getThickness() + "mm", font));
	    l.add(new ListItem("Длина: " + plywood.getLength() + "mm", font));
	    l.add(new ListItem("Вес: " + plywood.getWeight() + "kg", font));
	    l.add(new ListItem("Водонепроницаемый: " + plywood.getWater_resistance(), font));
	    l.add(new ListItem("Шлифованный или нет: " + plywood.getSanded_or_unsanded(), font));
	    l.add(new ListItem("Описание станка: " + plywood.getDescription_bench().replace("<br>", ", "), font));
	    l.add(new ListItem("Цена: " + plywood.getPrice() + "$", font));
	    document.add(l);

	    break;
	case PRODUCT_PARTICLE_BOARD:
	    ParticleBoard particleBoard = (ParticleBoard) model.get("item");
	    paragraph = new Paragraph(particleBoard.toString(),
		    FontFactory.getFont(FontFactory.COURIER, 20, Font.BOLD, new CMYKColor(81, 6, 0, 67)));
	    paragraph.setAlignment(Element.ALIGN_CENTER);
	    document.add(paragraph);

	    paragraph = new Paragraph();
	    paragraph.setSpacingBefore(20f);
	    paragraph.setSpacingAfter(20f);
	    img = Image.getInstance(rootResources + "/assets/images/products/" + particleBoard.getFoto_1());
	    img.scaleAbsolute(100, 100);
	    paragraph.add(img);
	    document.add(paragraph);
	    img = Image.getInstance(rootResources + "/assets/images/products/" + particleBoard.getFoto_2());
	    img.scaleAbsolute(100, 100);
	    img.setAbsolutePosition(176, 580);
	    document.add(img);
	    img = Image.getInstance(rootResources + "/assets/images/products/" + particleBoard.getFoto_3());
	    img.scaleAbsolute(100, 100);
	    img.setAbsolutePosition(316, 580);
	    document.add(img);
	    img = Image.getInstance(rootResources + "/assets/images/products/" + particleBoard.getFoto_4());
	    img.scaleAbsolute(100, 100);
	    img.setAbsolutePosition(456, 580);
	    document.add(img);

	    l = new List(false, false, 10);
	    l.add(new ListItem("Толщина: " + particleBoard.getThickness() + "mm", font));
	    l.add(new ListItem("Длина: " + particleBoard.getLength() + "mm", font));
	    l.add(new ListItem("Вес: " + particleBoard.getWeight() + "kg", font));
	    l.add(new ListItem("Ламинированный: " + particleBoard.getLaminated(), font));
	    l.add(new ListItem("Описание станка: " + particleBoard.getDescription_bench().replace("<br>", ", "), font));
	    l.add(new ListItem("Цена: " + particleBoard.getPrice() + "$", font));
	    document.add(l);

	    break;
	default:
	    break;
	}
	paragraph = new Paragraph("С уважением EfTech \n г.Минск, ул. П.Глебки 11", font);
	paragraph.setSpacingBefore(50f);
	document.add(paragraph);
    }

}
