package springTeam5._04_shoppingCart.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import springTeam5._04_shoppingCart.model.OrderItemBean;

public class OrderItemRowMapper implements RowMapper<OrderItemBean> {

	@Override
	public OrderItemBean mapRow(ResultSet resultSet, int rowNum) throws SQLException {
		OrderItemBean orderItem = new OrderItemBean();
		orderItem.setOrderNo(resultSet.getInt("orderno"));
		orderItem.setSeqno(resultSet.getInt("seqno"));
		orderItem.setProdId(resultSet.getInt("prodid"));
		orderItem.setQty(resultSet.getInt("qty"));
		orderItem.setItemTotal(resultSet.getInt("itemtotal"));

		orderItem.setProdName(resultSet.getString("prodname"));
		orderItem.setProdImg(resultSet.getBlob("prodimg"));

		return orderItem;

	}

}
