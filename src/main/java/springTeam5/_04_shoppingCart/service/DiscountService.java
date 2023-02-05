package springTeam5._04_shoppingCart.service;

import java.util.List;

import springTeam5._04_shoppingCart.dto.DiscountQueryParams;
import springTeam5._04_shoppingCart.model.Discount;

public interface DiscountService {
	
	Integer countDiscount(DiscountQueryParams discountQueryParams);

	// 查詢全部的折扣碼
	List<Discount> getDiscount();

	// 透過no找尋折扣碼
	Discount getDiscountByDiscountNo(String discountNo);

	// 透過編號來做單一個折扣資訊搜尋 會回傳一個 Discount
	Discount getDiscountByDiscountId(Integer discountId);

	// 新增折扣碼
	Discount createDiscount(Discount discount);
	
	//修改折扣碼
	void  updateDiscount(Discount discount);
	
	//刪除折扣碼
	void deleteDiscountByDiscountId(Integer discountId);

}
