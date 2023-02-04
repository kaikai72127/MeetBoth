package springTeam5._04_shoppingCart.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import springTeam5._04_shoppingCart.model.Discount;

public class DiscountRowMapper implements RowMapper<Discount> {

	@Override
	public Discount mapRow(ResultSet resultSet, int rowNum) throws SQLException {
		Discount discount = new Discount();
		
		discount.setDiscountNo(resultSet.getString("discountno"));
		discount.setDiscountName(resultSet.getString("discount_name"));
		discount.setDiscountPrice(resultSet.getDouble("discount_price"));
		discount.setDiscountDesc(resultSet.getString("discount_desc"));
		
		return discount;

	}

}
