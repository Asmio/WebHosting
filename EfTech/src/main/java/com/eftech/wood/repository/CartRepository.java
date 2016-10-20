package com.eftech.wood.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.eftech.wood.entity.Cart;

@Repository
public interface CartRepository extends JpaRepository<Cart, String> {

    @Query("FROM Cart WHERE username = ?1 and product = ?2 and product_ID = ?3")
    Cart findOne(String username, String product, String product_ID);

    @Query("FROM Cart WHERE username = ?1")
    List<Cart> findAllByName(String username);
}
