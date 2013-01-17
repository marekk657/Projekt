package i377.controller;

import java.util.List;

import javax.annotation.Resource;

import i377.entities.Piirivalvur;
import i377.repo.PiirivalvurDaoImpl;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PiirivalvurController {
	
	@Resource
	private PiirivalvurDaoImpl pvDao;

	@RequestMapping(value="/Piirivalvur")
	public String Piirivalvur(Model model) {
		Piirivalvur pv = new Piirivalvur();
		pv.setId(-1);
		model.addAttribute("piirivalvurform", pv);
		return "Piirivalvur";
	}
	
	@RequestMapping(value="/Piirivalvur/{userId}/", method = RequestMethod.GET)
	public String piirivalvurById(@PathVariable("userId") long id, Model model) {
		Piirivalvur pv = pvDao.getRecordById(id);
		
		if (pv != null)
			model.addAttribute("piirivalvurform", pv);
		else
			model.addAttribute("piirivalvurform", new Piirivalvur());
		
		return "Piirivalvur";
	}
	
	@RequestMapping(value="/AddPiirivalvur", method = RequestMethod.POST)
	public String addPiirivalvur(@ModelAttribute Piirivalvur valvur, Model model) {
		model.addAttribute("piirivalvurform", valvur);
		// here comes logic
		model.addAttribute("piirivalvurAdded", true);
		return "Piirivalvur";
	}
	
	@RequestMapping(value="/ModifyPiirivalvur", method = RequestMethod.POST)
	public String modifyPiirivalvur(@ModelAttribute Piirivalvur valvur, Model model) {
		model.addAttribute("piirivalvurform", valvur);
		// here comes logic
		model.addAttribute("piirivalvurModified", true);
		return "Piirivalvur";
	}
	
	@RequestMapping(value="/DeletePiirivalvur", method = RequestMethod.POST)
	public String deletePiirivalvur(@ModelAttribute Piirivalvur valvur, Model model) {
//		model.addAttribute("piirivalvurform", valvur);
		// here comes logic
		model.addAttribute("deletePiirivalvur", true);
		return "Piirivalvur";
	}
	
	@RequestMapping(value="/Piirivalvurid")
	public String AllPiirivalvurid (Model model) {
		List<Piirivalvur> piirivalvurid = pvDao.records();
		model.addAttribute("Piirivalvurid", piirivalvurid);
		return "Piirivalvurid";
	}
	
}
