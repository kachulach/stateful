package mk.ukim.finki.mp.stateful.service;

import java.util.List;

import mk.ukim.finki.mp.stateful.model.Contact;
import mk.ukim.finki.mp.stateful.model.Sms2;

public interface ContactService {
	
	public String getNameFromNum(String phoneNum);
	
	public Contact getContactFromNum(String phoneNum);
	
	public List<Sms2> getRecivedByChosen(String con, String from);
	
	public List<Sms2> getSentToChosen(String con, String to);
	
	public List<String> getAllContactNumbers();
	
}
