package com.eftech.wood.service;

import java.util.List;

import com.eftech.wood.entity.Plywood;
import com.eftech.wood.helper.Filter;

public interface PlywoodService {

    public Plywood findById(String id);

    public List<Plywood> findAll();

    public Plywood save(Plywood plywood);

    public void delete(Plywood plywood);

    public List<Plywood> findAllByFilter(Filter filter);

    public int getMaxValue(String field);

}
