package i377.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;


import i377.entities.PiirivalvurVaeosas;
import i377.repo.AmetVaeosasDao;
import i377.repo.PiirivalvurDao;
import i377.repo.PiirivalvurVaeosasDao;
import i377.repo.VaeosaDao;

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
	private PiirivalvurVaeosasDao pvvDao;
	
	@Resource
	private AmetVaeosasDao amvoDao;
	
	@Resource
	private VaeosaDao voDao;
	
	@Resource 
	private PiirivalvurDao pvDao;
	
	@RequestMapping(value="/PiirivalvurVaeosas")
	public String piirivalvurVaeosas(Model model) {	
		PiirivalvurVaeosas pva = new PiirivalvurVaeosas();
		pva.setId(-1);
		
		model.addAttribute("ametid", amvoDao.activeRecords());
		model.addAttribute("vaeosad", voDao.activeRecords());
		model.addAttribute("piirivalvurid", pvDao.activeRecords());
		model.addAttribute("piirivalvurVaeosas", pva);
		return "PiirivalvurVaeosas";
	}
	
	@RequestMapping(value="/PiirivalvurVaeosas/{userId}/", method = RequestMethod.GET)
	public String piirivalvurVaeosasById(@PathVariable("userId") long id, Model model) {
		PiirivalvurVaeosas pvv = pvvDao.getRecordById(id);
		
		if (pvv != null)
			model.addAttribute("piirivalvurVaeosas", pvv);
		else
			model.addAttribute("piirivalvurVaeosas", new PiirivalvurVaeosas());
		
		model.addAttribute("ametid", amvoDao.activeRecords());
		model.addAttribute("vaeosad", voDao.activeRecords());
		model.addAttribute("piirivalvurid", pvDao.activeRecords());
		
		return "PiirivalvurVaeosas";
	}
	
	@RequestMapping(value="/AddPiirivalvurVaeosas", method = RequestMethod.POST)
	public String addPiirivalvurVaeosas(@ModelAttribute @Valid PiirivalvurVaeosas pva, BindingResult result, Model model) {
		
		if (result.hasErrors()){
			model.addAttribute("errors", true);

			return "PiirivalvurVaeosas";
		}
		
		model.addAttribute("ametid", amvoDao.activeRecords());
		model.addAttribute("vaeosad", voDao.activeRecords());
		model.addAttribute("piirivalvurid", pvDao.activeRecords());
		model.addAttribute("piirivalvurVaeosas", pvvDao.addRecord(pva));
		model.addAttribute("piirivalvurVaeosasAdded", true);
		return "PiirivalvurVaeosas";
	}
	
	@RequestMapping(value="/ModifyPiirivalvurVaeosas", method = RequestMethod.POST)
	public String modifyPiirivalvurVaeosas(@ModelAttribute @Valid PiirivalvurVaeosas pva, BindingResult result, Model model) {
		
		if (result.hasErrors()){
			model.addAttribute("errors", true);

			return "PiirivalvurVaeosas";
		}
		
		model.addAttribute("ametid", amvoDao.activeRecords());
		model.addAttribute("vaeosad", voDao.activeRecords());
		model.addAttribute("piirivalvurid", pvDao.activeRecords());
		model.addAttribute("piirivalvurVaeosas", pva);
		pvvDao.modifyRecord(pva);
		model.addAttribute("piirivalvurvaeosastModified", true);
		return "PiirivalvurVaeosas";
	}
	
	@RequestMapping(value="/DeletePiirivalvurVaeosas", method = RequestMethod.POST)
	public String deletePiirivalvurVaeosas(@ModelAttribute PiirivalvurVaeosas pva, Model model) {
		model.addAttribute("piirivalvurVaeosas", pva);
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
