package springTeam5._07_index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	
	@GetMapping("/index.controller")
	public String processMainAction() {
		return "index";
	}

}
