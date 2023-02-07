package springTeam5._04_shoppingCart.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import springTeam5._04_shoppingCart.service.impl.OrderServiceImpl;
@Controller
public class TestController {
	
	@Autowired
	private OrderServiceImpl orderServiceImpl;
	@GetMapping("/testS.controller")
	public String processAdminAction(HttpSession session) {
		System.out.println(orderServiceImpl.findByOrderNo(1).toString());
		return "_04_shoppingCart/shoppingCartCheck";
	}

}
