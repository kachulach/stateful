package mk.ukim.finki.mp.stateful.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mk.ukim.finki.mp.stateful.dao.ContactDao;
import mk.ukim.finki.mp.stateful.dao.GameDao;
import mk.ukim.finki.mp.stateful.dao.UserDao;
import mk.ukim.finki.mp.stateful.model.Contact;
import mk.ukim.finki.mp.stateful.model.Game;
import mk.ukim.finki.mp.stateful.model.Sms2;
import mk.ukim.finki.mp.stateful.model.User;

@Service
@Transactional
public class GameServiceImpl implements GameService{

	
	@Autowired
	private GameDao gameDao;	

	@Override
	public boolean insertGame(String name, String description, 
			  String price, String gameType, String picLocation) {
		
		if(gameDao.gameExists(name)) return false;
		else{
			String numBought = "0";
			gameDao.insertGame(name, description, price, gameType, picLocation, numBought);	
			return true;
		}
			
		
	}

	@Override
	public List<Game> listAllGames() {
		return gameDao.allGames();
	}

}
