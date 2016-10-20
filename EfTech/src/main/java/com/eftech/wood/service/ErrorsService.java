package com.eftech.wood.service;

import java.util.List;

import com.eftech.wood.entity.Errors;

public interface ErrorsService {

    public List<Errors> findAll();

    public Errors save(Errors errors);

}
