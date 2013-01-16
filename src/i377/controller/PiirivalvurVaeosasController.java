package i377.controller;

import javax.annotation.Resource;

import i377.entities.Amet;
import i377.repo.PiirivalvurVaeosasDaoImpl;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PiirivalvurVaeosasController {

	@Resource
	private PiirivalvurVaeosasDaoImpl pvv;
	
	@RequestMapping(value="/PiirivalvurVaeosas")
	public String PiirivalvurVaeosas() {
		return "PiirivalvurVaeosas";
	}
	
	@RequestMapping(value="/AddPiirivalvurVaeosas", method = RequestMethod.POST)
	public String AddPiirivalvurVaeosas(@ModelAttribute Amet amet, Model model) {
		return "PiirivalvurVaeosas";
	}
	
}
