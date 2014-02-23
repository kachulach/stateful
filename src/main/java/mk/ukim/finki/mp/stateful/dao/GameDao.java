package mk.ukim.finki.mp.stateful.dao;

import java.util.List;

import mk.ukim.finki.mp.stateful.model.Contact;

public interface GameDao {	
	
	public void insertGame(String name, String description, String price,
							  String gameType, String picLocation, String numBought);	
	
	public boolean gameExists(String name);
		
}
