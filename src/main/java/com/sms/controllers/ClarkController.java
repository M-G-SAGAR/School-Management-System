package com.sms.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sms.entities.Clark;
import com.sms.servicess.ClarkService;


@RestController
@RequestMapping("/api/clarks")
public class ClarkController {

	
	@Autowired
	ClarkService clarkService;
	
	  @GetMapping
	    public List<Clark> getAllClarks() {
	        return clarkService.getAllClarks();
	    }
	  
	  
	  @PostMapping
	  public Clark creatClark(@RequestBody Clark clark) {
		  
		  return clarkService.createClark(clark);
	  }
	  
	  
	  @GetMapping("/{id}")
	  public Clark getClarkById(@PathVariable  int id) {
		  
		  
		  return clarkService.getClarkById(id);
	  }
	   
	  
	  @PutMapping("/{id}")
	  public Clark updateClark(@PathVariable int id,@RequestBody Clark clark) {
		  
		  return clarkService.updateClark(id, clark);
	  }
	  
	  
	  @DeleteMapping("/{id}")
	  public void deleteClark( @PathVariable int id) {
		  
		 clarkService.deleteClark(id);
	  }
}
