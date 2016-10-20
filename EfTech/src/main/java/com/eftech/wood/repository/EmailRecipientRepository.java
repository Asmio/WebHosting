package com.eftech.wood.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.eftech.wood.entity.EmailRecipient;

@Repository
public interface EmailRecipientRepository extends JpaRepository<EmailRecipient, String> {

    @Query("FROM EmailRecipient WHERE email = ?1")
    EmailRecipient findOneByEmail(String email);
}
