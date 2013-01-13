package i377.controller;

import i377.entities.Amet;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class VaeosaController {

	@RequestMapping(value="/Vaeosa")
	public String Vaeosa() {
		return "Vaeosa";
	}
	
	@RequestMapping(value="/AddVaeosa", method = RequestMethod.POST)
	public String addVaeosa(@ModelAttribute Amet amet, Model model) {
		return "Vaeosa";
	}
	
}
