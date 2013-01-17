package i377.controller;

//import java.util.ArrayList;


import java.util.List;

import javax.annotation.Resource;

import i377.entities.Amet;
import i377.entities.AmetVaeosas;
//import i377.entities.Piirivalvur;
//import i377.entities.PiirivalvurVaeosas;
import i377.entities.Vaeosa;
import i377.repo.AmetVaeosasDaoImpl;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AmetVaeosasController {
	
	@Resource
	private AmetVaeosasDaoImpl amvDao;

	@RequestMapping(value="/AmetVaeosas")
	public String AmetVaeosas(Model model) {
		
		// TODO: TESTDATA
		
		AmetVaeosas av = new AmetVaeosas();
		av.setId(-1);
		Vaeosa vo = new Vaeosa();
		vo.setNimetus("TestVAeosa");
		av.setVaeosa(vo);
		
		Amet a = new Amet();
		a.setNimetus("Kokk");
		a.setId(15);
		
		av.setAmet(a);
		
		model.addAttribute("ametvaeosasform", av);
		return "AmetVaeosas";
	}
	
	@RequestMapping(value="/AmetVaeosas/{userId}/", method = RequestMethod.GET)
	public String ametVaeosasById(@PathVariable("userId") long id, Model model) {
		AmetVaeosas amv = amvDao.getRecordById(id);
		
		if (amv != null)
			model.addAttribute("ametvaeosasform", amv);
		else
			model.addAttribute("ametvaeosasform", new AmetVaeosas());
		
		return "AmetVaeosas";
	}
	
	@RequestMapping(value="/AddAmetVaeosas", method = RequestMethod.POST)
	public String AddAmetVaeosas(@ModelAttribute AmetVaeosas av, Model model) {
		model.addAttribute("ametvaeosasform", av);
		// here comes logic
		model.addAttribute("ametvaeosaAdded", true);
		return "AmetVaeosas";
	}
	
	@RequestMapping(value="/ModifyAmetVaeosas", method = RequestMethod.POST)
	public String modifyAmetVaeosas(@ModelAttribute AmetVaeosas av, Model model) {
		model.addAttribute("ametvaeosasform", av);
		// here comes logic
		model.addAttribute("ametvaeosaModified", true);
		return "AmetVaeosas";
	}
	
	@RequestMapping(value="/DeleteAmetVaeosas", method = RequestMethod.POST)
	public String deleteAmetVaeosas(@ModelAttribute AmetVaeosas av, Model model) {
//		model.addAttribute("ametvaeosasform", av);
		// here comes logic
		model.addAttribute("deleteametvaeosas", true);
		return "AmetVaeosas";
	}
	
	@RequestMapping(value="/AmetidVaeosas")
	public String allAmetidVaeosasas (Model model) {
		List<AmetVaeosas> ametidVaeosades = amvDao.records();
		model.addAttribute("AmetidVaeosas", ametidVaeosades);
		return "AmetidVaeosas";
	}
}
