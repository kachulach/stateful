package mk.ukim.finki.mp.stateful.service;

public interface Sms2Service {
	
	public boolean sendSms(String from, String to, String content);

}
