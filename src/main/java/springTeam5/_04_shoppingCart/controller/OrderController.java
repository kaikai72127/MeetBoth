package springTeam5._04_shoppingCart.controller;

import java.io.IOException;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import springTeam5._01_member.model.MemberBean;
import springTeam5._01_member.model.MemberRepository;
import springTeam5._01_member.model.MemberService;
import springTeam5._04_shoppingCart.model.Discount;
import springTeam5._04_shoppingCart.model.OrderBean;
import springTeam5._04_shoppingCart.service.impl.DiscountServiceImpl;
import springTeam5._04_shoppingCart.service.impl.OrderServiceImpl;

@Controller
public class OrderController {

	@Autowired
	private OrderServiceImpl orderService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private DiscountServiceImpl discountService;

// 新增------
	// 跳轉到新增頁面
	@PostMapping("/shoppingCart.createOrderMain.controller")
	public String processInsertOrderMainAction() {
		return "_04_shoppingCart/orderInsert";
	}

	@PostMapping("/shoppingCart.createOrder.controller")
	public String createOrder(@RequestParam("memberBuyId") Integer memberBuyId,
			@RequestParam("shippingName") String shippingName, @RequestParam("shippingPhone") String shippingPhone,
			@RequestParam("shippingAddress") String shippingAddress, @RequestParam("ordStstus") String ordStstus,
			@RequestParam("paymentStstus") String paymentStstus, @RequestParam("deliveryStstus") String deliveryStstus,
			@RequestParam("paymentMethod") String paymentMethod,
			@RequestParam(value = "discountNo", required = false) String discountNo,
			@RequestParam("totalAmount") Integer totalAmount, HttpServletResponse response) throws IOException {

		OrderBean obean = new OrderBean();

		Optional<MemberBean> list = memberService.searchMemByID(memberBuyId);
		MemberBean memberBuy = list.get();


		obean.setMemberbuy(memberBuy);
		obean.setShippingName(shippingName);
		obean.setShippingPhone(shippingPhone);
		obean.setShippingAddress(shippingAddress);
		obean.setOrdStstus(ordStstus);
		obean.setPaymentStstus(paymentStstus);
		obean.setDeliveryStstus(deliveryStstus);
		obean.setOrderDate(orderService.getCurrentDate());
		obean.setUporderDate(orderService.getCurrentDate());
		// 判斷是否有使用折扣碼
		if (discountNo != null) {
			Discount discount = discountService.getDiscountByDiscountNo(discountNo);
			Double discountPrice = discount.getDiscountPrice();
			obean.setTotalAmount(Integer.parseInt(String.valueOf(Math.round(totalAmount - discountPrice))));
			// 存入使用的折扣碼
			Set<OrderBean> orderUseDiscount = new LinkedHashSet<OrderBean>();
			orderUseDiscount.add(obean);
			discount.setOrders(orderUseDiscount);
		} else {
			obean.setTotalAmount(totalAmount);
		}
		// 存入會員的購買清單與銷售清單
		Set<OrderBean> orderBeanSet = new LinkedHashSet<OrderBean>();
		orderBeanSet.add(obean);
		memberBuy.setOrderBuy(orderBeanSet);

		orderService.createOrder(obean);

		response.sendRedirect("_04_shoppingCart.SelectAll.controller");
		return null;
	}

//管理者的介面
// 刪除------
	@GetMapping("/shoppingCart.DeleteOrder.controller")
	public String processDeleteOrderAction(@RequestParam("orderNo") Integer orderNo) {
		orderService.deleteById(orderNo);
		return "redirect:shoppingCart.SelectAll.controller";
	}

// 修改------
	// 跳轉到修改頁面
	@PostMapping("/shoppingCart.UpdateOrderMain.controller/{ordernNo}")
	public String processUpdateOrderMainAction(@PathVariable("orderNo") Integer orderNo, Model odModel) {

		List<OrderBean> classList = orderService.findByOrderNo(orderNo);
		odModel.addAttribute("classList", classList);

		return "_04_shoppingCart/orderUpdate";

	}

	// 修改頁面
	@PostMapping("/_04_shoppingCart.UpdateOrder.controller/{orderNo}")
	public String processUpdateOrderMainAction1(@PathVariable("orderNo") Integer orderNo,
			@RequestParam("shippingName") String shippingName, @RequestParam("shippingPhone") String shippingPhone,
			@RequestParam("shippingAddress") String shippingAddress, @RequestParam("ordStstus") String ordStstus,
			@RequestParam("paymentStstus") String paymentStstus, @RequestParam("deliveryStstus") String deliveryStstus,
			@RequestParam("paymentMethod") String paymentMethod, @RequestParam("discountId") String discountId,
			@ModelAttribute("OrderBean") OrderBean obean) {

		// 可以修改的地方
		obean.setShippingName(shippingName);
		obean.setShippingPhone(shippingPhone);
		obean.setShippingAddress(shippingAddress);
		obean.setOrdStstus(ordStstus);
		obean.setPaymentStstus(paymentStstus);
		obean.setDeliveryStstus(deliveryStstus);
		obean.setUporderDate(orderService.getCurrentDate());

		System.out.println("有喔~" + ordStstus);
		orderService.updateOrder(obean);

		return "redirect:shoppingCart.SelectAll.controller";
	}

	// 主頁面直接修改
	@PostMapping("/shoppingCart.UpdateOrder.controller")
	public String processUpdateOrderMainAction2(@RequestParam("orderNo") Integer orderNo,
			@RequestParam("ordStstus") String ordStstus, @RequestParam("paymentStstus") String paymentStstus,
			@RequestParam("deliveryStstus") String deliveryStstus, @RequestParam("paymentMethod") String paymentMethod,
			@RequestParam("discountId") String discountId, @ModelAttribute("OrderBean") OrderBean obean) {

		System.out.println("有喔~" + ordStstus);
		// 可以修改的地方
		obean.setOrdStstus(ordStstus);
		obean.setPaymentStstus(paymentStstus);
		obean.setDeliveryStstus(deliveryStstus);
		obean.setUporderDate(orderService.getCurrentDate());
		System.out.println("有喔~" + ordStstus);
		orderService.updateOrder(obean);

		return "redirect:shoppingCart.SelectAll.controller";
	}

// 查詢------
	//後台管理使用---------------------------------------------------------------------------
	// 搜尋全部-跳轉到CRUD的頁面用
	@RequestMapping(path = "/shoppingCart.SelectAll.controller", method = RequestMethod.GET)
	public String processSelectAllAcction(@ModelAttribute("OrderBean") OrderBean od, Model odModel) {
		List<OrderBean> classList = orderService.selectAll();
		odModel.addAttribute("classList", classList);
		return "_04_shoppingCart/ordersCRUD";

	}

	// 搜尋全部-條件搜尋
	@PostMapping("/shoppingCart.SearchOrders.controller")
	public String processSearchOrders(@RequestParam(value = "ordStstus") String ordStstus,
			@RequestParam(value = "paymentStstus") String paymentStstus,
			@RequestParam(value = "deliveryStstus") String deliveryStstus,
			@RequestParam(value = "search", required = false) String search, @ModelAttribute("OrderBean") OrderBean od,
			Model odModel) {
		List<OrderBean> classList = null;

		System.out.println("找這些" + ordStstus + " " + " " + paymentStstus + " " + deliveryStstus + " " + search + "結束");

		if (ordStstus != null && paymentStstus.equals("0") && deliveryStstus.equals("0") && search.equals("")) {
			classList = orderService.findOrderBySearch1(ordStstus, paymentStstus, deliveryStstus, search);
		} else if (ordStstus.isEmpty() && paymentStstus != null && deliveryStstus != null && search != null) {
			classList = orderService.findOrderBySearch2(paymentStstus, deliveryStstus, search);
		} else if (ordStstus.isEmpty() && paymentStstus.isEmpty() && deliveryStstus != null && search != null) {
			classList = orderService.findOrderBySearch3(deliveryStstus, search);
		} else if (ordStstus.isEmpty() && paymentStstus.isEmpty() && deliveryStstus.isEmpty() && search != null) {
			classList = orderService.findOrderBySearch4(search);
		} else if (ordStstus != null && paymentStstus.isEmpty() && deliveryStstus.isEmpty() && search.isEmpty()) {
			// 判斷只找
			classList = orderService.findOrderByOrdStstus(ordStstus);
		} else if (ordStstus.isEmpty() && paymentStstus != null && deliveryStstus.isEmpty() && search.isEmpty()) {
			// 判斷只找
			classList = orderService.findOrderByPaymentStstus(paymentStstus);
		} else if (ordStstus.isEmpty() && paymentStstus.isEmpty() && deliveryStstus != null && search.isEmpty()) {
			// 判斷只找
			classList = orderService.findOrderByDeliveryStstus(deliveryStstus);
		} else if (ordStstus.isEmpty() && paymentStstus.isEmpty() && deliveryStstus.isEmpty() && search.isEmpty()) {
			// 判斷都為0則搜尋全部
			classList = orderService.selectAll();
		}
		odModel.addAttribute("classList", classList);
		System.out.println(classList);
		return "_04_shoppingCart/ordersCRUD";

	}

}
