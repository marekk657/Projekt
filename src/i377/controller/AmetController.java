package i377.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import i377.entities.Amet;
import i377.repo.AmetDaoImpl;

@Controller
public class AmetController {

	@Resource
	private AmetDaoImpl ametDao;
	
	@RequestMapping(value = "/Amet")
	public String NewAmet(Model model) {
		Amet a = new Amet();
		a.setId(-1);
		model.addAttribute("ametform", a);
		return "Amet";
	}
	
	@RequestMapping(value = "/Amet/{userId}/", method = RequestMethod.GET)
	public String AmetById(@PathVariable("userId") long id, Model model) {
		Amet a = ametDao.getRecordById(id);
		if (a != null)
			model.addAttribute("ametform", a);
		else
			model.addAttribute("ametform", new Amet());
		
		return "Amet";
	}
	
	@RequestMapping(value = "/ModifyAmet", method = RequestMethod.POST)
	public String ModifyAmet(@ModelAttribute @Valid Amet amet, Model model, BindingResult result) {
		
		if (result.hasErrors()){
			model.addAttribute("errors", true);
			
			return "Amet";
		}
		
		model.addAttribute("ametform", amet);
		ametDao.modifyRecord(amet);
		model.addAttribute("ametModified", true);
		return "Amet";
	}
	
	@RequestMapping(value = "/AddAmet", method = RequestMethod.POST)
	public String LisaAmet(@ModelAttribute @Valid Amet amet, Model model, BindingResult result) {
		
		if (result.hasErrors()){
			model.addAttribute("errors", true);
			
			return "Amet";
		}
		
		model.addAttribute("ametform", ametDao.addRecord(amet));
		model.addAttribute("ametAdded", true);
		return "Amet";
	}
	
	@RequestMapping(value = "/DeleteAmet", method = RequestMethod.POST)
	public String DeleteAmet(@ModelAttribute Amet amet, Model model) {
		model.addAttribute("ametform", amet);
		model.addAttribute("deleteAmet", true);
		ametDao.deleteRecord(amet);
		return "Amet";
	}
	
	
	@RequestMapping(value = "/Ametid")
	public String AllAmetid(Model model) {
		List<Amet> ametid = ametDao.records();
		model.addAttribute("Ametid", ametid);
		return "Ametid";
	}
}