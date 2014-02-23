package mk.ukim.finki.mp.stateful.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mk.ukim.finki.mp.stateful.dao.ContactDao;
import mk.ukim.finki.mp.stateful.dao.UserDao;
import mk.ukim.finki.mp.stateful.model.Contact;
import mk.ukim.finki.mp.stateful.model.Sms2;

@Service
@Transactional
public class UserServiceImpl implements UserService{

	
	@Autowired
	private UserDao userDao;

	@Override
	public boolean checkCredentials(String username, String password) {
		
		String DBpassword = userDao.getPasswordFromUsername(username);
		
		return DBpassword.equals(password);
		
	}

	@Override
	public boolean userExists(String username) {
		
		String DBpassword = userDao.getPasswordFromUsername(username);
		return DBpassword!=null;
		
	}

	@Override
	public boolean insertUser(String firstName, String lastName, String email,
			String username, String password) {
		
		return userDao.insertUser(firstName, lastName, email, username, password);		
		
	}

}
