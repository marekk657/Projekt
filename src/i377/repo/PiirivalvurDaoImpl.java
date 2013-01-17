package i377.repo;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

import i377.entities.Piirivalvur;

@Repository
public class PiirivalvurDaoImpl implements RecordDao<Piirivalvur> {

	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("Projekt");
	
	@Override
	public void addRecord(Piirivalvur record) {
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
	public List<Piirivalvur> records() {
		EntityManager entityManager = emf.createEntityManager();
		
		try {
			TypedQuery<Piirivalvur> q = entityManager.createNamedQuery("Piirivalvur.findAll", Piirivalvur.class);
			List<Piirivalvur> piirivalvurid = q.getResultList();
			return piirivalvurid;
		} finally {
			entityManager.close();
		}
	}

	@Override
	public void deleteRecord(Piirivalvur record) {
		EntityManager em = emf.createEntityManager();
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		try {
			Piirivalvur a = getRecordById(record.getId());
			
			record.setCloseddby(auth.getName());
			record.setClosedon(new Date());
			record.setCreatedby(a.getCreatedby());
			record.setCreatedon(a.getCreatedon());
			record.setVersion(a.getVersion());
			record.setPiirivalvurvaeosas(a.getPiirivalvurvaeosas());

			
			em.getTransaction().begin();
			em.persist(em.merge(record));
			em.getTransaction().commit();
		} finally {
			em.close();
		}
	}

	@Override
	public List<Piirivalvur> activeRecords() {
		EntityManager entityManager = emf.createEntityManager();
		
		try {
			TypedQuery<Piirivalvur> q = entityManager.createNamedQuery("Piirivalvur.findActiveRecords", Piirivalvur.class);
			
			List<Piirivalvur> actives = q.getResultList();
			
			return actives;
		} finally {
			entityManager.close();
		}
	}

	@Override
	public Piirivalvur getRecordById(long id) {
		EntityManager em = emf.createEntityManager();
		
		try {
			
			TypedQuery<Piirivalvur> q = em.createNamedQuery("Piirivalvur.findById", Piirivalvur.class);
			q.setParameter("id", id);
			Piirivalvur pv = q.getSingleResult();
			
			return pv;
		} catch (Exception ex) {
			return null;
		} finally {
			em.close();
		}
	}

	@Override
	public void modifyRecord(Piirivalvur record) {
		EntityManager em = emf.createEntityManager();
		
		try {
			Piirivalvur a = getRecordById(record.getId());

			record.setCreatedby(a.getCreatedby());
			record.setCreatedon(a.getCreatedon());
			record.setVersion(a.getVersion());
			record.setPiirivalvurvaeosas(a.getPiirivalvurvaeosas());
			
			em.getTransaction().begin();
			
			em.persist(em.merge(record));
			
			em.getTransaction().commit();
		} finally {
			em.close();
		}
	}

}
