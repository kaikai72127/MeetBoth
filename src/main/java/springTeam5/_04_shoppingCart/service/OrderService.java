package springTeam5._04_shoppingCart.service;

import java.util.List;

import springTeam5._01_member.model.MemberBean;
import springTeam5._04_shoppingCart.model.OrderBean;

public interface OrderService {

	// 新增一筆訂單
	OrderBean createOrder(OrderBean obean);

	// 刪除一筆訂單-透過orderNo
	void deleteById(Integer orderNo);

	// 修改一筆訂單
	OrderBean updateOrder(OrderBean obean);

	// 查詢全部訂單
	List<OrderBean> selectAll();

	// 查詢買賣家的訂單資料
	List<OrderBean> findByMemberbuy(Integer memberbuy_FK);
	List<OrderBean> findByMemberSaleAndOrderNo(Integer orderNo, Integer membersale_FK);
	List<OrderBean> findByMemberSale(Integer membersale_FK);
	List<OrderBean> findByMemberbuyAllLike(String ordStstus, String paymentStstus, String deliveryStstus,
			String search,Integer memberbuy_FK);
	List<OrderBean> findByMemberSaleAllLike(Integer membersale_FK,String ordStstus, String paymentStstus, String deliveryStstus, String search);
	// 查詢一筆訂單資料-透過訂單編號
	List<OrderBean> findByOrderNo(Integer orderNo);

	// 訂單流水號生成使用
	List<OrderBean> findOrderByUID(String orderUID);

	// 條件搜尋
	List<OrderBean> findOrderBySearchAllLike(String ordStstus, String paymentStstus, String deliveryStstus,
			String search);

}
