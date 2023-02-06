package springTeam5._04_shoppingCart.service;

import java.util.List;

import springTeam5._04_shoppingCart.model.OrderItemBean;

public interface OrderItemService {

	//	新增一筆訂單 沒有折扣
	OrderItemBean insertOItem(OrderItemBean oItemBean);

	// 刪除---------------------
	//	 透過orderNo刪除
	Boolean deleteOrdItem(Integer orderNo, Integer seqno);

	// 修改---------------------
	// 透過訂單編號修改訂單資料
	OrderItemBean updateOrderItem(OrderItemBean oItemBean);
	
	//查詢---------------------
		// 搜尋全部訂單明細資料
	List<OrderItemBean> findByOrderno(Integer orderNo);
	List<OrderItemBean> findBySqeno(Integer seqno);
	List<OrderItemBean> findOrderItem(Integer orderNo, Integer seqno);
	
	
}
