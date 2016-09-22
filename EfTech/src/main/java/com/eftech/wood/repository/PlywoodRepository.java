package com.eftech.wood.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.eftech.wood.entity.Plywood;

@Repository
public interface PlywoodRepository extends JpaRepository<Plywood, String> {

}
