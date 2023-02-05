package springTeam5._04_shoppingCart.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name = "discount")
@Component
public class Discount {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "DISCOUNT_ID")
	private Integer discountId;
	@Column(name = "DISCOUNT_NO")
	private String discountNo;
	@Column(name = "DISCOUNT_NAME")
	private String discountName;
	@Column(name = "DISCOUNT_PRICE")
	private Double discountPrice;
	@Column(name = "DISCOUNT_DESC")
	private String discountDesc;
	@Column(name = "DISCOUNT_START")
	private String discountStart;
	@Column(name = "DISCOUNT_END")
	private String discountEnd;
	
	public Discount(Integer discountId, String discountNo, String discountName, Double discountPrice,
			String discountDesc, String discountStart, String discountEnd) {
		super();
		this.discountId = discountId;
		this.discountNo = discountNo;
		this.discountName = discountName;
		this.discountPrice = discountPrice;
		this.discountDesc = discountDesc;
		this.discountStart = discountStart;
		this.discountEnd = discountEnd;
	}

	public Discount(String discountNo, String discountName, Double discountPrice, String discountDesc,
			String discountStart, String discountEnd) {
		super();
		this.discountNo = discountNo;
		this.discountName = discountName;
		this.discountPrice = discountPrice;
		this.discountDesc = discountDesc;
		this.discountStart = discountStart;
		this.discountEnd = discountEnd;
	}
	
	
	public Discount() {
	}
	
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
	public String getDiscountStart() {
		return discountStart;
	}
	public void setDiscountStart(String discountStart) {
		this.discountStart = discountStart;
	}
	public String getDiscountEnd() {
		return discountEnd;
	}
	public void setDiscountEnd(String discountEnd) {
		this.discountEnd = discountEnd;
	}
	@Override
	public String toString() {
		return "Discount [discountId=" + discountId + ", discountNo=" + discountNo + ", discountName=" + discountName
				+ ", discountPrice=" + discountPrice + ", discountDesc=" + discountDesc + ", discountStart="
				+ discountStart + ", discountEnd=" + discountEnd + "]";
	}

	
	
	
}
