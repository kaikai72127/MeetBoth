package springTeam5._04_shoppingCart.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;


public interface DiscountRepository extends JpaRepository<Discount, Integer> {

	// Discount 全部搜尋
	public List<Discount> findAll();

	// Discount
	public Discount getDiscountByDiscountId(Integer discountId);
	
	// Discount
	public Discount getDiscountByDiscountNo(String discountINo);
	
	//	透過discountId刪除整筆商品資料
	public void deleteDiscountByDiscountId(Integer discountId);


	

}
