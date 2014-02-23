package mk.ukim.finki.mp.stateful.external;

import mk.ukim.finki.mp.stateful.model.Contact;
import mk.ukim.finki.mp.stateful.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class MockSystemExecutor implements SystemExecutor {
	
	
	@Autowired
	ContactService service;
	
	@Override
	public boolean validate(String phoneFrom, String phoneTo) {
		Contact from = service.getContactFromNum(phoneFrom);
		Contact to = service.getContactFromNum(phoneTo);
		if(from!=null && to!=null){
			return true;
		}		
		return false;
	}

	@Override
	public int sendSms() {
		return 5;
	}

}
