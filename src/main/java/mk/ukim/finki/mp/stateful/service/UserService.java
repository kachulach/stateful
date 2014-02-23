package mk.ukim.finki.mp.stateful.service;

import java.util.List;

import mk.ukim.finki.mp.stateful.model.Contact;
import mk.ukim.finki.mp.stateful.model.Sms2;

public interface UserService {
	
	public boolean checkCredentials(String username, String password);
	
	public boolean userExists(String username);
	
	public boolean insertUser(String firstName, String lastName, 
							  String email, String username, String password);
	
}
