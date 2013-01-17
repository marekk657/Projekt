package i377.controller;

import java.util.List;

import javax.annotation.Resource;

import i377.entities.Amet;
import i377.entities.AmetVaeosas;
import i377.entities.Piirivalvur;
import i377.entities.PiirivalvurVaeosas;
import i377.entities.Vaeosa;
import i377.repo.PiirivalvurVaeosasDaoImpl;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PiirivalvurVaeosasController {

	@Resource
	private PiirivalvurVaeosasDaoImpl pvvDao;
	
	@RequestMapping(value="/PiirivalvurVaeosas")
	public String piirivalvurVaeosas(Model model) {
		
		// TODO: TESTDATA
		
		PiirivalvurVaeosas pva = new PiirivalvurVaeosas();
		pva.setId(-1);
		
		Piirivalvur pv = new Piirivalvur();
		pv.setEesnimi("Marek");
		pva.setPiirivalvur(pv);
		
		Vaeosa vo = new Vaeosa();
		vo.setNimetus("TestVaeosa");
		pva.setVaeosa(vo);
		
		AmetVaeosas amv = new AmetVaeosas();
		Amet a = new Amet();
		a.setNimetus("Jälle kokk");
		amv.setAmet(a);
		pva.setAmetvaeosa(amv);
		
		model.addAttribute("piirivalvurvaeosasform", pva);
		return "PiirivalvurVaeosas";
	}
	
	@RequestMapping(value="/PiirivalvurVaeosas/{userId}/", method = RequestMethod.GET)
	public String piirivalvurVaeosasById(@PathVariable("userId") long id, Model model) {
		PiirivalvurVaeosas pvv = pvvDao.getRecordById(id);
		
		if (pvv != null)
			model.addAttribute("piirivalvurvaeosasform", pvv);
		else
			model.addAttribute("piirivalvurvaeosasform", new PiirivalvurVaeosas());
		
		return "PiirivalvurVaeosas";
	}
	
	@RequestMapping(value="/AddPiirivalvurVaeosas", method = RequestMethod.POST)
	public String addPiirivalvurVaeosas(@ModelAttribute PiirivalvurVaeosas pva, Model model) {
		model.addAttribute("piirivalvurvaeosasform", pva);
		// here comes logic
		model.addAttribute("piirivalvurVaeosasAdded", true);
		return "PiirivalvurVaeosas";
	}
	
	@RequestMapping(value="/ModifyPiirivalvurVaeosas", method = RequestMethod.POST)
	public String modifyPiirivalvurVaeosas(@ModelAttribute PiirivalvurVaeosas pva, Model model) {
		model.addAttribute("piirivalvurvaeosasform", pva);
		// here comes logic
		model.addAttribute("piirivalvurvaeosastModified", true);
		return "PiirivalvurVaeosas";
	}
	
	@RequestMapping(value="/DeletePiirivalvurVaeosas", method = RequestMethod.POST)
	public String deletePiirivalvurVaeosas(@ModelAttribute PiirivalvurVaeosas pva, Model model) {
		model.addAttribute("piirivalvurvaeosasform", pva);
		// here comes logic
		model.addAttribute("deletePiirivalvurVaeosas", true);
		return "PiirivalvurVaeosas";
	}

	@RequestMapping(value="/PiirivalvuridVaeosades")
	public String allPiirivalvuridVaeosades(Model model) {
		List<PiirivalvurVaeosas> pvVaeosades = pvvDao.records();
		model.addAttribute("PiirivalvuridVaeosades", pvVaeosades);
		return "PiirivalvuridVaeosades";
	}
}
