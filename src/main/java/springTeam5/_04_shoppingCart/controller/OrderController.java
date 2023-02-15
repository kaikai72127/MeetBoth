package springTeam5._04_shoppingCart.controller;

import java.io.IOException;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
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
import springTeam5._01_member.model.MemberService;
import springTeam5._04_shoppingCart.model.Discount;
import springTeam5._04_shoppingCart.model.OrderBean;
import springTeam5._04_shoppingCart.model.OrderItemBean;
import springTeam5._04_shoppingCart.service.impl.DiscountServiceImpl;
import springTeam5._04_shoppingCart.service.impl.OrderItemServiceImpl;
import springTeam5._04_shoppingCart.service.impl.OrderServiceImpl;

@Controller
public class OrderController {

	@Autowired
	private OrderServiceImpl orderService;
	@Autowired
	private OrderItemServiceImpl orderItemService;

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
	@GetMapping("/admin/shoppingCart.DeleteOrder.controller")
	public String processDeleteOrderAction(@RequestParam("orderNo") Integer orderNo) {
		orderService.deleteById(orderNo);
		return "redirect:shoppingCartOrders.controller";
	}

// 修改------
	// 跳轉到修改頁面
	@GetMapping("/admin/shoppingCartUpdateOrder.controller/{orderNo}")
	public String processUpdateOrderMainAction(@PathVariable("orderNo") Integer orderNo, Model odModel) {

		List<OrderBean> orderBeanList = orderService.findByOrderNo(orderNo);
		OrderBean orderBean = orderBeanList.get(0);
		Set<OrderItemBean> orderItems = orderBean.getItems();

		odModel.addAttribute("orderBean", orderBean);
		odModel.addAttribute("orderItems", orderItems);

		return "_04_shoppingCart/adminOrdersUpdate";

	}

	// 修改頁面
	@PostMapping("/admin/shoppingCartUpdateOrderMain.controller")
	public String processUpdateOrderMainAction1(@RequestParam("orderNo") Integer orderNo,
			@RequestParam("shippingName") String shippingName, @RequestParam("shippingPhone") String shippingPhone,
			@RequestParam("shippingAddress") String shippingAddress, @RequestParam("ordStstus") String ordStstus,
			@RequestParam("paymentStstus") String paymentStstus, @RequestParam("deliveryStstus") String deliveryStstus,
			@RequestParam("discountNo") String discountNo) {

		OrderBean obean = orderService.findByOrderNo(orderNo).get(0);
		// 可以修改的地方
		obean.setShippingName(shippingName);
		obean.setShippingPhone(shippingPhone);
		obean.setShippingAddress(shippingAddress);
		obean.setOrdStstus(ordStstus);
		obean.setPaymentStstus(paymentStstus);
		obean.setDeliveryStstus(deliveryStstus);
		Discount discount = discountService.getDiscountByDiscountNo(discountNo);
		obean.setDiscount(discount);
		obean.setUporderDate(orderService.getCurrentDate());
		orderService.updateOrder(obean);

		return "redirect:shoppingCartUpdateOrder.controller/" + orderNo;
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
	// 後台管理使用---------------------------------------------------------------------------
	// 搜尋全部-跳轉到CRUD的頁面用
	@RequestMapping(path = "/admin/shoppingCartOrders.controller/{page}", method = RequestMethod.GET)
	public String processSelectAllAcction(@ModelAttribute("OrderBean") OrderBean od, Model odModel,
			@PathVariable("page") String page) {
		List<OrderBean> classList = orderService.selectAll();
		int page2 = 1;
		try {
			page2 = Integer.parseInt(page);
		} catch (NumberFormatException e) {
			page2 = 1;
		}
		// 每頁顯示的貼文數量，可以自行修改
		int pageSize = 10;
		int totalPages = (int) Math.ceil((double) classList.size() / pageSize);
		int startIndex = (page2 - 1) * pageSize;
		int endIndex = startIndex + pageSize;
		if (endIndex > classList.size()) {
			endIndex = classList.size();
		}
		if (startIndex >= classList.size()) {
			startIndex = classList.size() - pageSize;
		}
		if (classList.size() <= pageSize) {
			startIndex = 0;
		} else if (startIndex >= classList.size()) {
			startIndex = classList.size() - pageSize;
		}
		List<OrderBean> orderList = classList.subList(startIndex, endIndex);

		odModel.addAttribute("orderList", orderList);
		odModel.addAttribute("totalPages", totalPages);
		odModel.addAttribute("currentPage", page2);
		return "_04_shoppingCart/adminOrders";
	}

	// 模糊搜尋全部
	@RequestMapping(path = "/admin/shoppingCartSearchOrders.controller/{page}", method = RequestMethod.POST)
	public String processSearchAllAcction(@RequestParam(value = "ordStstus", required = false) String ordStstus,
			@RequestParam(value = "paymentStstus", required = false) String paymentStstus,
			@RequestParam(value = "deliveryStstus", required = false) String deliveryStstus,
			@RequestParam(value = "search", required = false) String search, @ModelAttribute("OrderBean") OrderBean od,
			Model odModel,@PathVariable("page") String page) {

		if (search == null) {
			search = "";
		}
		System.out.println(ordStstus + "---" + paymentStstus + "---" + deliveryStstus + "---123" + search + "QQ-----");

		List<OrderBean> classList = orderService.findOrderBySearchAllLike(ordStstus, paymentStstus, deliveryStstus,
				search);
		int page2 = 1;
		try {
			page2 = Integer.parseInt(page);
		} catch (NumberFormatException e) {
			page2 = 1;
		}
		// 每頁顯示的貼文數量，可以自行修改
		int pageSize = 10;
		int totalPages = (int) Math.ceil((double) classList.size() / pageSize);
		int startIndex = (page2 - 1) * pageSize;
		int endIndex = startIndex + pageSize;
		if (endIndex > classList.size()) {
			endIndex = classList.size();
		}
		if (startIndex >= classList.size()) {
			startIndex = classList.size() - pageSize;
		}
		if (classList.size() <= pageSize) {
			startIndex = 0;
		} else if (startIndex >= classList.size()) {
			startIndex = classList.size() - pageSize;
		}
		List<OrderBean> orderList = classList.subList(startIndex, endIndex);

		odModel.addAttribute("orderList", orderList);
		odModel.addAttribute("totalPages", totalPages);
		odModel.addAttribute("currentPage", page2);
		
		return "_04_shoppingCart/adminOrders";
	}

// 前台訂單使用------------
	@GetMapping(path = "/memberOrdersList.controller")
	public String fondMemberBuy(Model model, HttpServletRequest request) {
//		HttpSession session = request.getSession(false);
//		MemberBean member = (MemberBean) session.getAttribute("Member");

		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> mem = memberService.searchMemByAccount(account);
		System.out.println("----------------找資料");
		if (mem.size() == 0) {
			return "login";
		} else {
			MemberBean memberBean = mem.get(0);
			System.out.println("----------------找資料");
			List<OrderBean> orderList = orderService.findByMemberbuy(memberBean.getMemberID());
			System.out.println("----------------找資料");
			List<OrderBean> orderSaleList = orderService.findByMemberSale(memberBean.getMemberID());
			model.addAttribute("memberBean", memberBean);
			model.addAttribute("orderList", orderList);
			model.addAttribute("orderSaleList", orderSaleList);
			return "/_04_shoppingCart/memberOrderList";
		}
	}

	@GetMapping(path = "/memberOrdersList.controller/{orderNo}")
	public String fondMemberBuy(@PathVariable("orderNo") Integer orderNo, Model model, HttpServletRequest request) {
//		HttpSession session = request.getSession(false);
//		MemberBean member = (MemberBean) session.getAttribute("Member");

		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> mem = memberService.searchMemByAccount(account);
		MemberBean loginMember = mem.get(0);
		List<OrderBean> orderBean = orderService.findByOrderNo(orderNo);
		MemberBean memberbuy = orderBean.get(0).getMemberbuy();
		System.out.println("----------" + memberbuy.getMemName() + "-----------" + loginMember.getMemName());
		// 確認查看銷售訂單的人是否為登入者本人 不是則返回首頁
		if (!loginMember.equals(memberbuy)) {

			System.out.println("----------回去首頁吧");
			return "redirect:/index.controller";
		} else {

			Set<OrderItemBean> items = orderBean.get(0).getItems();
			System.out.println("------------------------" + items.size());

			model.addAttribute("memberBean", loginMember);
			model.addAttribute("orderBean", orderBean.get(0));
			model.addAttribute("items", items);
			return "/_04_shoppingCart/orderDetial";
		}
	}

	// 銷售訂單查詢編輯用
	@GetMapping(path = "/memberOrdersSaleList.controller/{orderNo}")
	public String fondMemberSale(@PathVariable("orderNo") Integer orderNo, Model model, HttpServletRequest request) {
		// 取得登入者資料
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> mem = memberService.searchMemByAccount(account);
		MemberBean loginMember = mem.get(0);
		// 查詢登入者售出訂單
		List<OrderBean> memberSaleList = orderService.findByMemberSaleAndOrderNo(orderNo, loginMember.getMemberID());
		System.out.println("---查詢---");
		// 確認查看銷售訂單如果為空 則不是銷售本人則返回首頁
		if (memberSaleList.isEmpty()) {
			System.out.println("非此登入者----------回去首頁吧");
			return "redirect:/index.controller";
		}

		List<OrderItemBean> orderSales = orderItemService.findByMemberSale(loginMember.getMemberID(), orderNo);

		model.addAttribute("memberBean", loginMember);
		model.addAttribute("orderBean", memberSaleList.get(0));
		model.addAttribute("items", orderSales);

		return "/_04_shoppingCart/orderDetialCRUD";

	}

	// 銷售訂單編輯狀態用
	@PostMapping(path = "/memberOrdersSaleListUpdate.controller/{orderNo}")
	public String fondMemberSaleUpdate(@PathVariable("orderNo") Integer orderNo,
			@RequestParam(value = "ordStstus", required = false) String ordStstus,
			@RequestParam(value = "paymentStstus", required = false) String paymentStstus,
			@RequestParam(value = "deliveryStstus", required = false) String deliveryStstus, Model model,
			HttpServletRequest request) {
		// 取得登入者資料
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> mem = memberService.searchMemByAccount(account);
		MemberBean loginMember = mem.get(0);
		// 查詢登入者售出訂單
		List<OrderBean> memberSaleList = orderService.findByMemberSaleAndOrderNo(orderNo, loginMember.getMemberID());
		System.out.println("---查詢132---");
		// 確認查看銷售訂單如果為空 則不是銷售本人則返回首頁
		if (memberSaleList.isEmpty()) {
			System.out.println("非此登入者----------回去首頁吧");
			return "redirect:/index.controller";
		}

		System.out.println("----改資料");
		OrderBean orderBean = memberSaleList.get(0);
		orderBean.setOrdStstus(ordStstus);
		orderBean.setPaymentStstus(paymentStstus);
		orderBean.setDeliveryStstus(deliveryStstus);
		orderService.updateOrder(orderBean);

		List<OrderItemBean> orderSales = orderItemService.findByMemberSale(loginMember.getMemberID(), orderNo);

		model.addAttribute("memberBean", loginMember);
		model.addAttribute("orderBean", orderBean);
		model.addAttribute("items", orderSales);

		return "/_04_shoppingCart/orderDetialCRUD";

	}

	// 模糊搜尋全部-----前台使用
	@RequestMapping(path = "/searchOrdersList.controller", method = RequestMethod.POST)
	public String memberSearchAllLike(@RequestParam(value = "ordStstus", required = false) String ordStstus,
			@RequestParam(value = "paymentStstus", required = false) String paymentStstus,
			@RequestParam(value = "deliveryStstus", required = false) String deliveryStstus,
			@RequestParam(value = "search", required = false) String search, @ModelAttribute("OrderBean") OrderBean od,
			Model model) {

		if (search == null) {
			search = "";
		}
		System.out.println(ordStstus + "---" + paymentStstus + "---" + deliveryStstus + "---123" + search + "QQ-----");

		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MemberBean> mem = memberService.searchMemByAccount(account);
		MemberBean loginMember = mem.get(0);

		List<OrderBean> orderList = orderService.findByMemberbuyAllLike(ordStstus, paymentStstus, deliveryStstus,
				search, loginMember.getMemberID());
		List<OrderBean> orderSaleList = orderService.findByMemberSaleAllLike(loginMember.getMemberID(), ordStstus,
				paymentStstus, deliveryStstus, search);

		model.addAttribute("memberBean", loginMember);
		model.addAttribute("orderList", orderList);
		model.addAttribute("orderSaleList", orderSaleList);
		return "/_04_shoppingCart/memberOrderList";

	}

}
