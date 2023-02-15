package springTeam5._04_shoppingCart.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface OrderRepository extends JpaRepository<OrderBean, Integer> {

	// 找全部訂單資料
	@Query(value = "select * from memberorder order by orderUID DESC", nativeQuery = true)
	public List<OrderBean> selectAll();

	// 找單一訂單的資料
	public List<OrderBean> findByOrderNo(Integer orderNo);

	// 找買家所有的訂單的資料
	@Query(value = "select * from memberorder where memberbuy_FK=?1 order by orderNo DESC", nativeQuery = true)
	public List<OrderBean> findByMemberbuy(Integer memberbuy_FK);

	// 找買家所有的訂單的資料的模糊搜尋
	@Query(value = "select * from memberorder where ordStstus LIKE concat('%',IIF(?1='0','',?1),'%') and paymentStstus LIKE concat('%',IIF(?2='0','',?2),'%') and deliveryStstus LIKE concat('%',IIF(?3='0','',?3),'%') and (orderUID like concat('%',?4,'%')) and memberbuy_FK=?5 order by orderNo DESC", nativeQuery = true)
	public List<OrderBean> findByMemberbuyAllLike(String ordStstus, String paymentStstus, String deliveryStstus,
			String search,Integer memberbuy_FK);

	// 找賣家所有的訂單的資料
	@Query(value = "select * from memberorder mo JOIN orderitem oi ON mo.orderno = oi.orderNo_fk where membersale_FK=?1 order by orderNo DESC", nativeQuery = true)
	public List<OrderBean> findByMemberSale(Integer membersale_FK);
	@Query(value = "select * from memberorder mo JOIN orderitem oi ON mo.orderno = oi.orderNo_fk where orderno=?1 and membersale_FK=?2 order by orderNo DESC", nativeQuery = true)
	public List<OrderBean> findByMemberSaleAndOrderNo(Integer orderNo, Integer membersale_FK);
	// 找賣家所有的訂單的資料
	@Query(value = "select * from memberorder mo JOIN orderitem oi ON mo.orderno = oi.orderNo_fk where oi.membersale_FK=?1 and ordStstus LIKE concat('%',IIF(?2='0','',?2),'%') and paymentStstus LIKE concat('%',IIF(?3='0','',?3),'%') and deliveryStstus LIKE concat('%',IIF(?4='0','',?4),'%') and (orderUID like concat('%',?5,'%')) order by orderNo DESC", nativeQuery = true)
	public List<OrderBean> findByMemberSaleAllLike(Integer membersale_FK,String ordStstus, String paymentStstus, String deliveryStstus, String search);

	// 模糊選擇的條件式訂單資料搜尋
	@Query(value = "select * from memberorder mo JOIN Member m ON mo.memberbuy_FK =m.memberID where ordStstus LIKE concat('%',IIF(?1='0','',?1),'%') and paymentStstus LIKE concat('%',IIF(?2='0','',?2),'%') and deliveryStstus LIKE concat('%',IIF(?3='0','',?3),'%') and (orderUID like concat('%',?4,'%') or memberbuy_FK like concat('%',?4,'%') or m.MEMNAME like concat('%',?4,'%')) order by orderNo DESC", nativeQuery = true)
	public List<OrderBean> findOrderBySearchAllLike(String ordStstus, String paymentStstus, String deliveryStstus,
			String search);

	// 模糊選擇的條件式訂單資料搜尋
	@Query(value = "select * from memberorder where orderUID like concat('%',?1,'%') order by orderNo", nativeQuery = true)
	public List<OrderBean> findOrderByUID(String orderUID);

}
