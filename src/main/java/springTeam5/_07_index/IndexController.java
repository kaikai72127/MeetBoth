package springTeam5._07_index;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import springTeam5._03_product.model.Product;
import springTeam5._03_product.service.ProductService;
import springTeam5._05_teacStu.model.StudBean;
import springTeam5._05_teacStu.model.TeacBean;
import springTeam5._05_teacStu.service.StudServiceInterface;
import springTeam5._05_teacStu.service.TeacServiceInterface;

@Controller
public class IndexController {
	
	@Autowired
	private TeacServiceInterface tService;
	
	@Autowired
	private StudServiceInterface sService;
	
	@Autowired
	private ProductService pService;
	
	@GetMapping("/index.controller")
	public String processMainAction(Model m) {
		List<TeacBean> teac = tService.findFirst6ByOrderByUpdateDateDesc();
		List<StudBean> stud = sService.findFirst6ByOrderByUpdateDateDesc();
		List<Product> Hotprodlist = pService.findHotestProductsAndOnlyOnSales();
		m.addAttribute("teac", teac);
		m.addAttribute("stud", stud);
		m.addAttribute("Hotprodlist", Hotprodlist);
		return "index";
	}

}
