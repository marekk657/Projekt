package i377.repo;

import i377.entities.Amet;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

@Repository
public class AmetDaoImpl implements RecordDao<Amet> {

	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("Projekt");

	@Override
	public void addRecord(Amet record) {
		EntityManager em = emf.createEntityManager();
		
		try {		
			em.getTransaction().begin();			
			em.persist(em.merge(record));
			em.getTransaction().commit();
		} finally {
			em.close();
		}
	}

	@Override
	public List<Amet> records() {
		EntityManager entityManager = emf.createEntityManager();
		
		try {
			TypedQuery<Amet> q = entityManager.createNamedQuery("Amet.findAll", Amet.class);
			List<Amet> ametid = q.getResultList();
			return ametid;
		} finally {
			entityManager.close();
		}
	}

	@Override
	public List<Amet> activeRecords() {
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
	public void deleteRecord(Amet record) {
		EntityManager em = emf.createEntityManager();
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		try {
			Amet a = getRecordById(record.getId());
			
			record.setClosedby(auth.getName());
			record.setClosedon(new Date());
			record.setCreatedby(a.getCreatedby());
			record.setCreatedon(a.getCreatedon());
			record.setVersion(a.getVersion());
			record.setAmetvaeosas(a.getAmetvaeosas());
			
			em.getTransaction().begin();
			em.persist(em.merge(record));
			em.getTransaction().commit();
		} finally {
			em.close();
		}
	}

	@Override
	public Amet getRecordById(long id) {
		EntityManager em = emf.createEntityManager();
		
		try {
			
			TypedQuery<Amet> q = em.createNamedQuery("Amet.findById", Amet.class);
			q.setParameter("id", id);
			Amet a = q.getSingleResult();
			
			return a;
		} catch (Exception ex) {
			return null;
		} finally {
			em.close();
		}

	}

	@Override
	public void modifyRecord(Amet amet) {
		EntityManager em = emf.createEntityManager();
		
		try {
			Amet a = getRecordById(amet.getId());

			amet.setCreatedby(a.getCreatedby());
			amet.setCreatedon(a.getCreatedon());
			amet.setVersion(a.getVersion());
			amet.setAmetvaeosas(a.getAmetvaeosas());
			
			em.getTransaction().begin();
			
			em.persist(em.merge(amet));
			
			em.getTransaction().commit();
		} finally {
			em.close();
		}
	}	
}