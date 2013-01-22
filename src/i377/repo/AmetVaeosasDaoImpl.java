package i377.repo;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import i377.entities.AmetVaeosas;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

@Repository
public class AmetVaeosasDaoImpl implements RecordDao<AmetVaeosas> {
	
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("Projekt");

	@Override
	public AmetVaeosas addRecord(AmetVaeosas record) {
		EntityManager em = emf.createEntityManager();

		try {	
			AmetVaeosas av = em.merge(record);
			em.getTransaction().begin();
			em.persist(av);
			em.getTransaction().commit();
			return av;
		} finally {
			em.close();
		}
	}

	@Override
	public List<AmetVaeosas> records() {
		EntityManager em = emf.createEntityManager();
		
		try {
			TypedQuery<AmetVaeosas> q = em.createNamedQuery("AmetVaeosas.findAll", AmetVaeosas.class);
			List<AmetVaeosas> ametidVaeosades = q.getResultList();
			return ametidVaeosades;
		} finally {
			em.close();
		}
	}

	@Override
	public void deleteRecord(AmetVaeosas record) {
		EntityManager em = emf.createEntityManager();
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		try {
			AmetVaeosas a = getRecordById(record.getId());
			
			record.setClosedby(auth.getName());
			record.setClosedon(new Date());
			record.setCreatedby(a.getCreatedby());
			record.setCreatedon(a.getCreatedon());
//			record.setPiirivalvurvaeosas(record.getPiirivalvurvaeosas());
			
			em.getTransaction().begin();
			em.persist(em.merge(record));
			em.getTransaction().commit();
		} finally {
			em.close();
		}
	}

	@Override
	public List<AmetVaeosas> activeRecords() {
		EntityManager em = emf.createEntityManager();
		
		try {
			TypedQuery<AmetVaeosas> q = em.createNamedQuery("AmetVaeosas.findActiveRecords", AmetVaeosas.class);
			List<AmetVaeosas> ametidVaeosades = q.getResultList();
			return ametidVaeosades;
		} finally {
			em.close();
		}
	}

	@Override
	public AmetVaeosas getRecordById(long id) {
		EntityManager em = emf.createEntityManager();
		
		try {
			
			TypedQuery<AmetVaeosas> q = em.createNamedQuery("AmetVaeosas.findById", AmetVaeosas.class);
			q.setParameter("id", id);
			AmetVaeosas avs = q.getSingleResult();
			
			return avs;
		}catch (Exception ex){
			return null;
		} finally {
			em.close();
		}
	}

	@Override
	public void modifyRecord(AmetVaeosas record) {
		EntityManager em = emf.createEntityManager();
		
		try {
			AmetVaeosas a = getRecordById(record.getId());

			record.setCreatedby(a.getCreatedby());
			record.setCreatedon(a.getCreatedon());
			record.setVersion(a.getVersion());
			record.setPiirivalvurvaeosas(record.getPiirivalvurvaeosas());
			
			em.getTransaction().begin();
			
			em.persist(em.merge(record));
			
			em.getTransaction().commit();
		} finally {
			em.close();
		}		
	}
}
