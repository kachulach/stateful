package mk.ukim.finki.mp.stateful.service;

import java.util.List;

import mk.ukim.finki.mp.stateful.model.Contact;
import mk.ukim.finki.mp.stateful.model.Sms2;

public interface GameService {
	
	public boolean insertGame(String name, String description, String price, 
							  String gameType, String picLocation);
	
}