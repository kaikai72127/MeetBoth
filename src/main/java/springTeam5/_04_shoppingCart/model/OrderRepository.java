package springTeam5._04_shoppingCart.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import springTeam5._03_product.model.Product;

public interface OrderRepository extends JpaRepository<OrderBean, Integer> {

	// 找全部訂單資料
	@Query(value = "select * from memberorder", nativeQuery = true)
	public List<OrderBean> selectAll();

	// 找單一訂單的資料
	public List<OrderBean> findByOrderNo(Integer orderNo);

	// 找買家所有的訂單的資料
	@Query(value = "select * from memberorder where memberbuy_FK=?1 order by orderNo", nativeQuery = true)
	public List<OrderBean> findByMemberbuy(Integer memberbuy_FK);

	// 模糊選擇的條件式訂單資料搜尋
	@Query(value = "select * from memberorder where ordStstus LIKE concat('%',IIF(?1='0','',?1),'%') and paymentStstus LIKE concat('%',IIF(?2='0','',?2),'%') and deliveryStstus LIKE concat('%',IIF(?3='0','',?3),'%') and (orderNo like concat('%',?4,'%') or memberbuy_FK like concat('%',?4,'%')) order by orderNo", nativeQuery = true)
	public List<OrderBean> findOrderBySearchAllLike(String ordStstus, String paymentStstus, String deliveryStstus,String search);
	
	// 模糊選擇的條件式訂單資料搜尋
	@Query(value = "select * from memberorder where orderUID like concat('%',?1,'%') order by orderNo", nativeQuery = true)
	public List<OrderBean> findOrderByUID(String orderUID);
	
}
