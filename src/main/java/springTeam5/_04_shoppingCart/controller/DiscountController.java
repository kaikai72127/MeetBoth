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
import org.springframework.web.bind.annotation.ResponseBody;

import springTeam5._04_shoppingCart.model.Discount;
import springTeam5._04_shoppingCart.model.OrderBean;
import springTeam5._04_shoppingCart.service.impl.DiscountServiceImpl;

@Controller
public class DiscountController {

	@Autowired
	private DiscountServiceImpl discountService;

	// 查詢------

//管理者才可以對折扣碼增刪改查
	// 跳轉到全部折扣碼的地方
	@GetMapping("/admin/discounts.controller")
	public String getAllDiscounts(Model odModel) {
		List<Discount> discountList = discountService.getDiscount();
		odModel.addAttribute("discountList", discountList);
		return "_04_shoppingCart/adminDiscount";
		}

	// 新增------
	// 跳轉到新增頁面
	@PostMapping("/admin/discountsCreate.controller")
	public String processInsertOrderMainAction() {
		return "_04_shoppingCart/discountCreate";
	}

	@PostMapping("/admin/discountsCreateMain.controller")
	public String createDiscount(@RequestParam("discountNo") String discountNo,
			@RequestParam("discountName") String discountName, @RequestParam("discountPrice") Double discountPrice,
			@RequestParam("discountDesc") String discountDesc, @RequestParam("discountStart") String discountStart,
			@RequestParam("discountEnd") String discountEnd, HttpServletResponse response) throws IOException {

		Discount discount = new Discount();
		discount.setDiscountNo(discountNo);
		discount.setDiscountName(discountName);
		discount.setDiscountPrice(discountPrice);
		discount.setDiscountDesc(discountDesc);
		discount.setDiscountStart(discountStart);
		discount.setDiscountEnd(discountEnd);

		discountService.createDiscount(discount);

		response.sendRedirect("/admin/discounts.controller");
		return null;

	}

	// 刪除------
	@GetMapping("/admin/discounts.controller/{discountId}")
	public String processDeleteOrderAction(@PathVariable("discountId") int discountId) {

		discountService.deleteDiscountByDiscountId(discountId);

		return "redirect:/admin/discounts.controller";
	}

	// 修改------
	// 跳轉到修改頁面
	@PostMapping("/admin/discountsUpdate.controller/{discountId}")
	public String processUpdateOrderMainAction(@PathVariable("discountId") int discountId, Model model) {

		Discount discount = discountService.getDiscountByDiscountId(discountId);
		model.addAttribute("bean", discount);

		return "_04_shoppingCart/adminDiscountUpdate";

	}

//	// 修改頁面
	@PostMapping("/admin/discountsUpdateMain.controller")
	public String processUpdateOrderMainAction(@RequestParam("discountNo") String discountNo,
			@RequestParam("discountName") String discountName, @RequestParam("discountPrice") Double discountPrice,
			@RequestParam("discountDesc") String discountDesc, @RequestParam("discountStart") String discountStart,
			@RequestParam("discountEnd") String discountEnd) {
		Discount discount = discountService.getDiscountByDiscountNo(discountNo);
		System.out.println(discountNo);
		discount.setDiscountName(discountName);
		discount.setDiscountPrice(Double.valueOf(discountPrice));
		discount.setDiscountDesc(discountDesc);
		discount.setDiscountStart(discountStart);
		discount.setDiscountEnd(discountEnd);

		discountService.updateDiscount(discount);
		return "redirect:/admin/discounts.controller";
	}
	
	// 模糊搜尋全部
	@RequestMapping(path = "/admin/discountsSearch.controller", method = RequestMethod.POST)
	public String processSearchAllAcction(@RequestParam(value = "dateStart", required = false) String dateStart,
			@RequestParam(value = "dateEnd", required = false) String dateEnd,
			@RequestParam(value = "search", required = false) String search, @ModelAttribute("OrderBean") OrderBean od,
			Model odModel) {

		if (search == null) {
			search = "";
		}
		System.out.println(dateStart + "---" + dateEnd + "---" + search);

		List<Discount> classList = discountService.findDiscountBySearchAllLike(dateStart, dateEnd, search);
		odModel.addAttribute("orderList", classList);
		return "redirect:/admin/discounts.controller";
	}

//判斷折扣碼是否可以使用-----結帳用
	@GetMapping("/discountCheck.controller")
	@ResponseBody
	public String processCheckDiscountAction(@RequestParam("discountNo") String discountNo) {

		List<Discount> allDiscount = discountService.getDiscount();

		for (Discount i : allDiscount) {
			System.out.println("找第一個discout-----");
			if (i.getDiscountNo().equals(discountNo)) {

				Double discountPrice = i.getDiscountPrice();
				String price = String.valueOf(Math.round(discountPrice));

				return price;
			}
		}
		;
		return "CANTUSE";

	}

}
