package i377.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;


import i377.entities.PiirivalvurVaeosas;
import i377.repo.AmetVaeosasDaoImpl;
import i377.repo.PiirivalvurDaoImpl;
import i377.repo.PiirivalvurVaeosasDaoImpl;
import i377.repo.VaeosaDaoImpl;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PiirivalvurVaeosasController {

	@Resource
	private PiirivalvurVaeosasDaoImpl pvvDao;
	
	@Resource
	private AmetVaeosasDaoImpl amvoDao;
	
	@Resource
	private VaeosaDaoImpl voDao;
	
	@Resource 
	private PiirivalvurDaoImpl pvDao;
	
	@RequestMapping(value="/PiirivalvurVaeosas")
	public String piirivalvurVaeosas(Model model) {	
		PiirivalvurVaeosas pva = new PiirivalvurVaeosas();
		pva.setId(-1);
		
		model.addAttribute("ametid", amvoDao.activeRecords());
		model.addAttribute("vaeosad", voDao.activeRecords());
		model.addAttribute("piirivalvurid", pvDao.activeRecords());
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
		
		model.addAttribute("ametid", amvoDao.activeRecords());
		model.addAttribute("vaeosad", voDao.activeRecords());
		model.addAttribute("piirivalvurid", pvDao.activeRecords());
		
		return "PiirivalvurVaeosas";
	}
	
	@RequestMapping(value="/AddPiirivalvurVaeosas", method = RequestMethod.POST)
	public String addPiirivalvurVaeosas(@ModelAttribute @Valid PiirivalvurVaeosas pva, Model model, BindingResult result) {
		
		if (result.hasErrors()){
			model.addAttribute("errors", true);
//			model.addAttribute("piirivalvurvaeosasform", pva);
			return "PiirivalvurVaeosas";
		}
		
		model.addAttribute("ametid", amvoDao.activeRecords());
		model.addAttribute("vaeosad", voDao.activeRecords());
		model.addAttribute("piirivalvurid", pvDao.activeRecords());
		model.addAttribute("piirivalvurvaeosasform", pvvDao.addRecord(pva));
		model.addAttribute("piirivalvurVaeosasAdded", true);
		return "PiirivalvurVaeosas";
	}
	
	@RequestMapping(value="/ModifyPiirivalvurVaeosas", method = RequestMethod.POST)
	public String modifyPiirivalvurVaeosas(@ModelAttribute @Valid PiirivalvurVaeosas pva, Model model, BindingResult result) {
		
		if (result.hasErrors()){
			model.addAttribute("errors", true);
//			model.addAttribute("piirivalvurvaeosasform", pva);
			return "PiirivalvurVaeosas";
		}
		
		model.addAttribute("ametid", amvoDao.activeRecords());
		model.addAttribute("vaeosad", voDao.activeRecords());
		model.addAttribute("piirivalvurid", pvDao.activeRecords());
		model.addAttribute("piirivalvurvaeosasform", pva);
		pvvDao.modifyRecord(pva);
		model.addAttribute("piirivalvurvaeosastModified", true);
		return "PiirivalvurVaeosas";
	}
	
	@RequestMapping(value="/DeletePiirivalvurVaeosas", method = RequestMethod.POST)
	public String deletePiirivalvurVaeosas(@ModelAttribute PiirivalvurVaeosas pva, Model model) {
		model.addAttribute("piirivalvurvaeosasform", pva);
		pvvDao.deleteRecord(pva);
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
