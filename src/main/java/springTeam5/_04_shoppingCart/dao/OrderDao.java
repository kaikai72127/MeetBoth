package springTeam5._04_shoppingCart.dao;

import java.util.List;

import springTeam5._04_shoppingCart.constant.PaymentMethod;
import springTeam5._04_shoppingCart.dto.OrderQueryParams;
import springTeam5._04_shoppingCart.model.OrderBean;
import springTeam5._04_shoppingCart.model.OrderItemBean;

public interface OrderDao {
	
	Integer countOrder(OrderQueryParams orderQueryParams);
	
	//查詢全部的訂單
	List<OrderBean> getOrders(OrderQueryParams orderQueryParams);
	
	//透過ID找尋訂單
	OrderBean getOrderById(Integer orderId);
	
	//找尋訂單明細
	List<OrderItemBean> getOrderItemsByOrderId(Integer orderId);
	
	//新增一筆訂單
	Integer createOrder(Integer userId,PaymentMethod paymentMethod,String discountId, Integer totalAmount);
	
	//新增訂單明細
	void createOrderItems(Integer orderId, List<OrderItemBean> orderItemList);
	
	//刪除一筆訂單
	void deleteOrderById(Integer orderId);
	//刪除一筆訂單所有明細
	void deleteOrderItemById(Integer orderno);
}
