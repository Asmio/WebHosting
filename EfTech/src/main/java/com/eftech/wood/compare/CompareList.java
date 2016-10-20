package com.eftech.wood.compare;

import java.util.ArrayList;
import java.util.List;

import com.eftech.wood.entity.ParticleBoard;
import com.eftech.wood.entity.Plywood;

public class CompareList {

    private ArrayList<Plywood> listPlywood;
    private ArrayList<ParticleBoard> listParticleBoard;
    private int quantityPlywood;
    private int quantityParticleBoard;
    private int total;

    public CompareList() {
	this.listPlywood = new ArrayList<Plywood>();
	this.listParticleBoard = new ArrayList<ParticleBoard>();
	this.quantityPlywood = this.listPlywood.size();
	this.quantityParticleBoard = this.listParticleBoard.size();
	this.total = this.quantityPlywood + this.quantityParticleBoard;
    }

    public void updatePlywoodList(Plywood plywood) {
	boolean newItem = true;
	for (Plywood item : listPlywood) {
	    if (item.getProduct_ID().equals(plywood.getProduct_ID())) {
		listPlywood.remove(item);
		newItem = false;
		break;
	    }
	}
	if (newItem) {
	    listPlywood.add(plywood);
	}
    }

    public void updateParticleBoardList(ParticleBoard particleBoard) {
	boolean newItem = true;
	for (ParticleBoard item : listParticleBoard) {
	    if (item.getProduct_ID().equals(particleBoard.getProduct_ID())) {
		listParticleBoard.remove(item);
		newItem = false;
		break;
	    }
	}
	if (newItem) {
	    listParticleBoard.add(particleBoard);
	}
    }

    public List<Plywood> getListPlywood() {
	return listPlywood;
    }

    public List<ParticleBoard> getListParticleBoard() {
	return listParticleBoard;
    }

    public int getQuantityPlywood() {
	this.quantityPlywood = listPlywood.size();
	return quantityPlywood;
    }

    public int getQuantityParticleBoard() {
	this.quantityParticleBoard = listParticleBoard.size();
	return quantityParticleBoard;
    }

    public int getTotal() {
	this.total = this.getQuantityPlywood() + this.getQuantityParticleBoard();
	return total;
    }

}
