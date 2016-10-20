package com.eftech.wood.shopping;

import com.eftech.wood.entity.Plywood;

public class ShoppingCartPlywood {

    private Plywood product;
    private int quantity;

    public ShoppingCartPlywood(Plywood plywood) {
	this.product = plywood;
	this.quantity = 1;
    }

    public int getQuantity() {
	return quantity;
    }

    public void setQuantity(int quantity) {
	this.quantity = quantity;
    }

    public Plywood getProduct() {
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
