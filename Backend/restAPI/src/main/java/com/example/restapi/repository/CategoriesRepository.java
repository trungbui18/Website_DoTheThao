package com.example.restapi.repository;
import com.example.restapi.entity.caterogy;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoriesRepository extends JpaRepository<caterogy,Integer> {
}
