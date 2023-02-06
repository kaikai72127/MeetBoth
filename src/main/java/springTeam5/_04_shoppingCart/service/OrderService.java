package springTeam5._04_shoppingCart.service;

import java.util.List;

import springTeam5._04_shoppingCart.model.OrderBean;

public interface OrderService {

	// 新增一筆訂單
	OrderBean insertOrder(OrderBean obean);

	// 刪除一筆訂單-透過orderNo
	void deleteById(Integer orderNo);
	
	// 修改一筆訂單
	OrderBean updateOrder(OrderBean obean);

	// 查詢全部訂單
	List<OrderBean> selectAll();
	// 查詢一筆訂單資料-透過訂單編號
	List<OrderBean> findByOrderNo(Integer orderNo);
	// 模糊搜尋全部
	List<OrderBean> findSearchOrderNo(String searchAll);
	//條件搜尋
	List<OrderBean> findOrderBySearch(String ordstStus, String paymentStstus, String deliveryStstus, String search);
	

}
