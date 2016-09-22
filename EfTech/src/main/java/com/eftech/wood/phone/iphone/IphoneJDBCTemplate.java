/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eftech.wood.phone.iphone;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

/**
 *
 * @author Admin
 */

public class IphoneJDBCTemplate implements IphoneDAO {

    private DataSource dataSource;
    private NamedParameterJdbcTemplate jdbcTemplateObject;

    private final int NOMBER_PRODUCTS_ON_PAGE = 6;
    public int kol_vo_product;
    public int kol_vo_page_itogo;

    @Override
    public List<Iphone> getListIphone() {
	List<Iphone> listIphone = jdbcTemplateObject.query("select * from iphone", new IphoneMapper());
	return listIphone;
    }

    @Override
    public Iphone getIphone(int id) {
	MapSqlParameterSource params = new MapSqlParameterSource("id", id);
	Iphone iphone = jdbcTemplateObject.queryForObject("select * from iphone where id=:id", params,
		new IphoneMapper());
	return iphone;
    }

    @Override
    public List<Iphone> listIphone(Select s) {

	// MapSqlParameterSource params = new MapSqlParameterSource();
	String sql = "select * from iphone";
	int k1 = 0;
	int k2 = 0;

	// 0
	if (s.getChIphone5c() == 1 || s.getChIphone5s() == 1 || s.getChIphone6() == 1 || s.getChIphone6plus() == 1
		|| s.getChIphone6s() == 1 || s.getChIphone6splus() == 1 || s.getColor() != "n"
		|| s.getMemory() != "n") {
	    sql += " where (manufacturer is not null) ";

	    // 1
	    if (s.getChIphone5c() == 1 || s.getChIphone5s() == 1 || s.getChIphone6() == 1 || s.getChIphone6plus() == 1
		    || s.getChIphone6s() == 1 || s.getChIphone6splus() == 1) {
		sql += "and (";
		if (s.getChIphone5c() == 1) {
		    sql += "model='iPhone 5c' ";
		    k1++;
		}
		if (s.getChIphone5s() == 1) {
		    if (k1 == 1) {
			sql += " or ";
			k1 = 0;
		    }
		    sql += "model='iPhone 5s' ";
		    k1++;
		}
		if (s.getChIphone6() == 1) {
		    if (k1 == 1) {
			sql += " or ";
			k1 = 0;
		    }
		    sql += "model='iPhone 6' ";
		    k1++;
		}
		if (s.getChIphone6plus() == 1) {
		    if (k1 == 1) {
			sql += " or ";
			k1 = 0;
		    }
		    sql += "model='iPhone 6 Plus' ";
		    k1++;
		}
		if (s.getChIphone6s() == 1) {
		    if (k1 == 1) {
			sql += " or ";
			k1 = 0;
		    }
		    sql += "model='iPhone 6s' ";
		    k1++;
		}
		if (s.getChIphone6splus() == 1) {
		    if (k1 == 1) {
			sql += " or ";
			k1 = 0;
		    }
		    sql += "model='iPhone 6s Plus' ";
		    k1++;
		}
		sql += " ) ";
	    }

	    // 2
	    if (!"n".equals(s.getColor()) || !"n".equals(s.getMemory())) {
		sql += " and ( ";
		if (!"n".equals(s.getColor())) {
		    sql += "color = '" + s.getColor() + "'";
		    k2++;
		}
		if (!"n".equals(s.getMemory())) {
		    if (k2 == 1) {
			sql += " and ";
			k2 = 0;
		    }
		    sql += "ram_memory = " + s.getMemory();
		    k2++;
		}

		sql += " ) ";
	    }

	}

	List<Iphone> listIphone = jdbcTemplateObject.query(sql, new IphoneMapper());
	return listIphone;
    }

    @Override
    public List<Iphone> listIphone(Select select, int page_nomber) {

	List<Iphone> listIphone = listIphone(select); // get

	int count = listIphone.size(); // nomber of products from question

	List<Iphone> listIphone2 = new ArrayList<Iphone>();

	// add elements to list
	int finishProd = page_nomber * NOMBER_PRODUCTS_ON_PAGE;
	int startProd = page_nomber * NOMBER_PRODUCTS_ON_PAGE - NOMBER_PRODUCTS_ON_PAGE;

	for (int i = 0; i < listIphone.size(); i++) {
	    if ((i >= startProd) && (i < finishProd))
		listIphone2.add(listIphone.get(i));
	}

	setKol_vo_product(listIphone.size());
	kol_vo_page_itogo = (int) Math.ceil((double) count / (double) NOMBER_PRODUCTS_ON_PAGE);
	// setKol_vo_page_itogo();
	return listIphone2;

    }

    public void setKol_vo_product(int kol_vo_product) {
	this.kol_vo_product = kol_vo_product;
    }

    public int getKol_vo_page_itogo() {
	return kol_vo_page_itogo;
    }

    public void setKol_vo_page_itogo(int kol_vo_page_itogo) {
	this.kol_vo_page_itogo = kol_vo_page_itogo;
    }

    public int getKol_vo_product() {
	return kol_vo_product;
    }

    public int getNOMBER_PRODUCTS_ON_PAGE() {
	return NOMBER_PRODUCTS_ON_PAGE;
    }

    public void setDataSource(DataSource dataSource) {
	this.dataSource = dataSource;
	this.jdbcTemplateObject = new NamedParameterJdbcTemplate(dataSource);
    }

    // select * from iphone where (manufacturer is not null) and (model='iPhone
    // 6' or model='iPhone 6 Plus' )
    // select * from iphone where (manufacturer is not null) and (model='iPhone
    // 6' or model='iPhone 6 Plus' ) and ( color = 'золотой' and ram_memory = 16
    // )
}
