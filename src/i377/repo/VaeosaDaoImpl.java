package i377.repo;

import i377.entities.Vaeosa;

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
public class VaeosaDaoImpl implements RecordDao<Vaeosa> {
	
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("Projekt");

	@Override
	public Vaeosa addRecord(Vaeosa record) {
		EntityManager em = emf.createEntityManager();
		
		try {
			Vaeosa vo = em.merge(record);
			em.getTransaction().begin();			
			em.persist(vo);
			em.getTransaction().commit();
			return vo;
		} finally {
			em.close();
		}
	}

	@Override
	public List<Vaeosa> records() {
		EntityManager entityManager = emf.createEntityManager();
		
		try {
			TypedQuery<Vaeosa> q = entityManager.createNamedQuery("Vaeosa.findAll", Vaeosa.class);
			List<Vaeosa> vaeosad = q.getResultList();
			return vaeosad;
		} finally {
			entityManager.close();
		}
	}

	@Override
	public void deleteRecord(Vaeosa record) {
		EntityManager em = emf.createEntityManager();
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		try {
			Vaeosa vo = getRecordById(record.getId());
			
			record.setClosedby(auth.getName());
			record.setClosedon(new Date());
			record.setCreatedby(vo.getCreatedby());
			record.setCreatedon(vo.getCreatedon());
			record.setVersion(vo.getVersion());
			record.setAmetvaeosas(vo.getAmetvaeosas());
			record.setPiirivalvurvaeosas(vo.getPiirivalvurvaeosas());
			
			em.getTransaction().begin();
			em.persist(em.merge(record));
			em.getTransaction().commit();
		} finally {
			em.close();
		}
	}

	@Override
	public List<Vaeosa> activeRecords() {
		EntityManager entityManager = emf.createEntityManager();
		
		try {
			TypedQuery<Vaeosa> q = entityManager.createNamedQuery("Vaeosa.findActiveRecords", Vaeosa.class);
			
			List<Vaeosa> actives = q.getResultList();
			
			return actives;
		} finally {
			entityManager.close();
		}
	}

	@Override
	public Vaeosa getRecordById(long id) {
		EntityManager em = emf.createEntityManager();
		
		try {
			
			TypedQuery<Vaeosa> q = em.createNamedQuery("Vaeosa.findById", Vaeosa.class);
			q.setParameter("id", id);
			Vaeosa vo = q.getSingleResult();
			
			return vo;
		} catch (Exception ex) {
			return null;
		} finally {
			em.close();
		}
	}

	@Override
	public void modifyRecord(Vaeosa record) {
		EntityManager em = emf.createEntityManager();
		
		try {
			Vaeosa vo = getRecordById(record.getId());

			record.setCreatedby(vo.getCreatedby());
			record.setCreatedon(vo.getCreatedon());
			record.setVersion(vo.getVersion());
			record.setAmetvaeosas(vo.getAmetvaeosas());
			record.setPiirivalvurvaeosas(vo.getPiirivalvurvaeosas());;
			
			em.getTransaction().begin();
			
			em.persist(em.merge(record));
			
			em.getTransaction().commit();
		} finally {
			em.close();
		}
	}
}
