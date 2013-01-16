package i377.controller;

import javax.annotation.Resource;

import i377.entities.Vaeosa;
import i377.repo.VaeosaDaoImpl;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class VaeosaController {
	
	@Resource
	private VaeosaDaoImpl voDao;

	@RequestMapping(value="/Vaeosa")
	public String Vaeosa() {
		return "Vaeosa";
	}
	
	@RequestMapping(value="/AddVaeosa", method = RequestMethod.POST)
	public String addVaeosa(@ModelAttribute Vaeosa vo, Model model) {
		return "Vaeosa";
	}
	
}
