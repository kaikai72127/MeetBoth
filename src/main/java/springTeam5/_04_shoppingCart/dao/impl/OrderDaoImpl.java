package springTeam5._04_shoppingCart.dao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import springTeam5._04_shoppingCart.constant.PaymentMethod;
import springTeam5._04_shoppingCart.dao.OrderDao;
import springTeam5._04_shoppingCart.dto.OrderQueryParams;
import springTeam5._04_shoppingCart.model.OrderBean;
import springTeam5._04_shoppingCart.model.OrderItemBean;
import springTeam5._04_shoppingCart.rowmapper.OrderItemRowMapper;
import springTeam5._04_shoppingCart.rowmapper.OrderRowMapper;

@Component
public class OrderDaoImpl implements OrderDao {
	
	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	@Override
	public Integer countOrder(OrderQueryParams orderQueryParams) {
		String sql = "SELECT count(*) FROM memberorder WHERE 1=1";

		Map<String, Object> map = new HashMap<>();

		//查詢條件
		sql = addFilteringSql(sql, map, orderQueryParams);
		
		Integer total = namedParameterJdbcTemplate.queryForObject(sql, map, Integer.class);

		return total;
	}

	//查詢全部的訂單
	@Override
	public List<OrderBean> getOrders(OrderQueryParams orderQueryParams) {
		String sql = "SELECT * FROM memberorder WHERE 1=1";

		Map<String, Object> map = new HashMap<>();

		//查詢條件
		sql= addFilteringSql(sql,map,orderQueryParams);
		
		//排序 最新的訂單會在最前面顯示 寫死的
		sql=sql+" ORDER BY orderdate DESC";
		
		//分頁
		sql=sql+" LIMIT :limit OFFSET :offset";
		map.put("limit",orderQueryParams.getLimit());
		map.put("offset",orderQueryParams.getOffset());
		
		List<OrderBean> orderList = namedParameterJdbcTemplate.query(sql,map,new OrderRowMapper());
		
		return orderList;
	}

	//透過ID找尋一筆訂單
	@Override
	public OrderBean getOrderById(Integer memberId) {
		String sql = "SELECT * "
				+ "FROM memberorder WHERE memberid=:memberId";

		Map<String, Object> map = new HashMap<>();
		map.put("memberid", memberId);

		List<OrderBean> orderList = namedParameterJdbcTemplate.query(sql, map, new OrderRowMapper());

		if (orderList.size() > 0) {
			return orderList.get(0);
		} else {
			return null;
		}
	}

	//找尋訂單明細
	@Override
	public List<OrderItemBean> getOrderItemsByOrderId(Integer mamberId) {
		String sql = "SELECT oi.orderno,oi.seqno,oi.prodid,oi.qty,oi.prodprice,oi.itemtotal,p.prodname,p.prodimg "
				+ "FROM orderitem as oi " + "LEFT JOIN product as p ON oi.prodid=p.prodId"
				+ "WHERE oi.memberid=:mamberId";

		Map<String, Object> map = new HashMap<>();
		map.put("mamberId", mamberId);

		List<OrderItemBean> orderItemList = namedParameterJdbcTemplate.query(sql, map, new OrderItemRowMapper());

		return orderItemList;
	}

	//新增一筆訂單
	@Override
	public Integer createOrder(Integer memberId,PaymentMethod paymentMethod,String discountId,Integer totalAmount) {
		String sql = "INSERT INTO memberorder(memberid,orderdate,uporderdate,"
				+ "shippingaddress,"
//				+ "ordststus,paymentststus,deliveryststus,"
				+ "paymentmethod,"
				+ "discountid,totalAmount) "
				+ "VALUES(:memberId,:orderDate,:uporderDate,:shippingAddress,"
//				+ ":ordStstus,:paymentStstus,:deliveryStstus,"
				+ ":paymentMethod,"
				+ ":discountId,:totalAmount)";

		Map<String, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		Date now = new Date();
		map.put("createdDate", now);
		map.put("lastModifiedDate", now);
		
		
		map.put("shippingAddress", paymentMethod);
		map.put("paymentMethod", paymentMethod);
		map.put("discountId", discountId);
		map.put("paymentMethod", paymentMethod);
		map.put("totalAmount", totalAmount);
		
		KeyHolder keyHolder = new GeneratedKeyHolder();

		namedParameterJdbcTemplate.update(sql, new MapSqlParameterSource(map), keyHolder);

		int orderId = keyHolder.getKey().intValue();

		return orderId;
	}

	//新增一筆訂單明細
	@Override
	public void createOrderItems(Integer orderId, List<OrderItemBean> orderItemList) {
		// 使用 batchUpdate 一次性加入數據，效率較高
				String sql = "INSERT INTO orderitem(orderid,productid,qty,itemtotal) "
						+ "VALUES(:orderId,:productId,:qty,:itemtotal)";

				MapSqlParameterSource[] parameterSources = new MapSqlParameterSource[orderItemList.size()];

				for (int i = 0; i < orderItemList.size(); i++) {
					OrderItemBean orderItem = orderItemList.get(i);

					parameterSources[i] = new MapSqlParameterSource();
					parameterSources[i].addValue("orderId", orderId);
					parameterSources[i].addValue("productId", orderItem.getProdId());
					parameterSources[i].addValue("quantity", orderItem.getQty());
					parameterSources[i].addValue("amount", orderItem.getItemTotal());
				}
				namedParameterJdbcTemplate.batchUpdate(sql, parameterSources);
		
	}

	private String addFilteringSql(String sql,Map<String,Object> map,OrderQueryParams orderQueryParams) {
		
		if(orderQueryParams.getMemberId() != null) {
			sql = sql +" AND memberid=:memberId";
			map.put("memberId",orderQueryParams.getMemberId());
		}
		return sql;
	}
	
}
