package springTeam5._04_shoppingCart.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import springTeam5._04_shoppingCart.dao.DiscountDao;
import springTeam5._04_shoppingCart.dto.DiscountQueryParams;
import springTeam5._04_shoppingCart.dto.DiscountResquest;
import springTeam5._04_shoppingCart.model.Discount;
import springTeam5._04_shoppingCart.rowmapper.DiscountRowMapper;

@Component
public class DiscountDaoImpl implements DiscountDao {

	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	@Override
	public Integer countDiscount(DiscountQueryParams discountQueryParams) {
		String sql = "SELECT count(*) FROM discount WHERE 1=1";

		Map<String, Object> map = new HashMap<>();

		// 查詢條件
		sql = addFilteringStr(sql, map, discountQueryParams);

		Integer total = namedParameterJdbcTemplate.queryForObject(sql, map, Integer.class);

		return total;
	}

	@Override
	public List<Discount> getDiscount(DiscountQueryParams discountQueryParams) {
		String sql = "Select * " + "FROM discount WHERE 1=1";
		Map<String, Object> map = new HashMap<>();

		// 查詢條件
		sql = addFilteringStr(sql, map, discountQueryParams);

		// 排序 因為已經有預設,不會是null,所以沒有再另外判斷是否為null
		sql = sql + " ORDER BY " + discountQueryParams.getOrderBy();

		// 分頁
		sql = sql + " LIMIT :limit OFFSET :offset";
		map.put("limit", discountQueryParams.getLimit());
		map.put("offset", discountQueryParams.getOffset());

		List<Discount> discountList = namedParameterJdbcTemplate.query(sql, map, new DiscountRowMapper());

		return discountList;
	}

	@Override
	public Discount getDiscountByDiscountNo(String discountNo) {
		String sql = "Select *" + "FROM discount WHERE discount_No= :discountNo";
		Map<String, Object> map = new HashMap<>();
		map.put("discountNo", discountNo);

		List<Discount> discountList = namedParameterJdbcTemplate.query(sql, map, new DiscountRowMapper());

		if (discountList.size() > 0) {
			return discountList.get(0);
		} else {
			return null;
		}
	}

	@Override
	public Discount getDiscountByDiscountId(Integer discountId) {
		String sql = "Select *" + "FROM discount WHERE discount_Id= :discountId";
		Map<String, Object> map = new HashMap<>();
		map.put("discountId", discountId);

		List<Discount> discountList = namedParameterJdbcTemplate.query(sql, map, new DiscountRowMapper());

		if (discountList.size() > 0) {
			return discountList.get(0);
		} else {
			return null;
		}
	}

	@Override
	public Integer createDiscount(DiscountResquest discountResquest) {
		String sql = "INSERT INTO discount(product_name,category,image_url,price,"
				+ "stock,description,created_date,last_modified_date)"
				+ "VALUES(:productName,:category,:imageUrl,:price,:stock,:description,"
				+ ":createdDate,:lastModifiedDate)";

		Map<String, Object> map = new HashMap<>();
		map.put("discountNo", discountResquest.getDiscountNo());
		map.put("discountName", discountResquest.getDiscountName());
		map.put("discountPrice", discountResquest.getDiscountPrice());
		map.put("discountDesc", discountResquest.getDiscountDesc());
		map.put("discountStart", discountResquest.getDiscountStart());
		map.put("discountEnd", discountResquest.getDiscountEnd());

		KeyHolder keyHolder = new GeneratedKeyHolder();

		namedParameterJdbcTemplate.update(sql, new MapSqlParameterSource(map), keyHolder);

		int productId = keyHolder.getKey().intValue();

		return productId;
	}

	@Override
	public void updateDiscount(Integer discountId, DiscountResquest discountResquest) {

		String sql = "UPDATE product SET discount_name=:discountName,discount_Price=:discountPrice,"
				+ "discount_Desc=:discountDesc,discount_Start=:discountStart,discount_End=:discountEnd"
				+ " WHERE discount_id=:discountId";

		Map<String, Object> map = new HashMap<>();
		map.put("discountId", discountId);

		map.put("productName", discountResquest.getDiscountName());
		map.put("discountPrice", discountResquest.getDiscountPrice());
		map.put("discountDesc", discountResquest.getDiscountDesc());
		map.put("discountEnd", discountResquest.getDiscountEnd());

		namedParameterJdbcTemplate.update(sql, map);

	}

	@Override
	public void deleteDiscountById(Integer discountId) {

		String sql = "DELETE FROM discount WHERE discount_id =:discountId";

		Map<String, Object> map = new HashMap<>();
		map.put("discountId", discountId);

		namedParameterJdbcTemplate.update(sql, map);

	}
	

	private String addFilteringStr(String sql, Map<String, Object> map, DiscountQueryParams discountQueryParams) {

		if (discountQueryParams.getSearch() != null) {
			sql = sql + " AND discount_no LIKE :discountNo";
			map.put("discountNo", "%" + discountQueryParams.getDiscountNo() + "%");
		}

		if (discountQueryParams.getSearch() != null) {
			sql = sql + " AND discount_name LIKE :search";
			map.put("search", "%" + discountQueryParams.getSearch() + "%");
		}

		return sql;
	}

}
