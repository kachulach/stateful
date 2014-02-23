package mk.ukim.finki.mp.stateful.external;


public interface SystemExecutor {

	public boolean validate(String phoneFrom, String phoneTo);
	
	public int sendSms();
	
}
