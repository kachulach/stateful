package mk.ukim.finki.mp.stateful.dao;

import java.util.ArrayList;
import java.util.List;





import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Role;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Repository;

import mk.ukim.finki.mp.stateful.model.Contact;
import mk.ukim.finki.mp.stateful.model.User;
import mk.ukim.finki.mp.stateful.model.Game;

@Repository
public class GameDaoImpl implements GameDao {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void insertGame(String name, String description, String price,
			  String gameType, String picLocation, String numBought) {
		
		Game game = new Game(name, picLocation, gameType, description, price, numBought);		
		getCurrentSession().save(game);
		
	}
	
	
	@Override
	public boolean gameExists(String name) {
		@SuppressWarnings("unchecked")
		
		Query q = getCurrentSession().createQuery(
			"SELECT g from Game g WHERE g.name=:name");
			q.setParameter("name", name);		
		
		return q.list().size()!=0;
	}

	@Override
	public List<Game> allGames(int at) {
		List<Game> res = getCurrentSession().createQuery("FROM Game").setFirstResult(at).setMaxResults(5).list();
		return res;		
	}

	@Override
	public int allGamesSize() {
		return getCurrentSession().createQuery("FROM Game").list().size();
	}


}
