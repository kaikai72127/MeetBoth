package springTeam5._04_shoppingCart.controller;

import java.sql.SQLException;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;
import springTeam5._01_member.model.MemberBean;
import springTeam5._01_member.model.MemberService;
import springTeam5._03_product.model.Product;
import springTeam5._03_product.service.ProductService;
import springTeam5._04_shoppingCart.model.OrderBean;
import springTeam5._04_shoppingCart.model.OrderItemBean;
import springTeam5._04_shoppingCart.model.ShoppingCart;
import springTeam5._04_shoppingCart.service.ShoppingCartMailService;
import springTeam5._04_shoppingCart.service.impl.OrderServiceImpl;

@Controller
@SessionAttributes(names = { "ShoppingCart" })
public class ShoppingCartCheck {

	private static Logger log = LoggerFactory.getLogger(ShoppingCartCheck.class);

	@Autowired
	private OrderServiceImpl orderService;
	// 連接會員資料
	@Autowired
	private MemberService memberService;
	@Autowired
	private ProductService productService;
	@Autowired
	private ShoppingCartMailService mailService;



	@PostMapping("/shoppingCartConfirm.controller")
	public String processConfirmAction(@RequestParam(value = "shippingName") String shippingName,
			@RequestParam(value = "shippingPhone") String shippingPhone,
			@RequestParam(value = "shippingAddress") String shippingAddress,
			@RequestParam(value = "email") String email, @RequestParam(value = "paymentMethod") String paymentMethod,
			@RequestParam(value = "totalAmount") Integer totalAmount, HttpServletRequest request,
			SessionStatus sessionStatus, Model model) throws SQLException {
		HttpSession session = request.getSession(false);
		log.info("處理訂單之Controller: 開始");

		// 先判斷會員是否有登入 沒有登入則導入登入會員的頁面
		// 不需要判斷----//
		if (session == null) { // 使用逾時 導回家教網的首頁
			return "redirect:/index.controller";
		}

		// 取得會員資料
//		String user = SecurityContextHolder.getContext().getAuthentication().getName();
//		List<MemberBean> list = memberService.searchMemByAccount(user);
//		// 登入會員資料
//		MemberBean memberBean = list.get(0);
//		int memberID = memberBean.getMemberID();

		// 會員有登入
		ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("ShoppingCart");
		MemberBean memberBean = (MemberBean) session.getAttribute("Member");
		if (shoppingCart == null) {
			// 處理訂單時如果找不到購物車(通常是Session逾時)，沒有必要往下執行
			// 導向商品搜尋的首頁
			return "redirect:/_03_product.searchAllProduct.controller";
		}

		// 先建立一個新的訂單 並存入訂單資料

		OrderBean orderBean = new OrderBean(null, memberBean, orderService.getCurrentDate(),
				orderService.getCurrentDate(), shippingName, shippingPhone, shippingAddress, "處理中", "未付款", "無",
				paymentMethod, null, shoppingCart.getItemAmount(), null);
		orderService.createOrder(orderBean);
		// 取出存放在購物車內的商品，放入Map型態的變數cart，準備將其內的商品一個一個轉換為OrderItemBean，
		Map<Integer, OrderItemBean> content = shoppingCart.getShoppingCart();

		// 訂單明細
		Set<OrderItemBean> items = new LinkedHashSet<>();
		Set<Integer> set = content.keySet();
		System.out.println("----------------------------+SIZE0" + set.size());
		for (Integer i : set) {
			OrderItemBean orderItemBean = content.get(i);
			orderItemBean.setOrderbean(orderBean);
			// 取得賣家資料
			int meberSaleId = orderItemBean.getProdItem().getMemberID();
			MemberBean memberSale = memberService.searchMemberById(meberSaleId);
			orderItemBean.setMembersale(memberSale);
			items.add(orderItemBean);

			// 更新賣家會員資料
			memberSale.setOrderSale(items);
			memberService.update(memberSale);

			// 更新商品資料
			int productId = content.get(i).getProdItem().getProdID();
			Product product = productService.searchSingleProductFromProdID(productId);
			product.setOrderItems(items);

			// 依購買的數量並更新商品的庫存
			Integer buyQty = content.get(i).getQty();
			int inventory = product.getInventory();
			product.setInventory(inventory - buyQty);

			productService.updateProd(product);
		}

		// 執行到此，購物車內所有購買的商品已經全部轉換為為OrderItemBean物件，並放在Items內
		orderBean.setItems(items);
		// 儲存這個訂單
		orderService.updateOrder(orderBean);

		// 訂單完成後要更新------------
		// 更新買家會員資料----
		Set<OrderBean> orderBuy = new LinkedHashSet<>();
		orderBuy.add(orderBean);
		memberBean.setOrderBuy(orderBuy);
		memberService.update(memberBean);

		// 訂購完成寄信給買家確認訂單明細
		System.out.println(email);
		String recipient = email;
		String memberName = memberBean.getMemName();
		String orderMessage = "   ";
		
		mailService.prepareAndSendForBuy(recipient,memberName, orderMessage);

		// 訂購完成寄信給賣買家確認訂單明細
//		System.out.println(email);
//		String recipientSale = email;
//		String memberNameSale = "謝謝唷!!";
//		String orderMessageSale = "";
//		mailService.prepareAndSendForSale(recipientSale,  memberNameSale, orderMessageSale);

		// 加入屬性於跳轉成功訂購的頁面使用
		model.addAttribute("member", memberBean);
		model.addAttribute("order", orderBean);

		session.removeAttribute("ShoppingCart");
		session.removeAttribute("CartSize");
		session.removeAttribute("Member");
		sessionStatus.setComplete();
		return "_04_shoppingCart/shoppingCartSuccess";
	}



	
	
	//加入綠界API版本
	@PostMapping("/shoppingCartConfirm.controller")
	public String processConfirmAllAction(@RequestParam(value = "shippingName") String shippingName,
			@RequestParam(value = "shippingPhone") String shippingPhone,
			@RequestParam(value = "shippingAddress") String shippingAddress,
			@RequestParam(value = "email") String email, @RequestParam(value = "paymentMethod") String paymentMethod,
			@RequestParam(value = "totalAmount") Integer totalAmount, HttpServletRequest request,
			SessionStatus sessionStatus, Model model) throws SQLException {
		HttpSession session = request.getSession(false);
		log.info("處理訂單之Controller: 綠界測試開始");
		
		// 綠界
		AllInOne all = new AllInOne("");
		AioCheckOutALL obj = new AioCheckOutALL();

		// 先判斷會員是否有登入 沒有登入則導入登入會員的頁面
		// 不需要判斷----//
		if (session == null) { // 使用逾時 導回家教網的首頁
			return "redirect:/index.controller";
		}

		// 取得會員資料
//		String user = SecurityContextHolder.getContext().getAuthentication().getName();
//		List<MemberBean> list = memberService.searchMemByAccount(user);
//		// 登入會員資料
//		MemberBean memberBean = list.get(0);
//		int memberID = memberBean.getMemberID();

		// 會員有登入
		ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("ShoppingCart");
		MemberBean memberBean = (MemberBean) session.getAttribute("Member");
		if (shoppingCart == null) {
			// 處理訂單時如果找不到購物車(通常是Session逾時)，沒有必要往下執行
			// 導向商品搜尋的首頁
			return "redirect:/_03_product.searchAllProduct.controller";
		}

		// 先建立一個新的訂單 並存入訂單資料

		OrderBean orderBean = new OrderBean(null, memberBean, orderService.getCurrentDate(),
				orderService.getCurrentDate(), shippingName, shippingPhone, shippingAddress, "處理中", "未付款", "無",
				paymentMethod, null, shoppingCart.getItemAmount(), null);
		orderService.createOrder(orderBean);
		// 取出存放在購物車內的商品，放入Map型態的變數cart，準備將其內的商品一個一個轉換為OrderItemBean，
		Map<Integer, OrderItemBean> content = shoppingCart.getShoppingCart();

		// 訂單明細
		Set<OrderItemBean> items = new LinkedHashSet<>();
		Set<Integer> set = content.keySet();
		System.out.println("----------------------------+SIZE0" + set.size());
		for (Integer i : set) {
			OrderItemBean orderItemBean = content.get(i);
			orderItemBean.setOrderbean(orderBean);
			// 取得賣家資料
			int meberSaleId = orderItemBean.getProdItem().getMemberID();
			MemberBean memberSale = memberService.searchMemberById(meberSaleId);
			orderItemBean.setMembersale(memberSale);
			items.add(orderItemBean);

			// 更新賣家會員資料
			memberSale.setOrderSale(items);
			memberService.update(memberSale);

			// 更新商品資料
			int productId = content.get(i).getProdItem().getProdID();
			Product product = productService.searchSingleProductFromProdID(productId);
			product.setOrderItems(items);

			// 依購買的數量並更新商品的庫存
			Integer buyQty = content.get(i).getQty();
			int inventory = product.getInventory();
			product.setInventory(inventory - buyQty);

			productService.updateProd(product);
		}

		// 執行到此，購物車內所有購買的商品已經全部轉換為為OrderItemBean物件，並放在Items內
		orderBean.setItems(items);
		// 儲存這個訂單
		orderService.updateOrder(orderBean);

		// 訂單完成後要更新------------
		// 更新買家會員資料----
		Set<OrderBean> orderBuy = new LinkedHashSet<>();
		orderBuy.add(orderBean);
		memberBean.setOrderBuy(orderBuy);
		memberService.update(memberBean);

		// 訂購完成寄信給買家確認訂單明細
		System.out.println(email);
		String recipient = email;
		String memberName = memberBean.getMemName();
		String orderMessage = "   ";
		
		mailService.prepareAndSendForBuy(recipient,memberName, orderMessage);

		// 訂購完成寄信給賣買家確認訂單明細
//		System.out.println(email);
//		String recipientSale = email;
//		String memberNameSale = "謝謝唷!!";
//		String orderMessageSale = "";
//		mailService.prepareAndSendForSale(recipientSale,  memberNameSale, orderMessageSale);

		// 加入屬性於跳轉成功訂購的頁面使用
		model.addAttribute("member", memberBean);
		model.addAttribute("order", orderBean);

		session.removeAttribute("ShoppingCart");
		session.removeAttribute("CartSize");
		session.removeAttribute("Member");
		sessionStatus.setComplete();
		return "_04_shoppingCart/shoppingCartSuccess";
	}

	// 點選取消訂單
	@PostMapping("/orderConfirmCancel.controller")
	public String processCancelAction(@RequestParam("cancel") String cancel, HttpServletRequest request,
			SessionStatus sessionStatus, Model m) {
		HttpSession session = request.getSession(false);
		log.info("處理訂單之Controller: 取消訂單");
		// 如果使用者取消訂單
		if (cancel.equals("CANCEL")) {
			log.info("處理訂單之Controller: 取消訂單");
			session.removeAttribute("ShoppingCart");
			return ""; // 一定要記得 return
		}
		return "";

	}
	
}
