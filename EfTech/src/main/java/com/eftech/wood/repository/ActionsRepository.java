package com.eftech.wood.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.eftech.wood.entity.Actions;

@Repository
public interface ActionsRepository extends JpaRepository<Actions, String> {

}
