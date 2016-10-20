package com.eftech.wood.shopping;

import java.util.ArrayList;

import com.eftech.wood.entity.ParticleBoard;
import com.eftech.wood.entity.Plywood;

public class ShoppingCart {

    private ArrayList<ShoppingCartPlywood> itemsPlywood;
    private ArrayList<ShoppingCartParticleBoard> itemsParticleBoard;
    private int numberOfItems;
    private int total;

    public ShoppingCart() {
	itemsPlywood = new ArrayList<ShoppingCartPlywood>();
	itemsParticleBoard = new ArrayList<ShoppingCartParticleBoard>();
	numberOfItems = 0;
	total = 0;
    }

    public synchronized void addPlywood(Plywood plywood) {

	boolean newItem = true;
	for (ShoppingCartPlywood scItem : itemsPlywood) {
	    if (scItem.getProduct().getProduct_ID().equals(plywood.getProduct_ID())) {
		newItem = false;
		scItem.incrementQuantity();
		break;
	    }
	}
	if (newItem) {
	    ShoppingCartPlywood scItem = new ShoppingCartPlywood(plywood);
	    itemsPlywood.add(scItem);
	}
    }

    public synchronized void addParticleBoard(ParticleBoard particleBoard) {

	boolean newItem = true;
	for (ShoppingCartParticleBoard scItem : itemsParticleBoard) {
	    if (scItem.getProduct().getProduct_ID().equals(particleBoard.getProduct_ID())) {
		newItem = false;
		scItem.incrementQuantity();
		break;
	    }
	}
	if (newItem) {
	    ShoppingCartParticleBoard scItem = new ShoppingCartParticleBoard(particleBoard);
	    itemsParticleBoard.add(scItem);
	}
    }

    public synchronized void updatePlywood(Plywood plywood, int quantity) {

	if (quantity >= 0) {

	    ShoppingCartPlywood item = null;

	    for (ShoppingCartPlywood scItem : itemsPlywood) {
		if (scItem.getProduct().getProduct_ID().equals(plywood.getProduct_ID())) {
		    if (quantity != 0) {
			scItem.setQuantity(quantity);
		    } else {
			item = scItem;
		    }
		    break;
		}
	    }
	    if (item != null) {
		itemsPlywood.remove(item);
	    }
	}
    }

    public synchronized void updateParticleBoard(ParticleBoard particleBoard, int quantity) {

	if (quantity >= 0) {

	    ShoppingCartParticleBoard item = null;

	    for (ShoppingCartParticleBoard scItem : itemsParticleBoard) {
		if (scItem.getProduct().getProduct_ID().equals(particleBoard.getProduct_ID())) {
		    if (quantity != 0) {
			scItem.setQuantity(quantity);
		    } else {
			item = scItem;
		    }
		    break;
		}
	    }
	    if (item != null) {
		itemsParticleBoard.remove(item);
	    }
	}
    }

    public synchronized ArrayList<ShoppingCartPlywood> getItemsPlywood() {
	return itemsPlywood;
    }

    public synchronized ArrayList<ShoppingCartParticleBoard> getItemsParticleBoard() {
	return itemsParticleBoard;
    }

    public synchronized int getNumberOfItems() {
	numberOfItems = 0;

	for (ShoppingCartPlywood scItem : itemsPlywood) {
	    numberOfItems += scItem.getQuantity();
	}
	for (ShoppingCartParticleBoard scItem : itemsParticleBoard) {
	    numberOfItems += scItem.getQuantity();
	}
	return numberOfItems;
    }

    public synchronized int getSubtotalPlywood() {
	int amount = 0;
	for (ShoppingCartPlywood scItem : itemsPlywood) {
	    amount += (scItem.getQuantity() * scItem.getProduct().getPrice());
	}
	return amount;
    }

    public synchronized int getSubtotalParticleBoard() {
	int amount = 0;
	for (ShoppingCartParticleBoard scItem : itemsParticleBoard) {
	    amount += (scItem.getQuantity() * scItem.getProduct().getPrice());
	}
	return amount;
    }

    public synchronized int getTotal() {
	this.total = getSubtotalPlywood() + getSubtotalParticleBoard();
	return total;
    }

    public synchronized void clear() {
	itemsPlywood.clear();
	itemsParticleBoard.clear();
	numberOfItems = 0;
	total = 0;
    }
}
