package springTeam5._04_shoppingCart.controller;

import java.util.List;

import javax.validation.Valid;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springTeam5._04_shoppingCart.dto.DiscountQueryParams;
import springTeam5._04_shoppingCart.model.Discount;
import springTeam5._04_shoppingCart.service.DiscountService;
import springTeam5._04_shoppingCart.util.Page;

@Valid
@Controller
public class DiscountController {

	@Autowired
	private DiscountService discountService;

	@GetMapping("/discount")
	public String getDiscounts(
			// 查尋條件 Filtering
			@RequestParam(required = false) String discountNo, @RequestParam(required = false) String search,

			// 排序 Sorting
			@RequestParam(defaultValue = "created_date") String orderBy,

			// 分頁 Pagination
			@RequestParam(defaultValue = "5") @Max(1000) @Min(0) Integer limit,
			@RequestParam(defaultValue = "0") @Min(0) Integer offset

	) {

		DiscountQueryParams discountQueryParams = new DiscountQueryParams();
		discountQueryParams.setDiscountNo(discountNo);
		discountQueryParams.setSearch(search);
		discountQueryParams.setOrderBy(orderBy);
		discountQueryParams.setLimit(limit);
		discountQueryParams.setOffset(offset);

		// 取得product list
		List<Discount> productList = discountService.getDiscount(discountQueryParams);

		// 取得product總數
		Integer total = discountService.countDiscount(discountQueryParams);

		// 分頁
		Page<Discount> page = new Page<>();
		page.setLimit(limit);
		page.setOffset(offset);
		page.setTotal(total);
		page.setResult(productList);

		return "_04_shoppingCart/discountCRUD";
	}
	
	

}
