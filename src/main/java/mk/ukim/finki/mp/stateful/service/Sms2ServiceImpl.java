package mk.ukim.finki.mp.stateful.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mk.ukim.finki.mp.stateful.dao.ContactDao;
import mk.ukim.finki.mp.stateful.dao.Sms2Dao;
import mk.ukim.finki.mp.stateful.model.Contact;
import mk.ukim.finki.mp.stateful.model.Sms2;

@Service
@Transactional
public class Sms2ServiceImpl implements Sms2Service{

	@Autowired
	Sms2Dao sms2dao;
	
	@Autowired
	ContactDao condao;
	
	@Override
	public boolean sendSms(String from, String to, String content) {
		
		Contact conFrom = condao.getContactFromNum(from);
		///
		List<Contact> tosList = new ArrayList<>();		
		String[] tos = to.split(",");
		for (int i = 0; i < tos.length; i++) {			
			Contact con = condao.getContactFromNum(tos[i]);
			if(con==null){
				return false;
			}
			tosList.add(con);
		}
		///
		Sms2 sms2 = new Sms2();
		sms2.setConFrom(conFrom);
		sms2.setConTo(tosList);
		sms2.setContent(content);
		
		if(conFrom!=null && tosList.size()!=0){
			sms2dao.addSMS(sms2);
			return true;
		}
		return false;		
	}

}
