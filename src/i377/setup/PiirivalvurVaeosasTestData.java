package i377.setup;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import i377.entities.AmetVaeosas;
import i377.entities.PiirivalvurVaeosas;
import i377.repo.AmetVaeosasDaoImpl;
import i377.repo.PiirivalvurDaoImpl;
import i377.repo.PiirivalvurVaeosasDaoImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

@Component
public class PiirivalvurVaeosasTestData {

	@Resource
	PiirivalvurVaeosasDaoImpl pvvDao;
	
	@Resource
	PiirivalvurDaoImpl pvDao;
	
	@Resource
	AmetVaeosasDaoImpl amvDao;
	
	private final String testUser = "TEST";
	
	public void insertTestData() {
		if (!checkTestData()) {
			pvvDao.addRecord(piirivalvurVaeosas1());
			pvvDao.addRecord(piirivalvurVaeosas2());
		}
	}
	
	private PiirivalvurVaeosas piirivalvurVaeosas1() {
		PiirivalvurVaeosas pvv = new PiirivalvurVaeosas();
		AmetVaeosas amv = amvDao.records().get(1);
		pvv.setAlates(asDate("08/09/2011"));
		pvv.setKuni(asDate("04/05/2013"));
		pvv.setAmetvaeosa(amv);
		pvv.setKoormus(1.0);
		pvv.setPiirivalvur(pvDao.records().get(0));
		pvv.setVaeosa(amv.getVaeosa());
		return pvv;
	}
	
	private PiirivalvurVaeosas piirivalvurVaeosas2() {
		PiirivalvurVaeosas pvv = new PiirivalvurVaeosas();
		AmetVaeosas amv = amvDao.records().get(0);
		pvv.setAlates(asDate("01/12/2009"));
		pvv.setKuni(asDate("10/12/2013"));
		pvv.setAmetvaeosa(amv);
		pvv.setKoormus(0.75);
		pvv.setPiirivalvur(pvDao.records().get(3));
		pvv.setVaeosa(amv.getVaeosa());
		return pvv;
	}
	
	private boolean checkTestData() {
		List<PiirivalvurVaeosas> list = pvvDao.records();
		
		for(PiirivalvurVaeosas pvv : list) {
			if (testUser.equals(pvv.getCreatedby()))
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
