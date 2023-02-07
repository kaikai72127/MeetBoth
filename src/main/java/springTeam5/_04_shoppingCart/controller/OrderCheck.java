package springTeam5._04_shoppingCart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;
import springTeam5._04_shoppingCart.model.OrderBean;
import springTeam5._04_shoppingCart.model.OrderItemBean;
import springTeam5._04_shoppingCart.model.ShoppingCart;
import springTeam5._04_shoppingCart.service.impl.OrderItemServiceImpl;
import springTeam5._04_shoppingCart.service.impl.OrderServiceImpl;


@Controller
@SessionAttributes(names = { "ShoppingCart" })
public class OrderCheck {

	
	@Autowired
	private OrderServiceImpl orderService;
//	@Autowired
//	private MemberService mService;
	@Autowired
	private OrderItemServiceImpl orService;
//	@Autowired
//	private MailService mailService;
	
	//綠界
	AllInOne all = new AllInOne("");
	AioCheckOutALL obj = new AioCheckOutALL();
	
	@PostMapping("/orderConfirm.controller")
	public String processAction(HttpServletRequest request, SessionStatus sessionStatus, Model m) {
		HttpSession session = request.getSession(false);
		
		//先判斷會員是否有登入 沒有登入則導入登入會員的頁面
		//不需要判斷----// 
		if (session == null) {      // 使用逾時 導回家教網的首頁
			return "index.controller";
		}
		//會員有登入
		ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("ShoppingCart");
		if (shoppingCart == null) {
			// 處理訂單時如果找不到購物車(通常是Session逾時)，沒有必要往下執行
			// 導向商品搜尋的首頁
			return "redirect:/_03_product.searchAllProduct.controller";
		}
		
		
		return "轉訂單成功的頁面";
	}
	
}
