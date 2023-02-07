package springTeam5._04_shoppingCart.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import springTeam5._03_product.service.ProductService;
import springTeam5._04_shoppingCart.model.OrderBean;
import springTeam5._04_shoppingCart.model.OrderRepository;

@Service
@Transactional
public class OrderServiceImpl implements springTeam5._04_shoppingCart.service.OrderService {

	private static Logger log = LoggerFactory.getLogger(OrderServiceImpl.class);

	@Autowired
	private OrderRepository orderRepo;
	@Autowired
	private OrderItemServiceImpl orderItemService;
	@Autowired
	private ProductService productService;

	public String getCurrentDate() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		return sdf.format(date);
	}

//新增----------
	// 新增一筆訂單
	public OrderBean insertOrder(OrderBean obean) {
		return orderRepo.save(obean);
	}

//刪除----------
	// 刪除一筆訂單-透過orderNo
	public void deleteById(Integer orderNo) {
		orderRepo.deleteById(orderNo);
	}

	
// 修改----------
	// 修改一筆訂單
	public OrderBean updateOrder(OrderBean obean) {
		return orderRepo.save(obean);
	}

//查詢----------
	// 查詢全部訂單
	public List<OrderBean> selectAll() {
		return orderRepo.selectAll();
	}

	// 查詢一筆訂單資料-透過訂單編號

	public List<OrderBean> findByOrderNo(Integer orderNo) {
		return orderRepo.findByOrderNo(orderNo);
	}

	// 條件搜尋----模糊搜尋用
	@Override
	public List<OrderBean> findOrderBySearch1(String ordStstus, String paymentStstus, String deliveryStstus,
			String search) {
		return orderRepo.findOrderBySearch1(ordStstus, paymentStstus, deliveryStstus, search);
	}

	@Override
	public List<OrderBean> findByMemberbuy(Integer memberbuy_FK) {
		return orderRepo.findByMemberbuy(memberbuy_FK);
	}

	@Override
	public List<OrderBean> findByMembersale(Integer membersale_FK) {
		return orderRepo.findByMembersale(membersale_FK);
	}

	@Override
	public List<OrderBean> findOrderBySearch2(String paymentStstus, String deliveryStstus, String search) {
		return orderRepo.findOrderBySearch2(paymentStstus,deliveryStstus,search);
	}

	@Override
	public List<OrderBean> findOrderBySearch3(String deliveryStstus, String search) {
		return orderRepo.findOrderBySearch3(deliveryStstus, search);
	}

	@Override
	public List<OrderBean> findOrderBySearch4(String search) {
		return orderRepo.findOrderBySearch4(search);
	}

	@Override
	public List<OrderBean> findOrderByOrdStstus(String ordStstus) {
		return orderRepo.findOrderByOrdStstus(ordStstus);
	}

	@Override
	public List<OrderBean> findOrderByPaymentStstus(String paymentStstus) {
		return findOrderByPaymentStstus(paymentStstus);
	}

	@Override
	public List<OrderBean> findOrderByDeliveryStstus(String deliveryStstus) {
		return findOrderByDeliveryStstus(deliveryStstus);
	}
	
	

//	// 檢查購物車----
//	@Override
//	public void preCheckStock(ShoppingCart shoppingCart) {
//
//		Set<Integer> set = shoppingCart.getShoppingCart().keySet();
//		for (Integer i : set) {
//			OrderItemBean oib = shoppingCart.getShoppingCart().get(i);
//			int stock = productService.searchSingleProductFromProdID(oib.getProdId()).getInventory();
//			if (stock < oib.getQty()) {
//				log.info("訂單前期檢查之Service preCheckStock(): 庫存數量不足, " + oib.getP + ", 在庫量: " + stock
//						+ ", 訂購量: " + oib.getQty());
//				throw new ProductStockException(
//						"庫存數量不足: 商品: " + oib.getDescription() + ", 在庫量: " + stock + ", 訂購量: " + oib.getQuantity());
//			}
//			log.info("訂單前期檢查之Service preCheckStock(): 未發現任何商品數量不足");
//		}
//
//	}

}
