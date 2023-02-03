package springTeam5._04_shoppingCart.controller;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import springTeam5._04_shoppingCart.model.OrderBean;
import springTeam5._04_shoppingCart.model.OrderItemBean;
import springTeam5._04_shoppingCart.service.OrderItemService;
import springTeam5._04_shoppingCart.service.OrderService;

@Controller
public class OrderItemController {

	@Autowired
	private OrderItemService orderItemService;

	@Autowired
	private OrderService orderService;
	
	

// 新增------
	// 判斷是否有訂明細項 跳轉頁面
	@PostMapping("/_04_shoppingCart.InsertOrderItemMain.controller")
	public String processInsertOrderItemMainAction(@ModelAttribute("OrderBean") OrderBean orderItem,
			@RequestParam("orderNo") Integer orderNo, Model odModel) {

		List<OrderBean> order = orderService.findByOrderNo(orderNo);
		Set<OrderItemBean> items = order.get(0).getItems();
		

		if (!items.isEmpty()) {
			// 有訂單項目
			List<OrderItemBean> classList = orderItemService.findByOrderno(orderNo);
			Model addAttribute = odModel.addAttribute("classList", classList);
			System.out.println("addAttribute" + addAttribute);
			return "_04_shoppingCart/ordersItemCRUD";
		} else {
			// 沒有訂單項目
			List<OrderBean> classList = orderService.findByOrderNo(orderNo);
			odModel.addAttribute("classList", classList);
			return "_04_shoppingCart/orderItemInsert";
		}

	}

	// 頁面點擊新增一筆訂單項目
	@PostMapping("/_04_shoppingCart.InsertOrderItembySeq.controller")
	public String processInsertOrderItembySeqAction(@ModelAttribute("OrderBean") OrderBean orderItem,
			@RequestParam("orderNo") Integer orderNo, Model odModel) {

		List<OrderBean> classList = orderService.findByOrderNo(orderNo);
		odModel.addAttribute("classList", classList);
		return "_04_shoppingCart/orderItemInsert";
	}

	// 新增該訂單的訂單項目
	@PostMapping("/_04_shoppingCart.InsertOrderItem.controller")
	public String processInsertOrderItemAction(@RequestParam("orderNo") Integer orderNo,
			@RequestParam("prodId") String prodId, @RequestParam("prodName") String prodName,
			@RequestParam("qty") Integer qty, @RequestParam("prodPrice") Integer prodPrice,
			@RequestParam("discount") Double discount, @RequestParam("remark") String remark) {
		// 找order
		List<OrderBean> order = orderService.findByOrderNo(orderNo);
		OrderBean orderBean = order.get(0);

		OrderItemBean orderItemBean = new OrderItemBean();
		orderItemBean.setOrderNo(orderNo);
		orderItemBean.setProdId(prodId);
		orderItemBean.setProdName(prodName);
		orderItemBean.setQty(qty);
		orderItemBean.setProdPrice(prodPrice);
		orderItemBean.setItemTotal(Integer.parseInt(String.valueOf(Math.round(qty * prodPrice * discount))));
		orderItemBean.setDiscount(discount);
		orderItemBean.setRemark(remark);
		orderItemBean.setOrderbean(orderBean);

		Set<OrderItemBean> orderItemBeanSet = new LinkedHashSet<OrderItemBean>();
		orderItemBeanSet.add(orderItemBean);
		orderBean.setItems(orderItemBeanSet);
		
//		// 更新訂單的總金額與時間
		Integer totalAmount = orderBean.getTotalAmount();
		orderBean.setTotalAmount(
				Integer.parseInt(String.valueOf(Math.round(totalAmount + (qty * prodPrice * discount)))));
		orderBean.setUporderDate(orderService.getCurrentDate());

		orderService.updateOrder(orderBean);
		System.out.println("orderItemBeanSet : "+orderItemBeanSet);
		return "redirect:_04_shoppingCart.SelectOrderAllItem.controller?orderNo=" + orderNo;
	}

// 刪除------
	@GetMapping("/_04_shoppingCart.DeleteItemOrder.controller")
	public String processDeleteOrderAction(@RequestParam("seqno") Integer seqno) {
		List<OrderItemBean> searchOrderItemBySeq = orderItemService.findBySqeno(seqno);
		Integer orderNo = searchOrderItemBySeq.get(0).getOrderNo();
		System.out.println("準備要刪除");
		orderItemService.deleteOrdItem(orderNo, seqno);
		System.out.println("orderNo" +orderNo +"seqno"+seqno);

		return "redirect:_04_shoppingCart.SelectAll.controller";
	}

// 修改------
	// 跳轉到修改頁面
	@PostMapping("/_04_shoppingCart.UpdateOrderItemMain.controller")
	public String processUpdateOrderItemMainAction(@RequestParam("seqno") Integer seqno,
			@ModelAttribute("OrderBean") OrderBean od, BindingResult result, Model odModel) {
		if (result.hasErrors()) {
			return "membersError";
		}
		List<OrderItemBean> searchOrderItemBySeq = orderItemService.findBySqeno(seqno);
		Integer orderNo = searchOrderItemBySeq.get(0).getOrderNo();
		List<OrderItemBean> classList = orderItemService.findOrderItem(orderNo, seqno);
		odModel.addAttribute("classList", classList);

		return "_04_shoppingCart/orderItemUpdate";

	}

	// 修改頁面
	@PostMapping("/_04_shoppingCart.UpdateItemOrder.controller")
	public String processUpdateOrderItemAction(@RequestParam("orderNo") Integer orderNo,
			@RequestParam("seqno") Integer seqno, @RequestParam("qty") Integer qty,
			@RequestParam("prodPrice") Integer prodPrice, @RequestParam("discount") Double discount,
			@RequestParam("remark") String remark) {
		
		List<OrderItemBean> orderItemBeanList = orderItemService.findBySqeno(seqno);
		OrderItemBean orderItemBean = orderItemBeanList.get(0);

		List<OrderBean> searchOrderByONo = orderService.findByOrderNo(orderNo);
		OrderBean orderBean = searchOrderByONo.get(0);

		if (orderItemBean.getSeqno() == seqno) {
			// 原本的資料金額
			Integer itemTotal = orderItemBean.getItemTotal();
			Integer totalAmount = orderBean.getTotalAmount();
			Integer itemTotal2 = Integer.parseInt(String.valueOf(Math.round(qty * prodPrice * discount)));

			// 更新資料
			orderItemBean.setQty(qty);
			orderItemBean.setProdPrice(prodPrice);
			orderItemBean.setDiscount(discount);
			orderItemBean.setItemTotal(itemTotal2);
			orderItemBean.setRemark(remark);
			orderItemService.updateOrderItem(orderItemBean);
			// 更新訂單的總金額與時間
			orderBean.setTotalAmount(Integer
					.parseInt(String.valueOf(Math.round(totalAmount - itemTotal + (qty * prodPrice * discount)))));
			orderBean.setUporderDate(orderService.getCurrentDate());

			orderService.updateOrder(orderBean);
			}

		return "redirect:_04_shoppingCart.SelectAll.controller";

	}

// 查詢------
	// 搜尋全部-跳轉到CRUD的頁面
	@RequestMapping(path = "/_04_shoppingCart.SelectOrderAllItem.controller", method = RequestMethod.GET)
	public String processSelectAllAcction(@ModelAttribute("OrderBean") OrderBean od,
			@RequestParam("orderNo") Integer orderNo, BindingResult result, Model odModel) {
		List<OrderItemBean> classList = orderItemService.findByOrderno(orderNo);
		Model addAttribute = odModel.addAttribute("classList", classList);
		System.out.println("addAttribute" + addAttribute);
		return "_04_shoppingCart/ordersItemCRUD";
	}

}
