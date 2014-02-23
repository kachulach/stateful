package mk.ukim.finki.mp.stateful.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Role;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Repository;

import mk.ukim.finki.mp.stateful.model.Contact;
import mk.ukim.finki.mp.stateful.model.User;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public String getPasswordFromUsername(String username) {
		@SuppressWarnings("unchecked")
		
		User user = 
        (User)getCurrentSession().get(User.class, username);
		
		if(user!=null) 
			return user.getPassword();		
		else 
			return null;
	}

	@Override
	public boolean insertUser(String firstName, String lastName, String email,
			String username, String password) {
		
		User user = new User(firstName, lastName, username, email, password);
		
		if(this.getPasswordFromUsername(username)==null){
			System.out.println("saving...");
			getCurrentSession().save(user);
			return true;
		}		
		System.out.println("username exists...");
		return false;
		
	}

}
