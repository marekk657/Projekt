package i377.setup;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.stereotype.Component;

@Component
public class TestData {
	
	@Resource
	private AmetTestData atd;
	
	@Resource
	private PiirivalvurTestData ptd;
	
	@Resource
	private VaeosaTestData votd;
	
	@Resource
	private PiirivalvurVaeosasTestData pvvtd;
	
	@Resource
	private AmetVaeosasTestData avotd;
	
	@PostConstruct
	public void insert() {
		atd.insertTestData();
		ptd.insertTestData();
		votd.insertTestData();
		avotd.insertTestData();
		pvvtd.insertTestData();
	}
	
}
