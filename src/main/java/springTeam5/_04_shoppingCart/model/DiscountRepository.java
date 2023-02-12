package springTeam5._04_shoppingCart.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface DiscountRepository extends JpaRepository<Discount, Integer> {

	// Discount 全部搜尋
	public List<Discount> findAll();

	// Discount
	public Discount getDiscountByDiscountId(Integer discountId);

	// Discount
	public Discount getDiscountByDiscountNo(String discountINo);

	// 透過discountId刪除整筆商品資料
	public void deleteDiscountByDiscountId(Integer discountId);

	// 模糊選擇的條件式訂單資料搜尋
	@Query(value = "select * from discount where DISCOUNT_START >= ?1 and DISCOUNT_END <= ?2 and (DISCOUNT_NO like concat('%',?3,'%') or DISCOUNT_PRICE like concat('%',?3,'%')) order by DISCOUNT_ID", nativeQuery = true)
	public List<Discount> findDiscountBySearchAllLike(String dateStart, String dateEnd,String search);

}
