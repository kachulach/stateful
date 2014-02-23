package mk.ukim.finki.mp.stateful.dao;

import java.util.List;

import mk.ukim.finki.mp.stateful.model.Contact;

public interface ContactDao {

	public String getNameFromNum(String phoneNum);
	
	public Contact getContactFromNum(String phoneNum);
	
	public List<Contact> getAllContacts();
	
}
