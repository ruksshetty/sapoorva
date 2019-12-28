package com.howtodoinjava.demo.controller;

import com.howtodoinjava.demo.model.Organization;
import com.howtodoinjava.demo.repository.OrganizationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class OrganizationController {

	@Autowired
	OrganizationRepository repository;

    // Find All
    @GetMapping("/organization")
    List<Organization> findAll() {
        return (List<Organization>)repository.findAll();
    }

    // Save
    @PostMapping("/organization")
    Organization newOrganization(@RequestBody Organization newOrganization) {
        return repository.save(newOrganization);
    }

    // Find By Id
    @GetMapping("/organization/{id}")
    Organization findOne(@PathVariable Long id) {
        return repository.findOne(id); //.orElseThrow(() -> new BookNotFoundException(id));
    }

    //Delete By Id
    @DeleteMapping("/organization/{id}")
    void deleteBook(@PathVariable Long id) {
        repository.delete(id);
    }
}
