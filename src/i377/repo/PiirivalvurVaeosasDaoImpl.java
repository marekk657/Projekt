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

import i377.entities.PiirivalvurVaeosas;

@Repository
public class PiirivalvurVaeosasDaoImpl implements RecordDao<PiirivalvurVaeosas> {

	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("Projekt");
	
	@Override
	public PiirivalvurVaeosas addRecord(PiirivalvurVaeosas record) {
		EntityManager em = emf.createEntityManager();
		
		try {
			PiirivalvurVaeosas pva = em.merge(record);
			em.getTransaction().begin();			
			em.persist(pva);
			em.getTransaction().commit();
			return pva;
		} finally {
			em.close();
		}		
	}

	@Override
	public List<PiirivalvurVaeosas> records() {
		EntityManager entityManager = emf.createEntityManager();
		
		try {
			TypedQuery<PiirivalvurVaeosas> q = entityManager.createNamedQuery("PiirivalvurVaeosas.findAll", PiirivalvurVaeosas.class);
			List<PiirivalvurVaeosas> piirivalvuridVaeosades = q.getResultList();
			return piirivalvuridVaeosades;
		} finally {
			entityManager.close();
		}
	}

	@Override
	public void deleteRecord(PiirivalvurVaeosas record) {
		EntityManager em = emf.createEntityManager();
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		try {
			PiirivalvurVaeosas pva = getRecordById(record.getId());
			
			record.setClosedby(auth.getName());
			record.setClosedon(new Date());
			record.setCreatedby(pva.getCreatedby());
			record.setCreatedon(pva.getCreatedon());
			record.setVersion(pva.getVersion());
			
			em.getTransaction().begin();
			em.persist(em.merge(record));
			em.getTransaction().commit();
		} finally {
			em.close();
		}
	}

	@Override
	public List<PiirivalvurVaeosas> activeRecords() {
		EntityManager entityManager = emf.createEntityManager();
		
		try {
			TypedQuery<PiirivalvurVaeosas> q = entityManager.createNamedQuery("PiirivalvurVaeosas.findActiveRecords", PiirivalvurVaeosas.class);
			List<PiirivalvurVaeosas> piirivalvuridVaeosades = q.getResultList();
			return piirivalvuridVaeosades;
		} finally {
			entityManager.close();
		}
	}

	@Override
	public PiirivalvurVaeosas getRecordById(long id) {
		EntityManager em = emf.createEntityManager();
		
		try {
			
			TypedQuery<PiirivalvurVaeosas> q = em.createNamedQuery("PiirivalvurVaeosas.findById", PiirivalvurVaeosas.class);
			q.setParameter("id", id);
			PiirivalvurVaeosas pva = q.getSingleResult();
			
			return pva;
		} catch (Exception ex) {
			return null;
		} finally {
			em.close();
		}
	}

	@Override
	public void modifyRecord(PiirivalvurVaeosas record) {
		EntityManager em = emf.createEntityManager();
		
		try {
			PiirivalvurVaeosas pva = getRecordById(record.getId());

			record.setCreatedby(pva.getCreatedby());
			record.setCreatedon(pva.getCreatedon());
			record.setVersion(pva.getVersion());
			
			em.getTransaction().begin();
			
			em.persist(em.merge(record));
			
			em.getTransaction().commit();
		} finally {
			em.close();
		}
	}
}
