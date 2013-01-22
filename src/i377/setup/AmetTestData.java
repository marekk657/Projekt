package i377.setup;

import java.util.List;

import javax.annotation.Resource;

import i377.entities.Amet;
import i377.repo.AmetDaoImpl;

import org.springframework.stereotype.Component;

@Component
public class AmetTestData {

	@Resource
	private AmetDaoImpl aDao;
	
	private final String testUser = "TEST";
	
	public void insertTestData() {
		if (!checkTestData()) {
			aDao.addRecord(Amet1());
			aDao.addRecord(Amet2());
			aDao.addRecord(Amet3());
			aDao.addRecord(Amet4());
		}
	}
	
	private Amet Amet1() {
		Amet a = new Amet();
		a.setIscokood("TEST12");
		a.setKommentaar("Aeg süüa");
		a.setNimetus("KOKK");
		return a;
	}
	
	private Amet Amet2() {
		Amet a = new Amet();
		a.setIscokood("TEST34");
		a.setKommentaar("");
		a.setNimetus("Reamees");
		return a;
	}
	
	private Amet Amet3() {
		Amet a = new Amet();
		a.setIscokood("Koristaja");
		a.setKommentaar("");
		a.setNimetus("Koristaja");
		return a;
	}
	
	private Amet Amet4() {
		Amet a = new Amet();
		a.setIscokood("TEST78");
		a.setKommentaar("kamandab");
		a.setNimetus("Ohvitser");
		return a;
	}
	
	private boolean checkTestData() {
		List<Amet> ametid = aDao.records();
		for (Amet a : ametid) {
			if (testUser.equals(a.getCreatedby()))
				return true;
		}
		
		return false;
	}
}
