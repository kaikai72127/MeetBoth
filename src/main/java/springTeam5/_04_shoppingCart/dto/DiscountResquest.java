package springTeam5._04_shoppingCart.dto;

import java.util.Date;

import javax.validation.constraints.NotNull;

public class DiscountResquest {
	
	@NotNull
	private String discountNo;
	@NotNull
	private String discountName;
	@NotNull
	private Double discountPrice;
	@NotNull
	private String discountDesc;
	@NotNull
	private Date discountStart;
	@NotNull
	private Date discountEnd;
	
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
