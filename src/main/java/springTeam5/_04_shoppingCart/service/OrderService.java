package springTeam5._04_shoppingCart.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import springTeam5._04_shoppingCart.model.OrderBean;
import springTeam5._04_shoppingCart.model.OrderRepository;

@Service
@Transactional
public class OrderService {

	@Autowired
	private OrderRepository orderRepo;
	
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

//查詢----------
	// 查詢全部訂單
	public List<OrderBean> selectAll() {
		return orderRepo.selectAll();
	}

	// 查詢一筆訂單資料-透過訂單編號

	public List<OrderBean> findByOrderNo(Integer orderNo) {
		return orderRepo.findByOrderNo(orderNo);
	}

	// 模糊搜尋全部
	public List<OrderBean> findSearchOrderNo(String searchAll) {
		return orderRepo.findSearchOrderNo(searchAll);
	}

//修改----------
	// 修改一筆訂單

	@Transactional
	public OrderBean updateOrder(OrderBean obean) {
		return orderRepo.save(obean);
	}
}
