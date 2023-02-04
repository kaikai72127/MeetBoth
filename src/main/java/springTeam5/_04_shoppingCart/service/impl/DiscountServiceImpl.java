package springTeam5._04_shoppingCart.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import springTeam5._04_shoppingCart.dao.DiscountDao;
import springTeam5._04_shoppingCart.dto.DiscountQueryParams;
import springTeam5._04_shoppingCart.dto.DiscountResquest;
import springTeam5._04_shoppingCart.model.Discount;
import springTeam5._04_shoppingCart.service.DiscountService;

@Component
public class DiscountServiceImpl implements DiscountService{
	
	@Autowired
	private DiscountDao discountDao;

	@Override
	public Integer countDiscount(DiscountQueryParams discountQueryParams) {
		return discountDao.countDiscount(discountQueryParams);
	}

	@Override
	public List<Discount> getDiscount(DiscountQueryParams orderQueryParams) {
		return discountDao.getDiscount(orderQueryParams);
	}

	@Override
	public Discount getDiscountByDiscountNo(String discountNo) {
		return discountDao.getDiscountByDiscountNo(discountNo);
	}

	@Override
	public Discount getDiscountByDiscountId(Integer discountId) {
		return discountDao.getDiscountByDiscountId(discountId);
	}

	@Override
	public Integer createDiscount(DiscountResquest discountResquest) {
		return discountDao.createDiscount(discountResquest);
	}

	@Override
	public void updateDiscount(Integer discountId, DiscountResquest discountResquest) {
		discountDao.updateDiscount(discountId,discountResquest);	
	}

	@Override
	public void deleteDiscountById(Integer discountId) {
		discountDao.deleteDiscountById(discountId);
	}

}
