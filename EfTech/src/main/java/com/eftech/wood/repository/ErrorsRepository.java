package com.eftech.wood.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.eftech.wood.entity.Errors;

@Repository
public interface ErrorsRepository extends JpaRepository<Errors, String> {

}
