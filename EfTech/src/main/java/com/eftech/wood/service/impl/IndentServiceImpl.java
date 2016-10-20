package com.eftech.wood.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eftech.wood.entity.Indent;
import com.eftech.wood.repository.IndentRepository;
import com.eftech.wood.service.IndentService;

@Service
@Transactional
@Component
public class IndentServiceImpl implements IndentService {

    @Autowired
    private IndentRepository indentRepository;

    @Override
    public List<Indent> findAll() {
	return indentRepository.findAll();
    }

    @Override
    public Indent save(Indent indent) {
	return indentRepository.saveAndFlush(indent);
    }

    @Override
    public void delete(Indent indent) {
	indentRepository.delete(indent);
    }

}
