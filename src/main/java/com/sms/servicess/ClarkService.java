package com.sms.servicess;

import com.sms.entities.Clark;


import java.util.List;


public interface ClarkService {	
	
	
	  public List<Clark> getAllClarks();
	  
	  public Clark getClarkById(int id);
	  
	  public Clark createClark(Clark clark);
	  
	  public Clark updateClark(int id, Clark clark);
	  
	  public void deleteClark(int id);
	
}
