package springTeam5._04_shoppingCart.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ResponseStatusException;

import springTeam5._01_member.model.MemberBean;
import springTeam5._01_member.model.MemberRepository;
import springTeam5._03_product.model.Product;
import springTeam5._03_product.model.ProductRepository;
import springTeam5._03_product.service.ProductService;
import springTeam5._04_shoppingCart.constant.PaymentMethod;
import springTeam5._04_shoppingCart.dao.OrderDao;
import springTeam5._04_shoppingCart.dto.BuyItem;
import springTeam5._04_shoppingCart.dto.CreateOrderRequest;
import springTeam5._04_shoppingCart.dto.OrderQueryParams;
import springTeam5._04_shoppingCart.model.OrderBean;
import springTeam5._04_shoppingCart.model.OrderItemBean;
import springTeam5._04_shoppingCart.service.OrderService;

@Component
public class OrderServiceImpl implements OrderService {

	private final static Logger log = LoggerFactory.getLogger(OrderServiceImpl.class);

	@Autowired
	private OrderDao orderDao;

	@Autowired
	private ProductRepository pRepo;

	@Autowired
	private ProductService prodService;

	@Autowired
	private MemberRepository memberRepository;
	

	@Override
	public Integer countOrder(OrderQueryParams orderQueryParams) {
		return orderDao.countOrder(orderQueryParams);
	}

	@Override
	public List<OrderBean> getOrders(OrderQueryParams orderQueryParams) {
		List<OrderBean> orderList = orderDao.getOrders(orderQueryParams);

		for (OrderBean order : orderList) {
			List<OrderItemBean> orderItemList = orderDao.getOrderItemsByOrderId(order.getOrderNo());

			order.setItems(orderItemList);
		}
		return orderList;
	}

	@Override
	public OrderBean getOrderById(Integer orderId) {
		OrderBean order = orderDao.getOrderById(orderId);

		List<OrderItemBean> orderItemList = orderDao.getOrderItemsByOrderId(orderId);

		order.setItems(orderItemList);

		return order;
	}

	@Transactional
	@Override
	public Integer createOrder(Integer memberId, CreateOrderRequest createOrderRequest,PaymentMethod paymentMethod,String discountId ) {
		//檢查user是否存在
				MemberBean user = memberRepository.getById(memberId);
				
				if(user == null) {
					log.warn("該memberId {} 不存在", memberId);
					throw new ResponseStatusException(HttpStatus.BAD_REQUEST);
				}
				
				int totalAmount = 0;
				List<OrderItemBean> orderItemList = new ArrayList<>();

				for (BuyItem buyItem : createOrderRequest.getBuyItemList()) {
					Product product = pRepo.findByProdID(buyItem.getProdId());

					//檢查product 是否存在 庫存是否足夠
					if(product == null) {
						log.warn("商品 {} 不存在",buyItem.getProdId());
						throw new ResponseStatusException(HttpStatus.BAD_REQUEST);
					}else if(product.getInventory() < buyItem.getQty()) {
						log.warn("商品 {} 庫存數量不足，無法購買，剩餘庫存 {} ，欲購買數量 {}",buyItem.getProdId(),product.getInventory(),buyItem.getQty());
						throw new ResponseStatusException(HttpStatus.BAD_REQUEST);
					}
					
					//扣除商品庫存
					Integer inventory = product.getInventory();
					Integer qty= buyItem.getQty();
					product.setInventory(inventory-qty);
					prodService.updateProd(product);
					
					// 計算總價錢
					int amount = buyItem.getQty() * product.getProdPrice();
					totalAmount = totalAmount + amount;

					// 轉換BuyItem to OrderItem
					OrderItemBean orderItem = new OrderItemBean();
					orderItem.setProdId(buyItem.getProdId());
					orderItem.setQty(buyItem.getQty());
					orderItem.setItemTotal(amount);

					orderItemList.add(orderItem);
				}

				// 創建訂單
				Integer orderId = orderDao.createOrder(memberId,paymentMethod,discountId,totalAmount);

				orderDao.createOrderItems(orderId, orderItemList);

				return orderId;
	}

}
