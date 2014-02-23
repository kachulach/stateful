package mk.ukim.finki.mp.stateful.model;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Role;
import org.springframework.security.access.annotation.Secured;

@Entity

public class Game {	
	
	@Id
	@GenericGenerator(name="gen",strategy="increment")
	@GeneratedValue(generator="gen")
	@Column(name = "ID", unique = true, nullable = false, precision = 15, scale = 0)
	private Long id;
	
	private String name;
	private String description;
	private String price;
	private String gameType;
	private String picLocation;		
	private String numBought;
	
	public Game(){}
	
	public Game(String name, String picLocation, String gameType,
			String description, String price, String numBought) {
		super();
		this.name = name;
		this.picLocation = picLocation;
		this.gameType = gameType;
		this.description = description;
		this.price = price;
		this.numBought = numBought;
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPicLocation() {
		return picLocation;
	}
	public void setPicLocation(String picLocation) {
		this.picLocation = picLocation;
	}
	public String getGameType() {
		return gameType;
	}
	public void setGameType(String gameType) {
		this.gameType = gameType;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getNumBought() {
		return numBought;
	}
	public void setNumBought(String numBought) {
		this.numBought = numBought;
	}
		
}
