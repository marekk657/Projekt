package i377.controller;

import i377.entities.Amet;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PiirivalvurController {

	@RequestMapping(value="/Piirivalvur")
	public String Piirivalvur() {
		return "Piirivalvur";
	}
	
	@RequestMapping(value="/AddPiirivalvur", method = RequestMethod.POST)
	public String AddPiirivalvur(@ModelAttribute Amet amet, Model model) {
		return "Piirivalvur";
	}
	
}
