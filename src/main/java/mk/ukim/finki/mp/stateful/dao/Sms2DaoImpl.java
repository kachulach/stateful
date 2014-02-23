package mk.ukim.finki.mp.stateful.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mk.ukim.finki.mp.stateful.model.Sms2;
@Repository
public class Sms2DaoImpl implements Sms2Dao {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public void addSMS(Sms2 sms2) {
		
		getCurrentSession().save(sms2);
				
	}

}
