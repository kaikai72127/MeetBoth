package springTeam5._04_shoppingCart.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import springTeam5._04_shoppingCart.model.OrderBean;
import springTeam5._04_shoppingCart.service.impl.OrderServiceImpl;

@Controller
public class OrderController {

	@Autowired
	private OrderServiceImpl orderService;

// 新增------
	// 跳轉到新增頁面
	@PostMapping("/shoppingCart.createOrderMain.controller")
	public String processInsertOrderMainAction() {
		return "_04_shoppingCart/orderInsert";
	}

	@PostMapping("/shoppingCart.createOrder.controller")
	public String createOrder(
			@RequestParam("memberBuyId") Integer memberBuyId,@RequestParam("memberSaleId") Integer memberSaleId,
			@RequestParam("shippingName") String shippingName,@RequestParam("shippingPhone") String shippingPhone,
			@RequestParam("shippingAddress") String shippingAddress,@RequestParam("ordStstus") String ordStstus,
			 @RequestParam("paymentStstus") String paymentStstus,@RequestParam("deliveryStstus") String deliveryStstus,
			@RequestParam("paymentMethod") String paymentMethod,@RequestParam("discountId") String discountId,
			@RequestParam("shippingAddress") Integer totalAmount, HttpServletResponse response) throws IOException {

		OrderBean obean = new OrderBean();
		
		obean.setMemberBuyId(memberBuyId);
		obean.setMemberSaleId(memberSaleId);
		obean.setShippingName(shippingName);
		obean.setShippingPhone(shippingPhone);
		obean.setShippingAddress(shippingAddress);
		obean.setOrdStstus(ordStstus);
		obean.setPaymentStstus(paymentStstus);
		obean.setDeliveryStstus(deliveryStstus);
		obean.setOrderDate(orderService.getCurrentDate());
		obean.setUporderDate(orderService.getCurrentDate());

		response.sendRedirect("_04_shoppingCart.SelectAll.controller");
		return null;
	}

//管理者的介面
// 刪除------
	@GetMapping("/shoppingCart.DeleteOrder.controller/{ordernNo}")
	public String processDeleteOrderAction(@PathVariable("ordernNo") Integer ordernNo) {
		orderService.deleteById(ordernNo);
		return "redirect:_04_shoppingCart.SelectAll.controller";
	}

// 修改------
	// 跳轉到修改頁面
	@PostMapping("/shoppingCart.UpdateOrderMain.controller/{ordernNo}")
	public String processUpdateOrderMainAction(@PathVariable("ordernNo") Integer orderNo,Model odModel) {

		List<OrderBean> classList = orderService.findByOrderNo(orderNo);
		odModel.addAttribute("classList", classList);

		return "_04_shoppingCart/orderUpdate";

	}

	// 修改頁面
	@PostMapping("/_04_shoppingCart.UpdateOrder.controller")
	public String processUpdateOrderMainAction(
			@RequestParam("shippingName") String shippingName,@RequestParam("shippingPhone") String shippingPhone,
			@RequestParam("shippingAddress") String shippingAddress,@RequestParam("ordStstus") String ordStstus,
			 @RequestParam("paymentStstus") String paymentStstus,@RequestParam("deliveryStstus") String deliveryStstus,
			@RequestParam("paymentMethod") String paymentMethod,@RequestParam("discountId") String discountId,
			@ModelAttribute("OrderBean") OrderBean obean)  {
		
		//可以修改的地方
		obean.setShippingName(shippingName);
		obean.setShippingPhone(shippingPhone);
		obean.setShippingAddress(shippingAddress);
		obean.setOrdStstus(ordStstus);
		obean.setPaymentStstus(paymentStstus);
		obean.setDeliveryStstus(deliveryStstus);
		obean.setUporderDate(orderService.getCurrentDate());

		orderService.updateOrder(obean);

		return "redirect:_04_shoppingCart.SelectAll.controller";
	}

// 查詢------
	// 搜尋全部-跳轉到CRUD的頁面用
	@RequestMapping(path = "/shoppingCart.SelectAll.controller", method = RequestMethod.GET)
	public String processSelectAllAcction(@ModelAttribute("OrderBean") OrderBean od,
			Model odModel) {
		List<OrderBean> classList = orderService.selectAll();
		odModel.addAttribute("classList", classList);
		return "_04_shoppingCart/ordersCRUD";

	}
	
	// 搜尋全部-模糊搜尋
	@PostMapping("/shoppingCart.SearchAllorders.controller")
	public String processSearchAllorders(@RequestParam("search") String search,
			@ModelAttribute("OrderBean") OrderBean od,
			Model odModel) {
		List<OrderBean> classList = orderService.findSearchOrderNo(search);
		odModel.addAttribute("classList", classList);
		return "_04_shoppingCart/ordersCRUD";
	}

}
