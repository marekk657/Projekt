package i377.repo;

import i377.entities.Amet;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

public class AmetDaoImpl implements AmetDao {

	private EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Projekt");

	@Override
	public void addAmet(Amet amet) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String createdby = auth.getName();
		
		amet.setCreatedby(createdby);
		
		Calendar c1 = Calendar.getInstance();
		c1.getTime();
		
		amet.setCreatedon(new Timestamp(c1.getTimeInMillis()));
		
		try {
			entityManager.getTransaction().begin();
			
			entityManager.persist(amet);
//			
//			entityManager.getTransaction().commit();
		} finally {
			entityManager.close();
		}
	}

	@Override
	public List<Amet> ametid() {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		
		try {
			TypedQuery<Amet> q = entityManager.createNamedQuery("Amet.findAll", Amet.class);
			List<Amet> ametid = q.getResultList();
			return ametid;
		}
		finally {
			entityManager.close();
		}
	}
}