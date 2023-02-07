package springTeam5._04_shoppingCart.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface OrderRepository extends JpaRepository<OrderBean, Integer> {

	// 找全部訂單資料
	@Query(value = "select * from memberorder", nativeQuery = true)
	public List<OrderBean> selectAll();

	// 找單一訂單的資料
	public List<OrderBean> findByOrderNo(Integer orderNo);

	// 找買家所有的訂單的資料
	@Query(value = "select * from memberorder where memberbuy_FK=?1 order by orderNo", nativeQuery = true)
	public List<OrderBean> findByMemberbuy(Integer memberbuy_FK);

	// 找賣家訂單的資料
	@Query(value = "select * from memberorder where membersale_FK=?1 order by orderNo", nativeQuery = true)
	public List<OrderBean> findByMembersale(Integer membersale_FK);

	// 模糊搜尋訂單的資料用
	// 全部都選擇的條件式訂單資料搜尋
	@Query(value = "select * from memberorder where  ordStstus=?1 and paymentStstus=?2 and deliveryStstus=?3 and (orderNo like concat('%',?4,'%') or memberbuy_FK like concat('%',?4,'%') or membersale_FK like concat('%',?4,'%')) order by orderNo", nativeQuery = true)
	public List<OrderBean> findOrderBySearch1(String ordStstus, String paymentStstus, String deliveryStstus,
			String search);

	// 全部都選擇的條件式訂單資料搜尋paymentStstus+deliveryStstus+search
	@Query(value = "select * from memberorder where  paymentStstus=?1 and deliveryStstus=?2 and (orderNo like concat('%',?3,'%') or memberbuy_FK like concat('%',?3,'%') or membersale_FK like concat('%',?3,'%')) order by orderNo", nativeQuery = true)
	public List<OrderBean> findOrderBySearch2(String paymentStstus, String deliveryStstus, String search);

	// 全部都選擇的條件式訂單資料搜尋deliveryStstus+search
	@Query(value = "select * from memberorder where deliveryStstus=?1 and (orderNo like concat('%',?2,'%') or memberbuy_FK like concat('%',?2,'%') or membersale_FK like concat('%',?2,'%')) order by orderNo", nativeQuery = true)
	public List<OrderBean> findOrderBySearch3(String deliveryStstus, String search);

	// 全部都選擇的條件式訂單資料搜尋
	@Query(value = "select * from memberorder where  (orderNo like concat('%',?1,'%') or memberbuy_FK like concat('%',?1,'%') or membersale_FK like concat('%',?1,'%')) order by orderNo", nativeQuery = true)
	public List<OrderBean> findOrderBySearch4(String search);

	// ordStstus條件式訂單資料搜尋
	@Query(value = "select * from memberorder where ordStstus=?1 order by orderNo", nativeQuery = true)
	public List<OrderBean> findOrderByOrdStstus(String ordStstus);

	// paymentStstus條件式訂單資料搜尋
	@Query(value = "select * from memberorder where ordStstus=?1 order by orderNo", nativeQuery = true)
	public List<OrderBean> findOrderByPaymentStstus(String paymentStstus);

	// deliveryStstus條件式訂單資料搜尋
	@Query(value = "select * from memberorder where deliveryStstus=?1 order by orderNo", nativeQuery = true)
	public List<OrderBean> findOrderByDeliveryStstus(String deliveryStstus);
}
