package springTeam5._04_shoppingCart.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import springTeam5._04_shoppingCart.constant.PaymentMethod;
import springTeam5._04_shoppingCart.model.OrderBean;

public class OrderRowMapper implements RowMapper<OrderBean> {

	@Override
	public OrderBean mapRow(ResultSet resultSet, int rowNum) throws SQLException {
		
		OrderBean order = new OrderBean();
        order.setOrderNo(resultSet.getInt("orderno"));
        order.setMemberId(resultSet.getString("mamberid"));
        order.setOrderDate(resultSet.getTimestamp("orderdate"));
        order.setUporderDate(resultSet.getTimestamp("uporderdate"));
        order.setShippingAddress(resultSet.getString("shippingaddress"));
        order.setOrdStstus(resultSet.getString("paymentststus"));
        order.setPaymentStstus(resultSet.getString("paymentststus"));
        order.setDeliveryStstus(resultSet.getString("deliveryststus"));
        order.setPaymentMethod(PaymentMethod.valueOf(resultSet.getString("paymentmethod")));
        order.setDiscountId(resultSet.getString("discountid"));
        order.setTotalAmount(resultSet.getInt("totalamount"));
        
        return order;
	}

}
