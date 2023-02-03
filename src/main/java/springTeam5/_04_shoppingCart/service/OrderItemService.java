package springTeam5._04_shoppingCart.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import springTeam5._04_shoppingCart.model.OrderBean;
import springTeam5._04_shoppingCart.model.OrderItemBean;
import springTeam5._04_shoppingCart.model.OrderItemRepository;
import springTeam5._04_shoppingCart.model.OrderRepository;

@Service
@Transactional
public class OrderItemService {

	@Autowired
	private OrderItemRepository orderItemRepo;

	@Autowired
	private OrderRepository orderRepo;
	
	public String getCurrentDate() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		return sdf.format(date);
	}

//	新增一筆訂單 沒有折扣
	public OrderItemBean insertOItem(OrderItemBean oItemBean) {
		return orderItemRepo.save(oItemBean);
	}

//刪除---------------------
//	 透過orderNo刪除
	public Boolean deleteOrdItem(Integer orderNo, Integer seqno) {
		System.out.println("經過servie了唷!");
		System.out.println(orderNo);
		List<OrderBean> orderList = orderRepo.findByOrderNo(orderNo);
		System.out.println("orderList細項" + orderList);
		OrderBean orderBean = orderList.get(0);
		System.out.println("orderBean細項" + orderBean);
		Set<OrderItemBean> items = orderBean.getItems();
		Iterator<OrderItemBean> it = items.iterator();
		while (it.hasNext()) {
			OrderItemBean ordItemBean = it.next();
			if (ordItemBean.getSeqno() == seqno) {
				// 更新資料
				// 原本的資料金額
				Integer itemTotal = ordItemBean.getItemTotal();
				Integer totalAmount = orderBean.getTotalAmount();
				// 移除Item
				if (ordItemBean != null) {
					items.remove(ordItemBean);
					orderItemRepo.deleteOrdItem(orderNo, seqno);
					orderBean.setTotalAmount(totalAmount - itemTotal);
					orderBean.setUporderDate(getCurrentDate());
					orderRepo.save(orderBean);
					return true;
				}
			}
		}
		return false;
	}

//修改---------------------
	// 透過訂單編號修改訂單資料
	public OrderItemBean updateOrderItem(OrderItemBean oItemBean) {
		return orderItemRepo.save(oItemBean);
	}

//查詢---------------------
	// 搜尋全部訂單明細資料
	public List<OrderItemBean> findByOrderno(Integer orderNo) {
		return orderItemRepo.findByOrderno(orderNo);
	}

//
	public List<OrderItemBean> searchOrderItemByOrderNo(Integer orderNo) {

		List<OrderItemBean> resultList = orderItemRepo.findByOrderno(orderNo);

		List<OrderItemBean> list = new ArrayList<OrderItemBean>();
		if (resultList.isEmpty()) {
			return null;
		}
		OrderItemBean index0 = resultList.get(0);
		list.add(index0);
		return list;
	}

	// 搜尋orderNo
//	public OrderItemBean selectOneOrdItem(Integer orderNo) {
//		return orderItemRepo.selectOneOrdItem(orderNo);
//	}

	// 搜尋單一明細資料
	public List<OrderItemBean> findBySqeno(Integer seqno) {
		return orderItemRepo.findBySqeno(seqno);
	}

	public List<OrderItemBean> findOrderItem(Integer orderNo, Integer seqno) {
		return orderItemRepo.findOrderItem(orderNo, seqno);
	}
}
