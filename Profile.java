package com.hellokoding.auth.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "profile")
public class Profile {
    
	@Id
	@Column(name="uname")
	private String uname;
	
	
	
	public Profile() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Column(name="movie")
	private String movie;
	
	@Column(name="tickets")
	private Integer tickets;
	
	
	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getMovie() {
		return movie;
	}

	public void setMovie(String movie) {
		this.movie = movie;
	}

	public Integer getTickets() {
		return tickets;
	}

	public void setTickets(Integer tickets) {
		this.tickets = tickets;
	}

	public Profile(String uname, String movie, Integer tickets) {
		super();
		this.uname = uname;
		this.movie = movie;
		this.tickets = tickets;
	}
	
	
	
}