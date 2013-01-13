package i377.controller;

import i377.entities.Amet;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PiirivalvurVaeosasController {

	@RequestMapping(value="/PiirivalvurVaeosas")
	public String PiirivalvurVaeosas() {
		return "PiirivalvurVaeosas";
	}
	
	@RequestMapping(value="/AddPiirivalvurVaeosas", method = RequestMethod.POST)
	public String AddPiirivalvurVaeosas(@ModelAttribute Amet amet, Model model) {
		return "PiirivalvurVaeosas";
	}
	
}
