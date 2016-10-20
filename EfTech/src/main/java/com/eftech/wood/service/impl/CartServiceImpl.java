package com.eftech.wood.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eftech.wood.entity.Cart;
import com.eftech.wood.repository.CartRepository;
import com.eftech.wood.service.CartService;

@Service
@Transactional
@Component
public class CartServiceImpl implements CartService {

    @Autowired
    private CartRepository cartRepository;

    @Override
    public List<Cart> findAll() {
	return cartRepository.findAll();
    }

    @Override
    public Cart save(Cart cart) {
	return cartRepository.saveAndFlush(cart);
    }

    @Override
    public void delete(Cart cart) {
	cartRepository.delete(cart);
    }

    @Override
    public Cart findOne(String username, String product, String product_ID) {
	return cartRepository.findOne(username, product, product_ID);
    }

    @Override
    public List<Cart> findAllByName(String username) {
	return cartRepository.findAllByName(username);
    }

}
