package springTeam5._04_shoppingCart.model;

import java.sql.Blob;

//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.JoinColumn;
//import javax.persistence.ManyToOne;
//import javax.persistence.Table;
//
//import org.springframework.stereotype.Component;

//@Entity @Table(name = "orderitem")
//@Component
public class OrderItemBean {
	
//	@ManyToOne
//	@JoinColumn(name = "ORDERNO_FK")
	private OrderBean orderbean; // 訂單編號
//	@Column(name="ORDERNO")
	private Integer orderNo;
	
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@Column(name = "SEQNO")
	private Integer seqno; // 序號
//	@Column(name = "PRODID")
	private Integer prodId; // 商品編號
//	@Column(name = "QTY")
	private Integer qty; // 數量
//	@Column(name = "PRODPRICE")
//	private Integer prodPrice; // 單價
//	@Column(name = "ITEMTOTAL")
	private Integer itemTotal; // 總金額
	
	
	private Blob prodImg;
	private String prodName;

	
	//新增有ID
	public OrderItemBean(OrderBean orderbean, Integer orderNo, Integer seqno, Integer prodId, String prodName,
			Integer qty, Double discount, Integer itemTotal, String remark) {
		this.orderbean = orderbean;
		this.orderNo = orderNo;
		this.seqno = seqno;
		this.prodId = prodId;

		this.qty = qty;

		this.itemTotal = itemTotal;

	}
	
	//修改沒有ID
	public OrderItemBean(OrderBean orderbean, Integer orderNo,  Integer prodId,
			Integer qty,Integer itemTotal) {
		this.orderbean = orderbean;
		this.orderNo = orderNo;
		this.prodId = prodId;
		this.qty = qty;
		this.itemTotal = itemTotal;
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


	public Integer getItemTotal() {
		return itemTotal;
	}

	public void setItemTotal(Integer itemTotal) {
		this.itemTotal = itemTotal;
	}

	public Blob getProdImg() {
		return prodImg;
	}

	public void setProdImg(Blob prodImg) {
		this.prodImg = prodImg;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}




	
}
