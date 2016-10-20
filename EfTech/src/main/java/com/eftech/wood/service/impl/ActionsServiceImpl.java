package com.eftech.wood.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eftech.wood.entity.Actions;
import com.eftech.wood.repository.ActionsRepository;
import com.eftech.wood.service.ActionsService;

@Service
@Transactional
@Component
public class ActionsServiceImpl implements ActionsService {

    @Autowired
    private ActionsRepository actionsRepository;

    @Override
    public List<Actions> findAll() {
	return actionsRepository.findAll();
    }

    @Override
    public Actions save(Actions actions) {
	return actionsRepository.saveAndFlush(actions);
    }

}
