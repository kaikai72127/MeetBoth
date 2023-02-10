package springTeam5._04_shoppingCart.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import springTeam5._04_shoppingCart.model.Discount;
import springTeam5._04_shoppingCart.service.impl.DiscountServiceImpl;

@Controller
public class DiscountController {

	@Autowired
	private DiscountServiceImpl discountService;

	// 展示課程列表(後臺維護)
	// 查詢------
//	@GetMapping("/discounts.controller")
//	public String getDiscounts(
//			// 查尋條件 Filtering
//			@RequestParam(required = false) String discountNo, @RequestParam(required = false) String search,
//
//			// 排序 Sorting
//			@RequestParam(defaultValue = "discount_Start") String orderBy,
//
//			// 分頁 Pagination
////			@RequestParam(defaultValue = "5") @Max(1000) @Min(0) Integer limit,
////			@RequestParam(defaultValue = "0") @Min(0) Integer offset
//			@ModelAttribute("Discount") Discount discount, Model odModel
//
//	) {
//
//		DiscountQueryParams discountQueryParams = new DiscountQueryParams();
//		discountQueryParams.setDiscountNo(discountNo);
//		discountQueryParams.setSearch(search);
//		discountQueryParams.setOrderBy(orderBy);
////		discountQueryParams.setLimit(limit);
////		discountQueryParams.setOffset(offset);
//
//		// 取得product list
//		List<Discount> productList = discountService.getDiscount(discountQueryParams);
//
//		// 取得product總數
//		Integer total = discountService.countDiscount(discountQueryParams);
//
//		// 分頁
//		Page<Discount> page = new Page<>();
////		page.setLimit(limit);
////		page.setOffset(offset);
//		page.setTotal(total);
//		page.setResult(productList);
//
//		System.out.println(productList.get(0));
//
//		odModel.addAttribute("classList", productList);
//
//		return "_04_shoppingCart/discountCRUD";
//	}

//管理者才可以對折扣碼增刪改查
	//跳轉到全部折扣碼的地方
	@GetMapping("/discounts.controller")
	public String getAllDiscounts(Model odModel) {
		List<Discount> classList = discountService.getDiscount();
		odModel.addAttribute("classList", classList);
		return "_04_shoppingCart/discountCRUD";
	}

	// 新增------
	// 跳轉到新增頁面
	@PostMapping("/discountsCreate.controller")
	public String processInsertOrderMainAction() {
		return "_04_shoppingCart/discountCreate";
	}

	@PostMapping("/discountsCreateMain.controller")
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

		response.sendRedirect("discounts.controller");
		return null;

	}

	// 刪除------
	@GetMapping("/discounts.controller/{discountId}")
	public String processDeleteOrderAction(@PathVariable("discountId") int discountId) {

		discountService.deleteDiscountByDiscountId(discountId);

		return "redirect:/discounts.controller";
	}

	// 修改------
	// 跳轉到修改頁面
	@PostMapping("/discountsUpdate.controller/{discountId}")
	public String processUpdateOrderMainAction(
			@PathVariable("discountId") int discountId, Model model) {

		Discount discount = discountService.getDiscountByDiscountId(discountId);
		model.addAttribute("bean", discount);

		return "_04_shoppingCart/discountUpdate";

	}

//	// 修改頁面
	@PostMapping("/discountsUpdateMain.controller")
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
		return "redirect:/discounts.controller";
	}
	
//判斷折扣碼是否可以使用
	@GetMapping("/discountCheck.controller")
	@ResponseBody
	public String processCheckDiscountAction(@RequestParam("discountNo") String discountNo) {
//		Discount discountUse = discountService.getDiscountByDiscountNo(discountNo);
	
		List<Discount> allDiscount = discountService.getDiscount();
		
		for(Discount i : allDiscount) {
			System.out.println("找第一個discout-----");
			if(i.getDiscountNo().equals(discountNo)) {
				
				Double discountPrice = i.getDiscountPrice();
				String price = String.valueOf(Math.round(discountPrice));
				
				return price;				
			}
		};
		return "CANTUSE";

	}
	

}
