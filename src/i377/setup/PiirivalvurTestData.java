package i377.setup;

import java.util.List;

import javax.annotation.Resource;

import i377.entities.Piirivalvur;
import i377.repo.PiirivalvurDaoImpl;

import org.springframework.stereotype.Component;

@Component
public class PiirivalvurTestData {

	@Resource
	PiirivalvurDaoImpl pvDao;
	
	private final String testUser = "TEST";
	
	public void insertTestData() {
		if(!checkTestData()) {
			pvDao.addRecord(piirivalvur1());
			pvDao.addRecord(piirivalvur2());
			pvDao.addRecord(piirivalvur3());
			pvDao.addRecord(piirivalvur4());
		}
	}
	
	private Piirivalvur piirivalvur1() {
		Piirivalvur p = new Piirivalvur();
		p.setAadress("Tallinn");
		p.setEesnimi("Marek");
		p.setPerekonnanimi("Kikas");
		p.setEmail("email@email.ee");
		p.setTelefon("000000000");
		p.setIsikukood("123456789");
		p.setSodurikood("43215");
		p.setSugu(0);
		return p;
	}
	
	private Piirivalvur piirivalvur2() {
		Piirivalvur p = new Piirivalvur();
		p.setAadress("Võru linn");
		p.setEesnimi("Juhan");
		p.setPerekonnanimi("Mets");
		p.setEmail("email@email.ee");
		p.setTelefon("00003532");
		p.setIsikukood("3253689");
		p.setSodurikood("47430");
		p.setSugu(0);
		return p;
	}
	
	private Piirivalvur piirivalvur3() {
		Piirivalvur p = new Piirivalvur();
		p.setAadress("Eesti maa");
		p.setEesnimi("Peeter");
		p.setPerekonnanimi("Pakiraam");
		p.setEmail("email@email.ee");
		p.setTelefon("2353738");
		p.setIsikukood("32567892");
		p.setSodurikood("3690363");
		p.setSugu(0);
		return p;
	}
	
	private Piirivalvur piirivalvur4() {
		Piirivalvur p = new Piirivalvur();
		p.setAadress("Kuskilt maalt");
		p.setEesnimi("Juta");
		p.setPerekonnanimi("Keegi");
		p.setEmail("email@email.ee");
		p.setTelefon("9999999");
		p.setIsikukood("9345395");
		p.setSodurikood("23542");
		p.setSugu(1);
		return p;
	}
	
	private boolean checkTestData() {
		List<Piirivalvur> list = pvDao.records();
		
		for(Piirivalvur pv : list) {
			if (testUser.equals(pv.getCreatedby()))
				return true;
		}
		
		return false;
	}
}
