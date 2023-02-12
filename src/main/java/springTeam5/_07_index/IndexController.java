package springTeam5._07_index;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

<<<<<<< HEAD
import springTeam5._05_teacStu.model.StudBean;
import springTeam5._05_teacStu.model.TeacBean;
import springTeam5._05_teacStu.service.StudServiceInterface;
=======
import springTeam5._05_teacStu.model.TeacBean;
>>>>>>> origin/_01_Seal
import springTeam5._05_teacStu.service.TeacServiceInterface;

@Controller
public class IndexController {
	
	@Autowired
	private TeacServiceInterface tService;
	
<<<<<<< HEAD
	@Autowired
	private StudServiceInterface sService;
	
	@GetMapping("/index.controller")
	public String processMainAction(Model m) {
		List<TeacBean> teac = tService.findFirst6ByOrderByUpdateDateDesc();
		List<StudBean> stud = sService.findFirst6ByOrderByUpdateDateDesc();
		m.addAttribute("teac", teac);
		m.addAttribute("stud", stud);
=======
	@GetMapping("/index.controller")
	public String processMainAction(Model m) {
		List<TeacBean> teac = tService.findFirst6ByOrderByUpdateDateDesc();
		m.addAttribute("teac", teac);
>>>>>>> origin/_01_Seal
		return "index";
	}

}
