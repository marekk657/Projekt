package i377.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import i377.entities.Vaeosa;
import i377.repo.VaeosaDaoImpl;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class VaeosaController {
	
	@Resource
	private VaeosaDaoImpl voDao;

	@RequestMapping(value="/Vaeosa")
	public String vaeosa(Model model) {
				
		Vaeosa vo = new Vaeosa();
		vo.setId(-1);
		model.addAttribute("vaeosa", vo);
		
		return "Vaeosa";
	}
	
	@RequestMapping(value="/Vaeosa/{userId}/", method = RequestMethod.GET)
	public String vaeosaById(@PathVariable("userId") long id, Model model) {
		Vaeosa vo = voDao.getRecordById(id);
		
		if (vo != null)
			model.addAttribute("vaeosa", vo);
		else
			model.addAttribute("vaeosa", new Vaeosa());
		
		return "Vaeosa";
	}
	
	@RequestMapping(value="/AddVaeosa", method = RequestMethod.POST)
	public String addVaeosa(@ModelAttribute @Valid Vaeosa vo, BindingResult result, Model model) {
		
		if (result.hasFieldErrors()){
			model.addAttribute("errors", true);

			return "Vaeosa";
		}			
		
		model.addAttribute("vaeosa", voDao.addRecord(vo));
		model.addAttribute("VaeosaAdded", true);
		return "Vaeosa";
	}
	
	@RequestMapping(value="/ModifyVaeosa", method = RequestMethod.POST)
	public String modifyVaeosa(@ModelAttribute @Valid Vaeosa vo, BindingResult result, Model model) {
		
		if (result.hasErrors()){
			model.addAttribute("errors", true);

			return "Vaeosa";
		}
		
		model.addAttribute("vaeosa", vo);
		voDao.modifyRecord(vo);
		model.addAttribute("VaeosaModified", true);
		return "Vaeosa";
	}
	
	@RequestMapping(value="/DeleteVaeosa", method = RequestMethod.POST)
	public String deleteVaeosa(@ModelAttribute Vaeosa vo, Model model) {
		model.addAttribute("vaeosa", vo);
		voDao.deleteRecord(vo);
		model.addAttribute("deleteVaeosa", true);
		return "Vaeosa";
	}
	
	@RequestMapping(value="/Vaeosad")
	public String allVaeosad(Model model) {
		List<Vaeosa> vaeosad = voDao.records();
		model.addAttribute("Vaeosad", vaeosad);
		return "Vaeosad";
	}
}
