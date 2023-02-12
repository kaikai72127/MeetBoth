package springTeam5._04_shoppingCart.service;

import java.util.List;

import springTeam5._04_shoppingCart.model.OrderBean;
import springTeam5._04_shoppingCart.model.ShoppingCart;

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

	List<OrderBean> findByMembersale(Integer membersale_FK);

	// 查詢一筆訂單資料-透過訂單編號
	List<OrderBean> findByOrderNo(Integer orderNo);
	
	//訂單流水號生成使用
	List<OrderBean> findOrderByUID(String orderUID);

	// 條件搜尋
	List<OrderBean> findOrderBySearchAllLike(String ordStstus, String paymentStstus, String deliveryStstus, String search);
	
	List<OrderBean> findOrderBySearch1(String ordStstus, String paymentStstus, String deliveryStstus, String search);

	List<OrderBean> findOrderBySearch2(String paymentStstus, String deliveryStstus, String search);

	List<OrderBean> findOrderBySearch3(String deliveryStstus, String search);

	List<OrderBean> findOrderBySearch4(String search);

	List<OrderBean> findOrderByOrdStstus(String ordStstus);

	List<OrderBean> findOrderByPaymentStstus(String paymentStstus);

	List<OrderBean> findOrderByDeliveryStstus(String deliveryStstus);
	// 檢查購物車
//	void preCheckStock(ShoppingCart shoppingCart);

}
