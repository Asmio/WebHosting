
package com.eftech.wood.phone.phoneshopcart;

/**
 *
 * @author Admin
 */
public class ShoppingCartItem {

    ShopProduct product;
    short quantity;

    public ShoppingCartItem(ShopProduct product) {
	this.product = product;
	quantity = 1;
    }

    public ShopProduct getProduct() {
	return product;
    }

    public short getQuantity() {
	return quantity;
    }

    public void setQuantity(short quantity) {
	this.quantity = quantity;
    }

    public void incrementQuantity() {
	quantity++;
    }

    public void decrementQuantity() {
	quantity--;
    }

    public double getTotal() {
	double amount = 0;
	// amount = (this.getQuantity() * product.getPrice().doubleValue());
	amount = (this.getQuantity() * product.getPrice());
	return amount;
    }

}