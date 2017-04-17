package hello;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GreetingController {
	
		@GetMapping({"/","/index"})
	    public String index(Model model) {
			model.addAttribute("address", new Address());
	        return "index";
	    }
		
		@PostMapping("/addressform")
		public String addressForm(Address address, Model model) {
			model.addAttribute("address", address);
	        return "success";
	    }
		
}

   
    
