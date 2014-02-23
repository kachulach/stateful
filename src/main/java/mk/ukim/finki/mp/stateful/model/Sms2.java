package mk.ukim.finki.mp.stateful.model;
import java.util.List;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Entity;


@Entity
public class Sms2 {

	@Id
	@GeneratedValue
	private int id;
	
	private String content;	
	
	@ManyToMany(fetch=FetchType.EAGER)	 
	@JoinTable(name = "contact_sms",
			joinColumns = @JoinColumn(name = "smsrecived"),
			inverseJoinColumns = @JoinColumn(name = "conto"))
	private List<Contact> conTo;
	
	@ManyToOne(fetch=FetchType.EAGER)
	private  Contact conFrom;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<Contact> getConTo() {
		return conTo;
	}

	public void setConTo(List<Contact> conTo) {
		this.conTo = conTo;
	}

	public Contact getConFrom() {
		return conFrom;
	}

	public void setConFrom(Contact conFrom) {
		this.conFrom = conFrom;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
