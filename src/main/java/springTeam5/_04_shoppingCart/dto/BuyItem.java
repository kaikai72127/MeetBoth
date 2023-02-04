package springTeam5._04_shoppingCart.dto;

import javax.validation.constraints.NotNull;

public class BuyItem {
	
	@NotNull
	private Integer prodId;
	private Integer qty;
	
	public Integer getProdId() {
		return prodId;
	}
	public void setProdId(Integer prodId) {
		this.prodId = prodId;
	}
	public Integer getQty() {
		return qty;
	}
	public void setQty(Integer qty) {
		this.qty = qty;
	}
	
	

}
