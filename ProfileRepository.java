package com.hellokoding.auth.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.hellokoding.auth.model.Mail;
import com.hellokoding.auth.model.Profile;

public interface ProfileRepository extends JpaRepository<Profile,Long> {

	@Transactional
	@Modifying(clearAutomatically=true)
	@Query(value = "insert into profile (uname,movie, tickets) VALUES (?1, ?2, ?3)", nativeQuery = true)
	void insertData(String uname,String movie, Integer tickets);
	
	List<Profile> findByUname(String uname);
	
	/*@Query("select p from Profile p where p.uname=?1")
	List<Profile> getData(String uname);*/


	
}
