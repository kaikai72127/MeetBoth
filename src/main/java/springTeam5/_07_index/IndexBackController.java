package springTeam5._07_index;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexBackController {
	
	@GetMapping("/backIndex.controller")
	public String processMainAction(HttpSession session) {
		return "backIndex";
	}

}
