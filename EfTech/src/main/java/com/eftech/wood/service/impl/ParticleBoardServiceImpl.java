package com.eftech.wood.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eftech.wood.entity.ParticleBoard;
import com.eftech.wood.repository.ParticleBoardRepository;
import com.eftech.wood.service.ParticleBoardService;

@Service
@Transactional
@Component
public class ParticleBoardServiceImpl implements ParticleBoardService {

    @Autowired
    private ParticleBoardRepository particleBoardRepository;

    @Override
    public ParticleBoard findById(String id) {
	return particleBoardRepository.findOne(id);
    }

    @Override
    public List<ParticleBoard> findAll() {
	return particleBoardRepository.findAll();
    }

    @Override
    public ParticleBoard save(ParticleBoard particleBoard) {
	return particleBoardRepository.save(particleBoard);
    }

    @Override
    public void delete(ParticleBoard particleBoard) {
	particleBoardRepository.delete(particleBoard);
    }

}
