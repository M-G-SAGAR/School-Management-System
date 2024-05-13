package com.sms.serviceImpl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sms.entities.Clark;
import com.sms.repository.ClarkRepository;
import com.sms.servicess.ClarkService;


@Service
public class ClarkServiceImpl implements ClarkService {
     
	@Autowired
     private ClarkRepository clarkRepository;	

	@Override
	public List<Clark> getAllClarks() {
		
		return clarkRepository.findAll();
	}

	 public Clark getClarkById(int id) {
	        return clarkRepository.findById(id).orElse(null);
	    }


	@Override
	public Clark createClark(Clark clark) {
		
		return clarkRepository.save(clark);
	}

	@Override
	public Clark updateClark(int id, Clark clark) {
		if (clarkRepository.existsById(id)) {
			
			clark.setId(id);
			
			clarkRepository.save(clark);
		}
		return null;
	}

	@Override
	public void deleteClark(int id) {
		
	     clarkRepository.deleteById(id);
	}
	
	

}
