package mk.ukim.finki.mp.stateful.dao;

import java.util.ArrayList;
import java.util.List;

import mk.ukim.finki.mp.stateful.model.Contact;
import mk.ukim.finki.mp.stateful.model.Game;

public interface GameDao {	
	
	public void insertGame(String name, String description, String price,
							  String gameType, String picLocation, String numBought);	
	
	public boolean gameExists(String name);
	
	public List<Game> allGames(int at);
	
	public int allGamesSize();
	
	public boolean deleteGame(String name);
		
}
