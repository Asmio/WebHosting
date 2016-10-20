package com.eftech.wood.service;

import java.util.List;

import com.eftech.wood.entity.Indent;

public interface IndentService {

    public List<Indent> findAll();

    public Indent save(Indent indent);

    public void delete(Indent indent);
}
