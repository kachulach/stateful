package mk.ukim.finki.mp.stateful.dao;

import java.util.List;

import mk.ukim.finki.mp.stateful.model.Contact;

public interface UserDao {

	public String getPasswordFromUsername(String username);
	
	public boolean insertUser(String firstName, String lastName, String email,
							  String username, String password);
		
}
