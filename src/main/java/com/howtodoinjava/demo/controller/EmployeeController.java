package com.howtodoinjava.demo.controller;

import com.howtodoinjava.demo.model.Employee;
import com.howtodoinjava.demo.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class EmployeeController {

	@Autowired
	EmployeeRepository repository;

	// Find All
	@GetMapping("/employee")
	List<Employee> findAll() {
		return (List<Employee>)repository.findAll();
	}

	// Save
	@PostMapping("/employee")
	Employee newOrganization(@RequestBody Employee newOrganization) {
		return repository.save(newOrganization);
	}

	// Find By Id
	@GetMapping("/employee/{id}")
	Employee findOne(@PathVariable Long id) {
		return repository.findOne(id); //.orElseThrow(() -> new BookNotFoundException(id));
	}

	//Delete By Id
	@DeleteMapping("/employee/{id}")
	void deleteBook(@PathVariable Long id) {
		repository.delete(id);
	}

}
