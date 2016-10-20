package com.eftech.wood.service;

import java.util.List;

import com.eftech.wood.entity.Actions;

public interface ActionsService {

    public List<Actions> findAll();

    public Actions save(Actions actions);

}
