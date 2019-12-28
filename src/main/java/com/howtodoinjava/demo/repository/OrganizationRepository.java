package com.howtodoinjava.demo.repository;


import com.howtodoinjava.demo.model.Organization;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrganizationRepository extends JpaRepository<Organization, Long> {
}
