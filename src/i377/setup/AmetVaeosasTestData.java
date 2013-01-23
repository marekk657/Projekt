package i377.setup;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import i377.entities.AmetVaeosas;
import i377.repo.AmetDao;
import i377.repo.AmetVaeosasDao;
import i377.repo.VaeosaDao;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

@Component
public class AmetVaeosasTestData {

	@Resource
	AmetVaeosasDao avoDao;
	
	@Resource
	AmetDao aDao;
	
	@Resource
	VaeosaDao voDao;
	
	private final String testUser = "TEST";
	
	public void insertTestData() {
		if (!checkTestData()) {
			avoDao.addRecord(ametVaeosas1());
			avoDao.addRecord(ametVaeosas2());
			avoDao.addRecord(ametVaeosas3());
			avoDao.addRecord(ametVaeosas4());
		}
	}
	
	private AmetVaeosas ametVaeosas1() {
		AmetVaeosas amv = new AmetVaeosas();
		amv.setAlates(asDate("01/12/2012"));
		amv.setKuni(asDate("01/04/2013"));
		amv.setKommentaar("Kahuriliha");
		amv.setVaeosa(voDao.records().get(0));
		amv.setAmet(aDao.records().get(1));
		return amv;
	}
	
	private AmetVaeosas ametVaeosas2() {
		AmetVaeosas amv = new AmetVaeosas();
		amv.setAlates(asDate("10/02/2011"));
		amv.setKuni(asDate("01/03/2014"));
		amv.setKommentaar("Väeosa kokk");
		amv.setVaeosa(voDao.records().get(0));
		amv.setAmet(aDao.records().get(0));
		return amv;
	}
	
	private AmetVaeosas ametVaeosas3() {
		AmetVaeosas amv = new AmetVaeosas();
		amv.setAlates(asDate("01/12/2010"));
		amv.setKuni(asDate("04/12/2014"));
		amv.setKommentaar("hoiab korda");
		amv.setVaeosa(voDao.records().get(1));
		amv.setAmet(aDao.records().get(2));
		return amv;
	}
	
	private AmetVaeosas ametVaeosas4() {
		AmetVaeosas amv = new AmetVaeosas();
		amv.setAlates(asDate("07/08/2012"));
		amv.setKuni(asDate("07/09/2012"));
		amv.setKommentaar("Staabis vaja ka olla");
		amv.setVaeosa(voDao.records().get(1));
		amv.setAmet(aDao.records().get(3));
		return amv;
	}
	
	private boolean checkTestData() {
		List<AmetVaeosas> list = avoDao.records();
		
		for(AmetVaeosas amv : list) {
			if (testUser.equals(amv.getCreatedby()))
				return true;
		}
		
		return false;
	}
	
	private static Date asDate(String date) {
		try {
			return new SimpleDateFormat("dd/MM/yyyy").parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;

	}
}
