package com.eftech.wood.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eftech.wood.entity.Plywood;
import com.eftech.wood.helper.Filter;
import com.eftech.wood.repository.PlywoodRepository;
import com.eftech.wood.service.PlywoodService;

@Service
@Transactional
@Component
public class PlywoodServiceImpl implements PlywoodService {

    @Autowired
    private PlywoodRepository plywoodRepository;

    @Override
    public Plywood findById(String id) {
	return plywoodRepository.findOne(id);
    }

    @Override
    public List<Plywood> findAll() {
	return plywoodRepository.findAll();
    }

    @Override
    public Plywood save(Plywood plywood) {
	return plywoodRepository.saveAndFlush(plywood);
    }

    @Override
    public void delete(Plywood plywood) {
	plywoodRepository.delete(plywood);
    }

    @Override
    public List<Plywood> findAllByFilter(Filter filter) {
	return plywoodRepository.findAllByFilter(filter.getMinThickness(), filter.getMaxThickness(),
		filter.getMinLength(), filter.getMaxLength(), filter.getMinWeight(), filter.getMaxWeight(),
		filter.getMinPrice(), filter.getMaxPrice(), filter.getWater_resistance(),
		filter.getSanded_or_unsanded());
    }

    @Override
    public int getMaxValue(String field) {
	switch (field) {
	case "thickness":
	    return plywoodRepository.getMaxThickness();
	case "length":
	    return plywoodRepository.getMaxLegth();
	case "weight":
	    return plywoodRepository.getMaxWeight();
	case "price":
	    return plywoodRepository.getMaxPrice();
	default:
	    return 0;
	}
    }

}
