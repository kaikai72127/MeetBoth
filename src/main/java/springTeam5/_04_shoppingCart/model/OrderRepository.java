package springTeam5._04_shoppingCart.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;



public interface OrderRepository extends JpaRepository<OrderBean, Integer> {
	
	//找全部訂單資料
	@Query(value = "select * from memberorder", nativeQuery = true)
	public List<OrderBean> selectAll();
	
	//找單一訂單的資料
	public List<OrderBean> findByOrderNo(Integer orderNo);
	

	//模糊搜尋訂單的資料
	@Query(value = "from OrderBean where orderNo like concat('%', ?1, '%') or memberId like concat('%', ?1, '%') or shippingAddress like concat('%', ?1, '%')"
			+ "or ordStstus like concat('%', ?1, '%') or paymentStstus like concat('%', ?1, '%') or deliveryStstus like concat('%', ?1, '%')")
	public List<OrderBean> findSearchOrderNo(String searchAll);
	
	//條件式訂單資料搜尋
	@Query(value = "select * from Product where  ordstStus=?1 and paymentStstus=?2 and deliveryStstus=?3 and (orderNo like concat('%',?4,'%') or memberId like concat('%',?4,'%')) order by orderNo", nativeQuery = true)
	public List<OrderBean> findOrderBySearch(String ordstStus, String paymentStstus, String deliveryStstus, String search);

}
