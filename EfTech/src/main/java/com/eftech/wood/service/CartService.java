package com.eftech.wood.service;

import java.util.List;

import com.eftech.wood.entity.Cart;

public interface CartService {

    public List<Cart> findAll();

    public Cart save(Cart cart);

    public void delete(Cart cart);

    public Cart findOne(String username, String product, String product_ID);

    public List<Cart> findAllByName(String username);
}
