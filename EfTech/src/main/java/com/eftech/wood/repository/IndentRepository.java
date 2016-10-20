package com.eftech.wood.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.eftech.wood.entity.Indent;

@Repository
public interface IndentRepository extends JpaRepository<Indent, String> {

}
