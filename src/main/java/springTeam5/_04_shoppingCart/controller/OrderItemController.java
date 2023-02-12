package springTeam5._04_shoppingCart.controller;

<<<<<<< HEAD
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
=======
import java.util.List;
>>>>>>> origin/_01_Seal

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

import springTeam5._03_product.model.Product;
import springTeam5._03_product.service.ProductService;
import springTeam5._04_shoppingCart.model.OrderBean;
import springTeam5._04_shoppingCart.model.OrderItemBean;
<<<<<<< HEAD
import springTeam5._04_shoppingCart.model.ShoppingCart;
=======
>>>>>>> origin/_01_Seal
import springTeam5._04_shoppingCart.service.impl.OrderItemServiceImpl;
import springTeam5._04_shoppingCart.service.impl.OrderServiceImpl;

@Controller
public class OrderItemController {

	@Autowired
	private OrderItemServiceImpl orderItemService;

	@Autowired
	private OrderServiceImpl orderService;
<<<<<<< HEAD
=======
	
>>>>>>> origin/_01_Seal
	
	@Autowired
	private ProductService productService;

// 新增------ ---取消 管理員無權限由後台做新增一筆訂單項目
	// 判斷是否有訂明細項 跳轉頁面
//	@PostMapping("/_04_shoppingCart.InsertOrderItemMain.controller")
//	public String processInsertOrderItemMainAction(@ModelAttribute("OrderBean") OrderBean orderItem,
//			@RequestParam("orderNo") Integer orderNo, Model odModel) {
//
//		List<OrderBean> order = orderService.findByOrderNo(orderNo);
//		Set<OrderItemBean> items = order.get(0).getItems();
//		
//
//		if (!items.isEmpty()) {
//			// 有訂單項目
//			List<OrderItemBean> classList = orderItemService.findByOrderno(orderNo);
//			Model addAttribute = odModel.addAttribute("classList", classList);
//			System.out.println("addAttribute" + addAttribute);
//			return "_04_shoppingCart/ordersItemCRUD";
//		} else {
//			// 沒有訂單項目
//			List<OrderBean> classList = orderService.findByOrderNo(orderNo);
//			odModel.addAttribute("classList", classList);
//			return "_04_shoppingCart/orderItemInsert";
//		}
//
//	}

	// 頁面點擊新增一筆訂單項目 ---取消 管理員無權限由後台做新增一筆訂單項目
//	@PostMapping("/_04_shoppingCart.InsertOrderItembySeq.controller")
//	public String processInsertOrderItembySeqAction(@ModelAttribute("OrderBean") OrderBean orderItem,
//			@RequestParam("orderNo") Integer orderNo, Model odModel) {
//
//		List<OrderBean> classList = orderService.findByOrderNo(orderNo);
//		odModel.addAttribute("classList", classList);
//		return "_04_shoppingCart/orderItemInsert";
//	}

	// 新增該訂單的訂單項目 ---取消 管理員無權限由後台做新增一筆訂單項目
//	@PostMapping("/_04_shoppingCart.InsertOrderItem.controller")
//	public String processInsertOrderItemAction(@RequestParam("orderNo") Integer orderNo,
//			@RequestParam("prodId") String prodId, @RequestParam("prodName") String prodName,
//			@RequestParam("qty") Integer qty, @RequestParam("prodPrice") Integer prodPrice,
//			@RequestParam("discount") Double discount, @RequestParam("remark") String remark) {
//		// 找order
//		List<OrderBean> order = orderService.findByOrderNo(orderNo);
//		OrderBean orderBean = order.get(0);
//
//		OrderItemBean orderItemBean = new OrderItemBean();
//		orderItemBean.setOrderNo(orderNo);
//		orderItemBean.setProdId(prodId);
//		orderItemBean.setProdName(prodName);
//		orderItemBean.setQty(qty);
//		orderItemBean.setProdPrice(prodPrice);
//		orderItemBean.setItemTotal(Integer.parseInt(String.valueOf(Math.round(qty * prodPrice * discount))));
//		orderItemBean.setDiscount(discount);
//		orderItemBean.setRemark(remark);
//		orderItemBean.setOrderbean(orderBean);
//
//		Set<OrderItemBean> orderItemBeanSet = new LinkedHashSet<OrderItemBean>();
//		orderItemBeanSet.add(orderItemBean);
//		orderBean.setItems(orderItemBeanSet);
//		
////		// 更新訂單的總金額與時間
//		Integer totalAmount = orderBean.getTotalAmount();
//		orderBean.setTotalAmount(
//				Integer.parseInt(String.valueOf(Math.round(totalAmount + (qty * prodPrice * discount)))));
//		orderBean.setUporderDate(orderService.getCurrentDate());
//
//		orderService.updateOrder(orderBean);
//		System.out.println("orderItemBeanSet : "+orderItemBeanSet);
//		return "redirect:_04_shoppingCart.SelectOrderAllItem.controller?orderNo=" + orderNo;
//	}

// 刪除------
	@GetMapping("/_04_shoppingCart.DeleteItemOrder.controller")
	public String processDeleteOrderAction(@RequestParam("seqno") Integer seqno) {
		List<OrderItemBean> searchOrderItemBySeq = orderItemService.findBySqeno(seqno);
		Integer orderNo = searchOrderItemBySeq.get(0).getOrderbean().getOrderNo();
		System.out.println("準備要刪除");
		orderItemService.deleteOrdItem(orderNo, seqno);
		System.out.println("orderNo" + orderNo + "seqno" + seqno);

		return "redirect:_04_shoppingCart.SelectAll.controller";
	}

// 修改------
	// 跳轉到修改頁面
	@PostMapping("/_04_shoppingCart.UpdateOrderItemMain.controller")
<<<<<<< HEAD
	public String processUpdateOrderItemMainAction(@RequestParam("seqno") Integer seqno, Model odModel) {
=======
	public String processUpdateOrderItemMainAction(@RequestParam("seqno") Integer seqno,
			 Model odModel) {
>>>>>>> origin/_01_Seal
		List<OrderItemBean> searchOrderItemBySeq = orderItemService.findBySqeno(seqno);
		Integer orderNo = searchOrderItemBySeq.get(0).getOrderbean().getOrderNo();
		List<OrderItemBean> classList = orderItemService.findOrderItem(orderNo, seqno);
		odModel.addAttribute("classList", classList);

		return "_04_shoppingCart/orderItemUpdate";

	}

	// 更新訂單內的Item
	@PostMapping("/updateOrderItemQty.controller")
	public String updateOrderShoppingCartItem(@RequestParam("seqno") Integer seqno,
			@RequestParam("updateQty") int updateQty) throws SQLException {

		List<OrderItemBean> orderItemBeanList = orderItemService.findBySqeno(seqno);
		OrderItemBean orderItemBean = orderItemBeanList.get(0);
		Integer orderNo = orderItemBean.getOrderbean().getOrderNo();
		List<OrderBean> searchOrderByONo = orderService.findByOrderNo(orderNo);
		OrderBean orderBean = searchOrderByONo.get(0);
		
		System.out.println("-------------------有更新嗎");

		if (orderItemBean.getSeqno() == seqno) {
			// 原本的資料金額
			Integer itemTotal = orderItemBean.getItemTotal();
			Integer totalAmount = orderBean.getTotalAmount();
			Integer itemTotal2 = updateQty * orderItemBean.getProdItem().getProdPrice();

			// 更新資料
			orderItemBean.setQty(updateQty);
			orderItemBean.setItemTotal(itemTotal2);
			orderItemService.updateOrderItem(orderItemBean);
			// 更新訂單的總金額與時間
			orderBean.setTotalAmount(totalAmount - itemTotal + (updateQty * orderItemBean.getProdItem().getProdPrice()));
			orderBean.setUporderDate(orderService.getCurrentDate());

			orderService.updateOrder(orderBean);
		}

		return "redirect:shoppingCartUpdateOrder.controller/"+orderNo;

	}

	// 修改頁面
	@PostMapping("/_04_shoppingCart.UpdateItemOrder.controller")
	public String processUpdateOrderItemAction(@RequestParam("orderNo") Integer orderNo,
			@RequestParam("seqno") Integer seqno, @RequestParam("qty") Integer qty,
			@RequestParam("prodPrice") Integer prodPrice) {
<<<<<<< HEAD

=======
		
>>>>>>> origin/_01_Seal
		List<OrderItemBean> orderItemBeanList = orderItemService.findBySqeno(seqno);
		OrderItemBean orderItemBean = orderItemBeanList.get(0);

		List<OrderBean> searchOrderByONo = orderService.findByOrderNo(orderNo);
		OrderBean orderBean = searchOrderByONo.get(0);

		if (orderItemBean.getSeqno() == seqno) {
			// 原本的資料金額
			Integer itemTotal = orderItemBean.getItemTotal();
			Integer totalAmount = orderBean.getTotalAmount();
<<<<<<< HEAD
			Integer itemTotal2 = Integer.parseInt(String.valueOf(Math.round(qty * prodPrice)));
=======
			Integer itemTotal2 = Integer.parseInt(String.valueOf(Math.round(qty * prodPrice )));
>>>>>>> origin/_01_Seal

			// 更新資料
			orderItemBean.setQty(qty);
			orderItemBean.setItemTotal(itemTotal2);
			orderItemService.updateOrderItem(orderItemBean);
			// 更新訂單的總金額與時間
<<<<<<< HEAD
			orderBean.setTotalAmount(
					Integer.parseInt(String.valueOf(Math.round(totalAmount - itemTotal + (qty * prodPrice)))));
=======
			orderBean.setTotalAmount(Integer
					.parseInt(String.valueOf(Math.round(totalAmount - itemTotal + (qty * prodPrice)))));
>>>>>>> origin/_01_Seal
			orderBean.setUporderDate(orderService.getCurrentDate());

			orderService.updateOrder(orderBean);
		}

		return "redirect:_04_shoppingCart.SelectAll.controller";

	}

// 查詢------
	// 搜尋某筆訂單全部ITEM-跳轉到CRUD的頁面
//	@RequestMapping(path = "/shoppingCart.SelectOrderAllItem.controller/{orderNo}", method = RequestMethod.GET)
//	public String processSelectAllAcction(
//			@PathVariable("orderNo") Integer orderNo,Model odModel) {
//		List<OrderItemBean> classList = orderItemService.findByOrderno(orderNo);
//		odModel.addAttribute("classList", classList);
//		return "_04_shoppingCart/ordersItemCRUD";
//	}
<<<<<<< HEAD

	// 查詢------
	// 搜尋某筆訂單全部ITEM-跳轉到CRUD的頁面
	@RequestMapping(path = "/shoppingCart.SelectOrderAllItem.controller/{orderNo}", method = RequestMethod.GET)
	public String processSelectAllItemAcction(@PathVariable("orderNo") Integer orderNo, Model odModel,
			@ModelAttribute("OrderBean") OrderBean od) {
		List<OrderItemBean> classList = orderItemService.findByOrderno(orderNo);
		System.out.println("開始找");
		odModel.addAttribute("classList", classList);
		return "_04_shoppingCart/ordersItemCRUD";
	}
=======
	
	
	// 查詢------
		// 搜尋某筆訂單全部ITEM-跳轉到CRUD的頁面
		@RequestMapping(path = "/shoppingCart.SelectOrderAllItem.controller/{orderNo}", method = RequestMethod.GET)
		public String processSelectAllItemAcction(
				@PathVariable("orderNo") Integer orderNo,Model odModel,@ModelAttribute("OrderBean") OrderBean od) {
			List<OrderItemBean> classList = orderItemService.findByOrderno(orderNo);
			System.out.println("開始找");
			odModel.addAttribute("classList", classList);
			return "_04_shoppingCart/ordersItemCRUD";
		}
>>>>>>> origin/_01_Seal

}
