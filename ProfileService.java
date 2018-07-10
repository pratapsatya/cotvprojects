package com.hellokoding.auth.service;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.hellokoding.auth.model.Profile;


public interface ProfileService {

	void insertData(String uname,String movie,Integer tickets);
	//List<Profile> getData(String uname);

	List<Profile> findByUname(String uname);
	
}
