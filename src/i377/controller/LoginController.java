package i377.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class LoginController {

	@RequestMapping(value="/Login")
	public String login (Model model){
		return "Login";
	}
	
	@RequestMapping(value="/")
	public String main (Model model){
		return "Login";
	}
	
	@RequestMapping(value="/Navigation")
	public String Navigation(){
		return "Navigation";
	}
	
}
