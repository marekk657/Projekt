package i377.controller;

import i377.entities.Amet;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AmetVaeosasController {

	@RequestMapping(value="/AmetVaeosas")
	public String AmetVaeosas() {
		return "AmetVaeosas";
	}
	
	@RequestMapping(value="/AddAmetVaeosas", method = RequestMethod.POST)
	public String AddAmetVaeosas(@ModelAttribute Amet amet, Model model) {
		return "AmetVaeosas";
	}
	
}
