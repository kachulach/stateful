package mk.ukim.finki.mp.stateful.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.Box.Filler;

import mk.ukim.finki.mp.stateful.model.Game;
import mk.ukim.finki.mp.stateful.model.UploadedFile;
import mk.ukim.finki.mp.stateful.service.ContactService;
import mk.ukim.finki.mp.stateful.service.GameService;
import mk.ukim.finki.mp.stateful.service.UserService;
import mk.ukim.finki.mp.stateful.validator.FileValidator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;



@Controller
@SessionAttributes(value = { "username" })
@RequestMapping(value = "/game")
public class GameController {		
	
	@Autowired
	UserService userService;
	
	@Autowired
	GameService gameService;
	
	@Autowired  
	FileValidator fileValidator;
	
	@RequestMapping(value = {"/fileupload"}, method = RequestMethod.GET)	
	public ModelAndView getUploadForm(  
			   @ModelAttribute("uploadedFile") UploadedFile uploadedFile,  
			   BindingResult result) {
		
		System.out.println("get fileupload");
		return new ModelAndView("fileupload");  
		
	}
	
	
	@RequestMapping(value = {"/fileupload"}, method = RequestMethod.POST)	
	public ModelAndView fileUploaded(
			@ModelAttribute("uploadedFile") UploadedFile uploadedFile,
			BindingResult result, HttpSession session) {
		
		InputStream inputStream = null;
		OutputStream outputStream = null;

		MultipartFile file = uploadedFile.getFile();
		fileValidator.validate(uploadedFile, result);

		String fileName = file.getOriginalFilename();

		if (result.hasErrors()) {
			System.out.println("result has errors");
			return new ModelAndView("fileupload");
		}

		try {
			inputStream = file.getInputStream();
			
			File newFile = new File("C:\\Users\\dell\\Desktop\\upload\\" + fileName);
			if (!newFile.exists()) {
				newFile.createNewFile();				
			}
			outputStream = new FileOutputStream(newFile);
			int read = 0;
			byte[] bytes = new byte[1024];

			while ((read = inputStream.read(bytes)) != -1) {
				outputStream.write(bytes, 0, read);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return new ModelAndView("showFile", "message", fileName);
	}
	
	@RequestMapping(value = {"/welcome"}, method = RequestMethod.GET)	
	public ModelAndView getWelcome(HttpServletRequest request, HttpSession session) {
		
		if(session==null) 
			System.out.println("session not existing");
		else 
			System.out.println("username:  " + session.getAttribute("username"));
		
		ModelAndView view = new ModelAndView("welcome");
		return view;
		
	}
	
	@RequestMapping(value = {"/addgame"}, method = RequestMethod.GET)	
	public ModelAndView getAddGame(HttpServletRequest request) {
		
		ModelAndView view = new ModelAndView("addgame");
		return view;
	}
	
	@RequestMapping(value = {"/addgame"}, method = RequestMethod.POST)	
	public ModelAndView postAddGame(String name, String description, String price,
			String gameType, String picLocation, 
			HttpServletResponse response, HttpServletRequest request, HttpSession session) 
	{		
		ModelAndView view = new ModelAndView("addgame");
		boolean successInsert = gameService.insertGame(name, description, price, gameType, picLocation);
		
		if(successInsert){		
			view.addObject("msg", "������ � ������� ��������.");
		} 
		else{			
			view.addObject("msg", "���� ���� ��� ������.");
		}		
		return view;
	}
	
	@RequestMapping(value = {"/buygame"}, method = RequestMethod.GET)	
	public ModelAndView getBuyGame(HttpServletRequest request) {
		
		ModelAndView view = new ModelAndView("buygame");
		return view;
	}
	
	@RequestMapping(value = {"/changegame"}, method = RequestMethod.GET)	
	public ModelAndView getChangeGame(HttpServletRequest request) {			
				
		List<Game> games = this.gameService.listAllGames(this.calcAtPaginaiton(request));
				
		int size = gameService.allGamesSize();
		Double temp = (size-1)*1.0/5;
		int pages = (int) Math.floor(temp);
		int current = this.calcPage(request);
		
		ModelAndView view = new ModelAndView("changegame");
		view.addObject("games", games);
		view.addObject("size", size);
		view.addObject("pages", pages+1);
		view.addObject("current", current);
		
		String change = request.getParameter("change");		
		
		if(change!=null){
			
			Game g = gameService.getGameByName(change);			
			view.addObject("change", g);
			System.out.println("current "+current);
			
		}
		
		return view;
	}
	
	@RequestMapping(value = {"/changegame"}, method = RequestMethod.POST)	
	public String postChangeGame(String nameOld, String nameNew, String description, String price,
			String gameType, String picLocation, 
			HttpServletResponse response, HttpServletRequest request, HttpSession session) {			
				
		
		Game temp = gameService.getGameByName(nameOld);
		gameService.updateGame(nameNew, description, price, gameType, picLocation, temp);
		
		System.out.println("Current page:  ");
		System.out.println(session.getAttribute("current"));
		System.out.println(session.getAttributeNames());
		
		
		return "redirect:changegame?change="+nameNew;
	}
	
	@RequestMapping(value = {"/deletegame"}, method = RequestMethod.GET)	
	public String getDeleteGame(HttpServletRequest request) {
		
		String page = request.getParameter("page");
		String game = request.getParameter("game");		
				
		System.out.println("game deleted: " + gameService.deleteGame(game));
		
		return "redirect:changegame?page="+page;
		
	}
	
	
	
	@RequestMapping(value = {"/gametype"}, method = RequestMethod.GET)	
	public ModelAndView getGameType(HttpServletRequest request) {
		
		ModelAndView view = new ModelAndView("gametype");
		return view;
	}
	
	@RequestMapping(value = {"/recommended"}, method = RequestMethod.GET)	
	public ModelAndView getRecommended(HttpServletRequest request) {
		
		ModelAndView view = new ModelAndView("recommended");
		return view;
	}
	
	@RequestMapping(value = {"/register"}, method = RequestMethod.GET)	
	public ModelAndView getRegister(HttpServletRequest request) {		
		ModelAndView view = new ModelAndView("register");
		return view;
	}
	
	@RequestMapping(value = {"/register"}, method = RequestMethod.POST)	
	public ModelAndView postRegister(String first_name, String last_name, String t_and_c,
			String email, String usernameF, String passwd, String password_confirmation, 
			HttpServletResponse response, HttpServletRequest request, HttpSession session) 
	{
		
		ModelAndView view = new ModelAndView("register");
		
		if(!passwd.equals(password_confirmation)){
			this.viewObjectsForRegisterForm(view, first_name, last_name, email, usernameF);			
			view.addObject("msg", "��������� ������� �� ���������.");
		}
		else if(t_and_c==null){
			this.viewObjectsForRegisterForm(view, first_name, last_name, email, usernameF);			
			view.addObject("msg", "���� �� �� ��������� �� ��������� � �������� �� ������� �����������.");
		}
		else
		{
			boolean succesInsert = userService.insertUser(first_name, last_name, email, usernameF, passwd);
			if(succesInsert){		
				view.addObject("msg", "������� �����������.");
			} 
			else{
				this.viewObjectsForRegisterForm(view, first_name, last_name, email, usernameF);
				view.addObject("msg", "������������ ��� ������.");
			}		
			
		}
		
		return view;
	}
	
	@RequestMapping(value = {"login"}, method = RequestMethod.POST)	
	public String postLogin(String username, String password, Integer rememberme, 
			String url,	HttpServletResponse response, 
			HttpServletRequest request, HttpSession session) {
		
		String redirect = "redirect:";
		boolean userExists = userService.userExists(username);
				
		if(userExists){
			boolean loginSuccess = userService.checkCredentials(username, password);
			if(loginSuccess){
				session.setAttribute("username", username);
				if(rememberme != null){
					System.out.println("creating cookie");
					createCookie(response, username);					
				}				
			}			
			String viewName = this.createViewNameFromUrl(url);
			redirect+=viewName;
		}	 
			
		else redirect+="register";
		
		return redirect;		
	}
	
	@RequestMapping(value = {"/logout"}, method = RequestMethod.GET)	
	public String getLogout(HttpServletRequest request, HttpSession session) {
		
		//todo
		return "";
		
	}
	
	
	public boolean hasUsernameLoggedIn(HttpSession session)
	{
		return session.getAttribute("username")!=null;
	}
	
	public void createCookie(HttpServletResponse response, String username){
		Cookie cookie;
		cookie = new Cookie("username", username);
		cookie.setMaxAge(60);		
		response.addCookie(cookie);
	}
	
	public String createViewNameFromUrl(String url){
		
		String temp = url.substring(0, url.length()-4);
		String[] parts = temp.split("/");
		String viewName = parts[parts.length-1];
		
		return viewName;
	}
	
	public ModelAndView viewObjectsForRegisterForm(ModelAndView view, 
			String first_name, String last_name, String email, String usernameF){
		
		view.addObject("first_name", first_name);
		view.addObject("last_name", last_name);
		view.addObject("email", email);
		view.addObject("usernameF", usernameF);
		
		return view;
		
	}
	
	/**
	 * Calculates the order number for the first game on a page
	 * so it can get 5 more games from that one -- for changegame
	 * 
	 * @param  query  the query string from the url (page param)
	 * @return at     the order number of the game	 
	 */
	public int calcAtPaginaiton(HttpServletRequest request){
		
		int page = 1;
		
		if(request.getParameter("page")!=null && Integer.parseInt(request.getParameter("page"))>0){			
				page = Integer.parseInt(request.getParameter("page"));
				// if page attr is bigger than the actual number of pages
				if(page > Math.ceil(gameService.allGamesSize()*1.0/5))
					page = (int) Math.ceil(gameService.allGamesSize()*1.0/5);						
		}		
				
		int at = (page-1) * 5;
		return at;
	}
	
	/**
	 * Calculates the current page -- for changegame
	 * 
	 * @param  query  the query string from the url (page param)
	 * @return page   the current page
	 */
	public int calcPage(HttpServletRequest request){
		int page = 1;
		if(request.getParameter("page")!=null && Integer.parseInt(request.getParameter("page"))>0){			
			page = Integer.parseInt(request.getParameter("page"));
				// if page attr is bigger than the actual number of pages
			if(page > Math.ceil(gameService.allGamesSize()*1.0/5))
				page = (int) Math.ceil(gameService.allGamesSize()*1.0/5);						
		}
		return page;
	}
	
}
