package i377.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import i377.entities.AmetVaeosas;
import i377.repo.AmetDaoImpl;
import i377.repo.AmetVaeosasDaoImpl;
import i377.repo.VaeosaDaoImpl;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AmetVaeosasController {
	
	@Resource
	private AmetVaeosasDaoImpl amvDao;
	
	@Resource
	private AmetDaoImpl aDao;
	
	@Resource
	private VaeosaDaoImpl voDao;

	@RequestMapping(value="/AmetVaeosas")
	public String AmetVaeosas(Model model) {

		AmetVaeosas av = new AmetVaeosas();
		av.setId(-1);
//		av.setAmet(null);
//		av.setVaeosa(null);
		
		model.addAttribute("ametid", aDao.activeRecords());
		model.addAttribute("vaeosad", voDao.activeRecords());
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
		
		model.addAttribute("ametid", aDao.activeRecords());
		model.addAttribute("vaeosad", voDao.activeRecords());
		
		return "AmetVaeosas";
	}
	
	@RequestMapping(value="/AddAmetVaeosas", method = RequestMethod.POST)
	public String AddAmetVaeosas(@ModelAttribute @Valid AmetVaeosas av, Model model, BindingResult result) {
		
		if (result.hasErrors()){
			model.addAttribute("errors", true);
			model.addAttribute("ametvaeosasform", av);
			return "AmetVaeosas";
		}
		
		av.setAmet(aDao.getRecordById(av.getAmet().getId()));
		av.setVaeosa(voDao.getRecordById(av.getVaeosa().getId()));
		
		model.addAttribute("ametid", aDao.activeRecords());
		model.addAttribute("vaeosad", voDao.activeRecords());
		model.addAttribute("ametvaeosasform", amvDao.addRecord(av));
		model.addAttribute("ametvaeosaAdded", true);
		return "AmetVaeosas";
	}
	
	@RequestMapping(value="/ModifyAmetVaeosas", method = RequestMethod.POST)
	public String modifyAmetVaeosas(@ModelAttribute @Valid AmetVaeosas av, Model model, BindingResult result) {
		
		if (result.hasErrors()){
			model.addAttribute("errors", true);
			model.addAttribute("ametvaeosasform", av);
			return "AmetVaeosas";
		}
		
		
		model.addAttribute("ametid", aDao.activeRecords());
		model.addAttribute("vaeosad", voDao.activeRecords());
		model.addAttribute("ametvaeosasform", av);
		amvDao.modifyRecord(av);
		model.addAttribute("ametvaeosaModified", true);
		return "AmetVaeosas";
	}
	
	@RequestMapping(value="/DeleteAmetVaeosas", method = RequestMethod.POST)
	public String deleteAmetVaeosas(@ModelAttribute AmetVaeosas av, Model model) {
		model.addAttribute("ametvaeosasform", av);
		amvDao.deleteRecord(av);
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
