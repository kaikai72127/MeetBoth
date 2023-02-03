package springTeam5._04_shoppingCart.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name = "orderitem")
@Component
public class OrderItemBean {
	
	@ManyToOne
	@JoinColumn(name = "ORDERNO_FK")
	private OrderBean orderbean; // 訂單編號
	@Column(name="ORDERNO")
	private Integer orderNo;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "SEQNO")
	private Integer seqno; // 序號
	@Column(name = "PRODID")
	private String prodId; // 商品編號
	@Column(name = "PRODNAME")
	private String prodName; // 商品名稱
	@Column(name = "QTY")
	private Integer qty; // 數量
	@Column(name = "PRODPRICE")
	private Integer prodPrice; // 單價
	@Column(name = "DISCOUNT")
	private Double discount = 1.0; // 折扣
	@Column(name = "ITEMTOTAL")
	private Integer itemTotal; // 總金額
	@Column(name = "REMARK")
	private String remark; // 備註
	
	//新增有ID
	public OrderItemBean(OrderBean orderbean, Integer orderNo, Integer seqno, String prodId, String prodName,
			Integer qty, Integer prodPrice, Double discount, Integer itemTotal, String remark) {
		this.orderbean = orderbean;
		this.orderNo = orderNo;
		this.seqno = seqno;
		this.prodId = prodId;
		this.prodName = prodName;
		this.qty = qty;
		this.prodPrice = prodPrice;
		this.discount = discount;
		this.itemTotal = itemTotal;
		this.remark = remark;
	}
	
	//修改沒有ID
	public OrderItemBean(OrderBean orderbean, Integer orderNo,  String prodId, String prodName,
			Integer qty, Integer prodPrice, Double discount, Integer itemTotal, String remark) {
		this.orderbean = orderbean;
		this.orderNo = orderNo;
		this.prodId = prodId;
		this.prodName = prodName;
		this.qty = qty;
		this.prodPrice = prodPrice;
		this.discount = discount;
		this.itemTotal = itemTotal;
		this.remark = remark;
	}

	public OrderItemBean() {

	}

	public OrderBean getOrderbean() {
		return orderbean;
	}

	public void setOrderbean(OrderBean orderbean) {
		this.orderbean = orderbean;
	}

	public Integer getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	public Integer getSeqno() {
		return seqno;
	}

	public void setSeqno(Integer seqno) {
		this.seqno = seqno;
	}

	public String getProdId() {
		return prodId;
	}

	public void setProdId(String prodId) {
		this.prodId = prodId;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public Integer getQty() {
		return qty;
	}

	public void setQty(Integer qty) {
		this.qty = qty;
	}

	public Integer getProdPrice() {
		return prodPrice;
	}

	public void setProdPrice(Integer prodPrice) {
		this.prodPrice = prodPrice;
	}

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public Integer getItemTotal() {
		return itemTotal;
	}

	public void setItemTotal(Integer itemTotal) {
		this.itemTotal = itemTotal;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "OrderItemBean [orderbean=" + orderbean + ", orderNo=" + orderNo + ", seqno=" + seqno + ", prodId="
				+ prodId + ", prodName=" + prodName + ", qty=" + qty + ", prodPrice=" + prodPrice + ", discount="
				+ discount + ", itemTotal=" + itemTotal + ", remark=" + remark + "]";
	}
	
}
