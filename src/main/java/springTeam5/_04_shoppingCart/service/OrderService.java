package springTeam5._04_shoppingCart.service;

import java.util.List;

import springTeam5._04_shoppingCart.constant.PaymentMethod;
import springTeam5._04_shoppingCart.dto.CreateOrderRequest;
import springTeam5._04_shoppingCart.dto.OrderQueryParams;
import springTeam5._04_shoppingCart.model.OrderBean;

public interface OrderService {

	Integer countOrder(OrderQueryParams orderQueryParams);

	List<OrderBean> getOrders(OrderQueryParams orderQueryParams);

	OrderBean getOrderById(Integer orderId);

	Integer createOrder(Integer userId, CreateOrderRequest createOrderRequest,PaymentMethod paymentMethod,String discountId);

}
