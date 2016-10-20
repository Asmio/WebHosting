package com.eftech.wood.shopping;

import com.eftech.wood.entity.ParticleBoard;

public class ShoppingCartParticleBoard {

    private ParticleBoard product;
    private int quantity;

    public ShoppingCartParticleBoard(ParticleBoard particleBoard) {
	this.product = particleBoard;
	this.quantity = 1;
    }

    public int getQuantity() {
	return quantity;
    }

    public void setQuantity(int quantity) {
	this.quantity = quantity;
    }

    public ParticleBoard getProduct() {
	return product;
    }

    public void incrementQuantity() {
	quantity++;
    }

    public void decrementQuantity() {
	quantity--;
    }

    public int getTotal() {
	int amount = 0;
	amount = (this.getQuantity() * product.getPrice());
	return amount;
    }

}
