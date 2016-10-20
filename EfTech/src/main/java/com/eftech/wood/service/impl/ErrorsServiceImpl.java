package com.eftech.wood.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eftech.wood.entity.Errors;
import com.eftech.wood.repository.ErrorsRepository;
import com.eftech.wood.service.ErrorsService;

@Service
@Transactional
@Component
public class ErrorsServiceImpl implements ErrorsService {

    @Autowired
    private ErrorsRepository errorsRepository;

    @Override
    public List<Errors> findAll() {
	return errorsRepository.findAll();
    }

    @Override
    public Errors save(Errors errors) {
	return errorsRepository.saveAndFlush(errors);
    }

}
