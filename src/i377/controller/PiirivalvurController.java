package i377.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import i377.entities.Piirivalvur;
import i377.repo.PiirivalvurDaoImpl;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
		pv.setSugu(-1);
		model.addAttribute("piirivalvur", pv);
		return "Piirivalvur";
	}
	
	@RequestMapping(value="/Piirivalvur/{userId}/", method = RequestMethod.GET)
	public String piirivalvurById(@PathVariable("userId") long id, Model model) {
		Piirivalvur pv = pvDao.getRecordById(id);
		
		if (pv != null)
			model.addAttribute("piirivalvur", pv);
		else
			model.addAttribute("piirivalvur", new Piirivalvur());
		
		return "Piirivalvur";
	}
	
	@RequestMapping(value="/AddPiirivalvur", method = RequestMethod.POST)
	public String addPiirivalvur(@ModelAttribute @Valid Piirivalvur valvur, BindingResult result, Model model) {
		
		if (result.hasErrors()){
			model.addAttribute("errors", true);

			return "Piirivalvur";
		}
		
		model.addAttribute("piirivalvur", pvDao.addRecord(valvur));
		model.addAttribute("piirivalvurAdded", true);
		return "Piirivalvur";
	}
	
	@RequestMapping(value="/ModifyPiirivalvur", method = RequestMethod.POST)
	public String modifyPiirivalvur(@ModelAttribute @Valid Piirivalvur valvur, BindingResult result, Model model) {
		
		if (result.hasErrors()){
			model.addAttribute("errors", true);
//			model.addAttribute("piirivalvurform", valvur);
			return "Piirivalvur";
		}
		
		model.addAttribute("piirivalvur", valvur);
		pvDao.modifyRecord(valvur);
		model.addAttribute("piirivalvurModified", true);
		return "Piirivalvur";
	}
	
	@RequestMapping(value="/DeletePiirivalvur", method = RequestMethod.POST)
	public String deletePiirivalvur(@ModelAttribute Piirivalvur valvur, Model model) {
		model.addAttribute("piirivalvur", valvur);
		pvDao.deleteRecord(valvur);
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
