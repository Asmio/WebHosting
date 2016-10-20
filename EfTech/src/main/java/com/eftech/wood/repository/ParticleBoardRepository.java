package com.eftech.wood.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.eftech.wood.entity.ParticleBoard;

@Repository
public interface ParticleBoardRepository extends JpaRepository<ParticleBoard, String> {

    @Query("FROM ParticleBoard where (thickness BETWEEN ?1 and ?2) and (length BETWEEN ?3 and ?4) and (weight BETWEEN ?5 and ?6) and (price BETWEEN ?7 and ?8) and (laminated BETWEEN ?9 and ?10)")
    List<ParticleBoard> findAllByFilter(int minThickness, int maxThickness, int minLength, int maxLength, int minWeight,
	    int maxWeight, int minPrice, int maxPrice, int minLaminated, int maxLaminated);

    @Query("SELECT MAX(pb.length) FROM ParticleBoard pb")
    int getMaxLegth();

    @Query("SELECT MAX(pb.thickness) FROM ParticleBoard pb")
    int getMaxThickness();

    @Query("SELECT MAX(pb.weight) FROM ParticleBoard pb")
    int getMaxWeight();

    @Query("SELECT MAX(pb.price) FROM ParticleBoard pb")
    int getMaxPrice();

    @Query("SELECT MAX(pb.laminated) FROM ParticleBoard pb")
    int getMaxLaminated();
}
