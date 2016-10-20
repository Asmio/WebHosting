package com.eftech.wood.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.eftech.wood.entity.Plywood;

@Repository
public interface PlywoodRepository extends JpaRepository<Plywood, String> {

    @Query("FROM Plywood where (thickness BETWEEN ?1 and ?2) and (length BETWEEN ?3 and ?4) and (weight BETWEEN ?5 and ?6) and (price BETWEEN ?7 and ?8) and (water_resistance = ?9) and (sanded_or_unsanded = ?10)")
    List<Plywood> findAllByFilter(int minThickness, int maxThickness, int minLength, int maxLength, int minWeight,
	    int maxWeight, int minPrice, int maxPrice, String water_resistance, String sanded_or_unsanded);

    @Query("SELECT MAX(p.length) FROM Plywood p")
    int getMaxLegth();

    @Query("SELECT MAX(p.thickness) FROM Plywood p")
    int getMaxThickness();

    @Query("SELECT MAX(p.weight) FROM Plywood p")
    int getMaxWeight();

    @Query("SELECT MAX(p.price) FROM Plywood p")
    int getMaxPrice();

}
