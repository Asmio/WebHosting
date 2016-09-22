package com.eftech.wood.service;

import java.util.List;

import com.eftech.wood.entity.Plywood;

public interface PlywoodService {

    public Plywood findById(String id);

    public List<Plywood> findAll();

    public Plywood save(Plywood plywood);

    public void delete(Plywood plywood);

}
