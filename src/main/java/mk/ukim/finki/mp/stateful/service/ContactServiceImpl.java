package mk.ukim.finki.mp.stateful.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mk.ukim.finki.mp.stateful.dao.ContactDao;
import mk.ukim.finki.mp.stateful.model.Contact;
import mk.ukim.finki.mp.stateful.model.Sms2;

@Service
@Transactional
public class ContactServiceImpl implements ContactService{
	
	@Autowired
	private ContactDao conDao;

	@Override
	public String getNameFromNum(String phoneNum) {
		return conDao.getNameFromNum(phoneNum);
	}

	@Override
	public Contact getContactFromNum(String phoneNum) {
		return conDao.getContactFromNum(phoneNum);
	}

	@Override
	public List<Sms2> getRecivedByChosen(String cont, String from) {
		Contact con = getContactFromNum(cont);
		List<Sms2> rez = new ArrayList<Sms2>();
		List<Sms2> recived = con.getSmsRecived();
		for (Sms2 sms2 : recived) {
			if(sms2.getConFrom().getPhoneNum().equals(from)){
				rez.add(sms2);
			}
		}
		return rez;
	}

	@Override
	public List<Sms2> getSentToChosen(String cont, String to) {
		Contact con = getContactFromNum(cont);
		Contact toCon = getContactFromNum(to);
		List<Sms2> rez = new ArrayList<>();
		List<Sms2> sent = con.getSmsSent();
		for (Sms2 sms2 : sent) {
			if(sms2.getConTo().contains(toCon)){
				rez.add(sms2);
			}
		}
		return rez;
	}

	
	@Override
	public List<String> getAllContactNumbers() {
		List<Contact> kontakti = conDao.getAllContacts();
		List<String> res = new ArrayList<>();
		for (Contact con : kontakti) {
			res.add(con.getPhoneNum());
		}
		return res;		
	}

}
