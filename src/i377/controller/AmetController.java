package i377.controller;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
		model.addAttribute("ametform", new Amet());
		return "Amet";
	}
	
	@RequestMapping(value = "/ModifyAmet")
	public String ModifyAmet(@ModelAttribute Amet amet, Model model) {
		model.addAttribute("ametform", amet); // TODO:!!
//		ametDao.modifyAmet(amet, 0L);
		return "Amet";
	}
	
	@RequestMapping(value = "/AddAmet", method = RequestMethod.POST)
	public String LisaAmet(@ModelAttribute Amet amet, Model model) {
		model.addAttribute("ametform", amet);
		ametDao.addAmet(amet);
		model.addAttribute("ametAdded", true);
		return "Amet";
	}
	
	@RequestMapping(value = "/DeleteAmet", method = RequestMethod.GET)
	public String DeleteAmet(@ModelAttribute Amet amet, Model model) {
		model.addAttribute("deleteAmet", true);
//		ametDao.deleteAmet(amet, 0L);
		return "Amet";
	}
	
	@RequestMapping(value = "/Ametid")
	public String AllAmetid(Model model) {
		List<Amet> ametid = ametDao.ametid();
		model.addAttribute("Ametid", ametid);
		return "Ametid";
	}
}