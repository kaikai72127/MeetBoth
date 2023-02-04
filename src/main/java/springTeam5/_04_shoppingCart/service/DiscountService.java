package springTeam5._04_shoppingCart.service;

import java.util.List;

import springTeam5._04_shoppingCart.dto.DiscountQueryParams;
import springTeam5._04_shoppingCart.dto.DiscountResquest;
import springTeam5._04_shoppingCart.model.Discount;

public interface DiscountService {
	
	Integer countDiscount(DiscountQueryParams discountQueryParams);

	// 查詢全部的折扣碼
	List<Discount> getDiscount(DiscountQueryParams orderQueryParams);

	// 透過no找尋折扣碼
	Discount getDiscountByDiscountNo(String discountNo);

	// 透過id找尋折扣碼
	Discount getDiscountByDiscountId(Integer discountId);

	// 新增折扣碼
	Integer createDiscount(DiscountResquest discountResquest);
	
	//修改折扣碼
	void  updateDiscount(Integer discountId,DiscountResquest discountResquest);
	
	//刪除折扣碼
	void deleteDiscountById(Integer discountId);

}
