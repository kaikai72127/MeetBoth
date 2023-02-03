package springTeam5._04_shoppingCart.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import springTeam5._04_shoppingCart.model.OrderBean;
import springTeam5._04_shoppingCart.service.OrderService;


@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	
// 新增------
	// 跳轉到新增頁面
	@PostMapping("/_04_shoppingCart.InsertOrderMain.controller")
	public String processInsertOrderMainAction() {
		return "_04_shoppingCart/orderInsert";
	}

	@PostMapping("/_04_shoppingCart.InsertOrder.controller")
	public String processInsertOrderAction(@RequestParam("memberId") String memberId,
			@RequestParam("shippingAddress") String shippingAddress, HttpServletResponse response) throws IOException {
		
		OrderBean obean = new OrderBean();
		obean.setMemberId(memberId);
		obean.setShippingAddress(shippingAddress);
		obean.setOrderDate(orderService.getCurrentDate());
		obean.setUporderDate(orderService.getCurrentDate());
		obean.setTotalAmount();

		orderService.insertOrder(obean);

		response.sendRedirect("_04_shoppingCart.SelectAll.controller");
		return null;
	}

// 刪除------
	@GetMapping("/_04_shoppingCart.DeleteOrder.controller")
	public String processDeleteOrderAction(@RequestParam("orderNo") Integer ordernNo) {

		orderService.deleteById(ordernNo);
		
		return "redirect:_04_shoppingCart.SelectAll.controller";
	}
	
// 修改------
	// 跳轉到修改頁面
	@PostMapping("/_04_shoppingCart.UpdateOrderMain.controller")
	public String processUpdateOrderMainAction(@RequestParam("orderNo") Integer orderNo,
			@ModelAttribute("OrderBean") OrderBean od, Model odModel) {
		
		List<OrderBean> classList = orderService.findByOrderNo(orderNo);
		odModel.addAttribute("classList", classList);

		return "_04_shoppingCart/orderUpdate";

	}
	
	//修改頁面
	@PostMapping("/_04_shoppingCart.UpdateOrder.controller")
	public String processUpdateOrderMainAction(@RequestParam("orderNo") Integer orderNo,
			@RequestParam("memberId") String memberId, @RequestParam("shippingAddress") String shippingAddress,
			@RequestParam("ordStstus") String ordStstus, @RequestParam("paymentStstus") String paymentStstus,
			@RequestParam("deliveryStstus") String deliveryStstus)  {
		List<OrderBean> oList = orderService.findByOrderNo(orderNo);
		OrderBean obean = oList.get(0);
		
		obean.setOrderNo(orderNo);
		obean.setMemberId(memberId);
		obean.setShippingAddress(shippingAddress);
		obean.setOrdStstus(ordStstus);
		obean.setPaymentStstus(paymentStstus);
		obean.setDeliveryStstus(deliveryStstus);
		obean.setUporderDate(orderService.getCurrentDate());

		orderService.updateOrder(obean);

		return "redirect:_04_shoppingCart.SelectAll.controller";
	}

// 查詢------
	// 搜尋全部-跳轉到CRUD的頁面
	@RequestMapping(path = "/_04_shoppingCart.SelectAll.controller", method = RequestMethod.GET)
	public String processSelectAllAcction(@ModelAttribute("OrderBean") OrderBean od,
			Model odModel) {
		List<OrderBean> classList = orderService.selectAll();
		odModel.addAttribute("classList", classList);
		return "_04_shoppingCart/ordersCRUD";

	}
	// 搜尋全部-模糊搜尋
	@PostMapping("/_04_shoppingCart.SearchAllorders.controller")
	public String processSearchAllorders(@RequestParam("search") String search,
			@ModelAttribute("OrderBean") OrderBean od,
			Model odModel) {
		List<OrderBean> classList = orderService.findSearchOrderNo(search);
		odModel.addAttribute("classList", classList);
		return "_04_shoppingCart/ordersCRUD";
	}

}
