package springTeam5._04_shoppingCart.model;

import java.util.Date;

public class Discount {
	
	private Integer discountId;
	private String discountNo;
	private String discountName;
	private Double discountPrice;
	private String discountDesc;
	
	private Date discountStart;
	private Date discountEnd;
	
	
	public Integer getDiscountId() {
		return discountId;
	}
	public void setDiscountId(Integer discountId) {
		this.discountId = discountId;
	}
	public String getDiscountNo() {
		return discountNo;
	}
	public void setDiscountNo(String discountNo) {
		this.discountNo = discountNo;
	}
	public String getDiscountName() {
		return discountName;
	}
	public void setDiscountName(String discountName) {
		this.discountName = discountName;
	}
	public Double getDiscountPrice() {
		return discountPrice;
	}
	public void setDiscountPrice(Double discountPrice) {
		this.discountPrice = discountPrice;
	}
	public String getDiscountDesc() {
		return discountDesc;
	}
	public void setDiscountDesc(String discountDesc) {
		this.discountDesc = discountDesc;
	}
	public Date getDiscountStart() {
		return discountStart;
	}
	public void setDiscountStart(Date discountStart) {
		this.discountStart = discountStart;
	}
	public Date getDiscountEnd() {
		return discountEnd;
	}
	public void setDiscountEnd(Date discountEnd) {
		this.discountEnd = discountEnd;
	}

	
	
}
