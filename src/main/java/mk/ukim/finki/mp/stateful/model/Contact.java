package mk.ukim.finki.mp.stateful.model;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

import org.springframework.context.annotation.Role;
import org.springframework.security.access.annotation.Secured;

@Entity

public class Contact {	
	
	@Id		
	private String phoneNum;
	
	private String name;
	
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name = "contact_sms",
			joinColumns = @JoinColumn(name = "conto"),
			inverseJoinColumns = @JoinColumn(name = "smsrecived"))	
	private List<Sms2> smsRecived;
	
	
	@OneToMany(mappedBy="conFrom", cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private List<Sms2> smsSent;
	
	
	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public List<Sms2> getSmsRecived() {
		return smsRecived;
	}

	public void setSmsRecived(List<Sms2> smsRecived) {
		this.smsRecived = smsRecived;
	}

	public List<Sms2> getSmsSent() {
		return smsSent;
	}

	public void setSmsSent(List<Sms2> smsSent) {
		this.smsSent = smsSent;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
