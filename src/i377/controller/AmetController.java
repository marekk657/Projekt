package i377.controller;
import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import i377.entities.Amet;
import i377.repo.AmetDao;
import i377.repo.AmetDaoImpl;

@Controller
public class AmetController {

	@Resource
	private AmetDaoImpl ametDao;
	
	@RequestMapping("/Amet")
	public String Amet() {
		return "Amet";
	}
	
	@RequestMapping(value = "/AddAmet", method = RequestMethod.POST)
	public String LisaAmet(@ModelAttribute Amet amet, Model model) {
		ametDao.addAmet(amet);
		return "Amet";
	}
}
