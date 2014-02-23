package mk.ukim.finki.mp.stateful.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mk.ukim.finki.mp.stateful.service.ContactService;
import mk.ukim.finki.mp.stateful.service.Sms2Service;
import mk.ukim.finki.mp.stateful.external.MockSystemExecutor;
import mk.ukim.finki.mp.stateful.model.Contact;
import mk.ukim.finki.mp.stateful.model.Sms2;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;


@Controller
@SessionAttributes(value = { "contact", "saldo", "broevi" })
public class SmsController {		
	
	@Autowired
	ContactService serviceCon;
	
	@Autowired
	Sms2Service serviceSms2;
	
	@Autowired
	MockSystemExecutor exec;
	
	
	@RequestMapping(value = {"/welcome"}, method = RequestMethod.GET)
	//@Secured("ROLE_PRIVATE")
	public ModelAndView getPage(HttpServletRequest request) {
		
		ModelAndView view = new ModelAndView("welcome");
		return view;
	}
	
	
	
	
	@RequestMapping(value = "/*")
	@Secured({"ROLE_PRIVATE", "ROLE_ADMIN"})
	public String checkSession(HttpSession session, HttpServletRequest request, 
			HttpServletResponse response) {
		
		if(request.isUserInRole("ROLE_ADMIN"))
			return "redirect:admin";
		
		else if(isSetSessionContact(session)){
			return "redirect:recived";
		}
		
		else{
			return "redirect:insertNumber";
		}
	}
	
	@RequestMapping(value = { "insertNumber" }, method = RequestMethod.GET)
	@Secured("ROLE_PRIVATE")
	public ModelAndView insertNumber(HttpServletRequest request) 
	{	
		ModelAndView recived = new ModelAndView("recived");
		if(existsCookie(request)==null){
			ModelAndView insert = new ModelAndView("insertNumber");			
			return insert;
		}
		else{
			Cookie cookie = existsCookie(request);
			String number = cookie.getValue();
			Contact con = serviceCon.getContactFromNum(number);
			recived.addObject("saldo", 500);
			recived.addObject("contact", con);
			return recived;
		}
	}
	
	@RequestMapping(value = { "insertNumber" }, method = RequestMethod.POST)
	@Secured("ROLE_PRIVATE")
	public ModelAndView test(String number, String checked, 
			HttpServletResponse response, HttpSession session) 
	{
		ModelAndView recived = new ModelAndView("recived");
		ModelAndView insert = new ModelAndView("insertNumber");
		Contact con;
		con = serviceCon.getContactFromNum(number);
		
		if(con==null){
			insert.addObject("message", "Овој корисник не е регистриран!");
			return insert;
		}
		
		if(checked!=null)		{	
			Cookie cookie;
			cookie = new Cookie("number", number);
			//cookie.setMaxAge(2600000);
			cookie.setMaxAge(300);		
			response.addCookie(cookie);				
		}
		
		List<Sms2> rec = con.getSmsRecived();		
		recived.addObject("lista", rec);
		recived.addObject("saldo", 500);
		recived.addObject("contact", con);
		return recived;		
	}
	
	
	@RequestMapping(value = { "recived" }, method = RequestMethod.GET)
	@Secured("ROLE_PRIVATE")
	public ModelAndView recivedPage(HttpServletResponse response, HttpServletRequest request,HttpSession session) 
	{	
		if(isSetSessionContact(session)){
			
			ModelAndView recived = new ModelAndView("recived");	
			Contact con = (Contact)session.getAttribute("contact");		
			String phone = con.getPhoneNum();
			Contact c = serviceCon.getContactFromNum(phone);
			List<Sms2> rec = c.getSmsRecived();			
			recived.addObject("lista", rec);
			return recived;
			
		}
		else{
			return insertNumber(request);
		}
		
	}
	
	@RequestMapping(value = {"newsms"}, method = RequestMethod.GET)
	@Secured("ROLE_PRIVATE")
	public ModelAndView sendSMSPage(HttpServletResponse response, HttpServletRequest request,
			HttpSession session){
		if(isSetSessionContact(session)){
			ModelAndView view= new ModelAndView("newsms");				
			////
			List<String> brojcina = serviceCon.getAllContactNumbers();			
			StringBuilder sb = new StringBuilder();
			for (String string : brojcina) {				
				sb.append("\"" + string + "\"");
				sb.append(",");
			}
			sb.deleteCharAt(sb.length()-1);
			String broevi = sb.toString();			
			view.addObject("broevi",broevi);
			///
			Sms2 sms2 = new Sms2();
			view.addObject("sms2",sms2);
			return view;
		}
		else{		
			return insertNumber(request);
		}
	}
	
	@RequestMapping(value = {"newsms"}, method = RequestMethod.POST)
	@Secured("ROLE_PRIVATE")
	public ModelAndView sendSMS(@RequestParam String conTo, String content,
			HttpSession session) {		
		
		ModelAndView result= new ModelAndView("newsms");
		
		int saldo = (int)session.getAttribute("saldo");
		Contact con = (Contact)session.getAttribute("contact");
		
		String fromNum = con.getPhoneNum();
		
		if(!serviceSms2.sendSms(fromNum, conTo, content)){
			result.addObject("message", 
					"Овој корисник/корисници не постои!");
		}
		else{			
			result.addObject("message", "Пораката е успешно пратена.");
			String[] parts = conTo.split(",");
			for (int i = 0; i < parts.length; i++) {				
				saldo-=exec.sendSms();
			}
			
		}
		
		result.addObject("saldo", saldo);
		result.addObject("sms2", new Sms2());
		return result;
	}
	
	@RequestMapping(value = {"sent"}, method = RequestMethod.GET)
	@Secured("ROLE_PRIVATE")
	public ModelAndView readSMSPage(HttpServletResponse response, HttpServletRequest request,
			HttpSession session){
		if(isSetSessionContact(session)){
			ModelAndView result= new ModelAndView("sent");
			Contact con = (Contact)session.getAttribute("contact");
			String phone = con.getPhoneNum();
			Contact c = serviceCon.getContactFromNum(phone);
			List<Sms2> sent = c.getSmsSent();	
			result.addObject("sent", sent);
			return result;
		}
		else{
			return insertNumber(request);
		}	
		
	}
	
	@RequestMapping(value = {"chosen/{phone}"})
	@Secured("ROLE_PRIVATE")
	public ModelAndView chosenPage(@PathVariable String phone, HttpSession session) {
		
		ModelAndView view = new ModelAndView("chosen");
		
		Contact con = (Contact)session.getAttribute("contact");
		
		List<Sms2> smsS = serviceCon.getSentToChosen(con.getPhoneNum(), phone);
		List<Sms2> smsR = serviceCon.getRecivedByChosen(con.getPhoneNum(), phone);
				
		view.addObject("smsS", smsS);
		view.addObject("smsR", smsR);
		return view;
	}
	
	@RequestMapping(value = "/admin", method=RequestMethod.GET)
	@Secured("ROLE_ADMIN")
	public ModelAndView adminPage() {
		ModelAndView admin = new ModelAndView("reciveJson");		
		return admin;
	}
	
	
	@RequestMapping(value = "reciveJson", method = RequestMethod.POST,
			produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@Secured("ROLE_ADMIN")
	public String nesto(@RequestBody String jsonSms) throws JsonParseException, JsonMappingException, IOException  
	{
		//ObjectMapper mapper = new ObjectMapper();
		//Sms2 sms = mapper.readValue(jsonSms, Sms2.class);
		//System.out.println(sms);
		String[] attr = jsonSms.split(",");
		String conFrom = attr[0].split(":")[1];
		conFrom = conFrom.replace("\"", "");
		String conTo = attr[1].split(":")[1];
		conTo = conTo.replace("\"", "");
		conTo = conTo.replace("[", "");
		conTo = conTo.replace("]", "");
		
		if(exec.validate(conFrom, conTo)){
			return "{\"status\": \"1\"}";
		}
		return "{\"status\": \"0\"}";
	}
	
	public boolean isSetSessionContact(HttpSession session){
		
		Contact con = (Contact) session.getAttribute("contact");
		if(con==null){
			return false;
		}		
		return true;
		
	}
	
	public Cookie existsCookie(HttpServletRequest request){
		Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {			
	        if(cookie.getName().equals("number")){
	        	return cookie;       	
	        }	        
		}
		return null;
	}
	

}
