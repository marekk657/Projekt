package i377.controller;

import javax.annotation.Resource;

import i377.entities.Amet;
import i377.repo.AmetVaeosasDaoImpl;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AmetVaeosasController {
	
	@Resource
	private AmetVaeosasDaoImpl amv;

	@RequestMapping(value="/AmetVaeosas")
	public String AmetVaeosas() {
		return "AmetVaeosas";
	}
	
	@RequestMapping(value="/AddAmetVaeosas", method = RequestMethod.POST)
	public String AddAmetVaeosas(@ModelAttribute Amet amet, Model model) {
		return "AmetVaeosas";
	}
	
}
