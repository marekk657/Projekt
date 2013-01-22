package i377.setup;

import java.util.List;

import javax.annotation.Resource;

import i377.entities.Vaeosa;
import i377.repo.VaeosaDaoImpl;

import org.springframework.stereotype.Component;

@Component
public class VaeosaTestData {
	
	@Resource
	VaeosaDaoImpl voDao;
	
	private final String testUser = "TEST";
	
	public void insertTestData() {
		if (!checkTestData()) {
			voDao.addRecord(vaeosa1());
			voDao.addRecord(vaeosa2());
		}
	}
	
	private Vaeosa vaeosa1() {
		Vaeosa vo = new Vaeosa();
		vo.setKommentaar("lahe väeosa");
		vo.setKood("123456");
		vo.setNimetus("Lahe väeosa");
		return vo;
	}
	
	private Vaeosa vaeosa2() {
		Vaeosa vo = new Vaeosa();
		vo.setKommentaar("õige väeosa");
		vo.setKood("456789");
		vo.setNimetus("Õige väeosa");
		return vo;
	}
	
	private boolean checkTestData() {
		List<Vaeosa> list = voDao.records();
		
		for(Vaeosa vo : list) {
			if (testUser.equals(vo.getCreatedby()))
				return true;
		}
		
		return false;
	}
}
