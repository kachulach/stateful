package mk.ukim.finki.mp.stateful.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Role;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Repository;

import mk.ukim.finki.mp.stateful.model.Contact;

@Repository
public class ContactDaoImpl implements ContactDao {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	
	@Override
	public String getNameFromNum(String phoneNum) {
		@SuppressWarnings("unchecked")
		List<Contact> res = (List<Contact>) getCurrentSession()
				.createQuery("from Contact where phoneNum=:id")
				.setParameter("id", phoneNum).list();
		if(res.size()==0) return null;
		return res.get(0).getName();
	}

	@Override
	public Contact getContactFromNum(String phoneNum) {
		@SuppressWarnings("unchecked")
		List<Contact> res = (List<Contact>) getCurrentSession()
				.createQuery("from Contact where phoneNum=:id")
				.setParameter("id", phoneNum).list();
		if(res.size()==0) return null;
		return res.get(0);
	}
	
	//////////////////

	@Override	
	public List<Contact> getAllContacts() {
		List<Contact> res = (List<Contact>) getCurrentSession().createQuery("from Contact").list();		
		return res;
	}

}
