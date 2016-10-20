package com.eftech.wood.service;

import java.util.List;

import com.eftech.wood.entity.ParticleBoard;
import com.eftech.wood.helper.Filter;

public interface ParticleBoardService {

    public ParticleBoard findById(String id);

    public List<ParticleBoard> findAll();

    public ParticleBoard save(ParticleBoard particleBoard);

    public void delete(ParticleBoard particleBoard);

    public List<ParticleBoard> findAllByFilter(Filter filter);

    public int getMaxValue(String field);

}
