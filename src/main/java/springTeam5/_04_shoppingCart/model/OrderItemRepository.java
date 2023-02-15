package springTeam5._04_shoppingCart.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface OrderItemRepository extends JpaRepository<OrderItemBean, Integer> {
	

	// 刪除訂單明細
	@Modifying
	@Query(value ="DELETE FROM orderitem WHERE orderNo = :param1 AND seqno = :param2", nativeQuery = true)
	public void deleteOrdItem(@Param("param1")Integer orderNo,@Param("param2") Integer seqno);

	// 查詢該訂單的所有Item
	@Query(value = "SELECT * FROM orderitem where orderNo_fk =?", nativeQuery = true)
	public List<OrderItemBean> findByOrderno(Integer orderNo);

	// 查詢該訂單的所有Item
	@Query(value = "SELECT * from orderitem where orderno =?1 and seqno=?2", nativeQuery = true)
	public List<OrderItemBean> findOrderItem(Integer orderNo, Integer seqno);

	// 查詢該訂單的所有Item
	@Query(value = "from OrderItemBean where seqno=?1")
	public List<OrderItemBean> findBySqeno(Integer seqno);
	
	// 找賣家訂單的資料
	@Query(value = "select * from orderitem where membersale_FK=?1 order by seqno DESC", nativeQuery = true)
	public List<OrderItemBean> findByMembersale(Integer membersale_FK);
	// 找賣家訂單的資料--OrderList用
	@Query(value = "select * from orderitem oi JOIN memberorder mo ON oi.orderNo_fk = mo.orderno where membersale_FK=?1 and orderNo =?2 order by seqno", nativeQuery = true)
	public List<OrderItemBean> findByMemberSale(Integer membersale_FK,Integer orderNo);
	// 找賣家訂單的資料--OrderList模糊搜尋用
	@Query(value = "select * from orderitem oi JOIN memberorder mo ON oi.orderNo_fk = mo.orderno where membersale_FK=?1 and orderNo =?2 order by seqno", nativeQuery = true)
	public List<OrderItemBean> findByMemberSaleAllLike(Integer membersale_FK,Integer orderNo);


}
