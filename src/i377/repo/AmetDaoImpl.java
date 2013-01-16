package i377.repo;

import i377.entities.Amet;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

@Repository
public class AmetDaoImpl implements AmetDao {

	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("Projekt");

	@Override
	public void addAmet(Amet amet) {
		EntityManager em = emf.createEntityManager();
		
		try {	
			em.getTransaction().begin();
			
			em.persist(amet);
			
			em.getTransaction().commit();
		} finally {
			em.close();
		}
	}

	@Override
	public List<Amet> ametid() {
		EntityManager entityManager = emf.createEntityManager();
		
		try {
			TypedQuery<Amet> q = entityManager.createNamedQuery("Amet.findAll", Amet.class);
			List<Amet> ametid = q.getResultList();
			return ametid;
		}
		finally {
			entityManager.close();
		}
	}

	@Override
	public List<Amet> aktiivsedAmetid() {
		EntityManager entityManager = emf.createEntityManager();
		
		try {
			TypedQuery<Amet> q = entityManager.createNamedQuery("Amet.findActiveRecords", Amet.class);
			List<Amet> actives = q.getResultList();
			return actives;
		} finally {
			entityManager.close();
		}
	}

	@Override
	public void deleteAmet(Amet amet, long Id) {
		EntityManager em = emf.createEntityManager();
	
		
		// TODO: kustutamise loogika
		
		try {
			em.getTransaction().begin();
			
			em.merge(amet);
			
			em.getTransaction().commit();
		} finally {
			em.close();
		}
	}

	@Override
	public void modifyAmet(Amet amet, long Id) {
		EntityManager em = emf.createEntityManager();
		
		
		// TODO: muutmise loogika.
		
		try {
			em.getTransaction().begin();
			
			em.merge(amet);
			
			em.getTransaction().commit();
		} finally {
			em.close();
		}
	}	
}