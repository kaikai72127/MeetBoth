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
	@Query(value = "select * from orderitem where orderno =?", nativeQuery = true)
	public List<OrderItemBean> findByOrderno(Integer orderNo);

	// 查詢該訂單的所有Item
	@Query(value = "select * from orderitem where orderno =?1 and seqno=?2", nativeQuery = true)
	public List<OrderItemBean> findOrderItem(Integer orderNo, Integer seqno);

	// 查詢該訂單的所有Item
	@Query(value = "from OrderItemBean where seqno=?1")
	public List<OrderItemBean> findBySqeno(Integer seqno);

}
