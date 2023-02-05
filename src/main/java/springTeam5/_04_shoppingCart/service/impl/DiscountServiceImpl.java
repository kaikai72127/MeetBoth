package springTeam5._04_shoppingCart.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springTeam5._04_shoppingCart.dto.DiscountQueryParams;
import springTeam5._04_shoppingCart.model.Discount;
import springTeam5._04_shoppingCart.model.DiscountRepository;
import springTeam5._04_shoppingCart.service.DiscountService;

@Service
@Transactional
public class DiscountServiceImpl implements DiscountService {

	@Autowired
	private DiscountRepository discountRepository;

	@Override
	public Integer countDiscount(DiscountQueryParams discountQueryParams) {
		return null;
	}

	@Override
	public List<Discount> getDiscount() {
		return discountRepository.findAll();
	}

	@Override
	public Discount getDiscountByDiscountNo(String discountNo) {
		return discountRepository.getDiscountByDiscountNo(discountNo);
	}

	@Override
	public Discount getDiscountByDiscountId(Integer discountId) {
		return discountRepository.getDiscountByDiscountId(discountId);
	}

	@Override
	public Discount createDiscount(Discount discount) {

		return discountRepository.save(discount);
	}

	@Override
	public void updateDiscount(Discount discount) {
		discountRepository.save(discount);

	}

	@Override
	public void deleteDiscountByDiscountId(Integer discountId) {
		discountRepository.deleteById(discountId);
	}

}
