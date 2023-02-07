package springTeam5._04_shoppingCart.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import springTeam5._03_product.model.Product;

@Entity
@Table(name = "orderitem")
@Component
public class OrderItemBean {

	

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "SEQNO")
	private Integer seqno; // 序號

	@ManyToOne
	@JoinColumn(name = "ORDERNO_FK")
	private OrderBean orderbean; // 訂單編號
	@Column(name = "ORDERNO")
	@Transient
	private Integer orderNo; 
	
	@ManyToOne
	@JoinColumn(name = "PRODUTID_FK")
	private Product proditem;// 商品編號
	@Column(name = "PRODID")
	@Transient
	private Integer prodId; 

	@Column(name = "QTY")
	private Integer qty; // 數量
	
	@Column(name = "ITEMTOTAL")
	private Integer itemTotal; // 總金額

	// 新增有ID
	public OrderItemBean(Integer seqno,OrderBean orderbean, Integer orderNo,  Product proditem, Integer prodId,
			Integer qty, Integer itemTotal) {
		super();
		this.orderbean = orderbean;
		this.orderNo = orderNo;
		this.seqno = seqno;
		this.proditem = proditem;
		this.prodId = prodId;
		this.qty = qty;
		this.itemTotal = itemTotal;
	}

	// 修改沒有ID
	public OrderItemBean(OrderBean orderbean, Integer orderNo, Product proditem, Integer prodId, Integer qty,
			Integer itemTotal) {
		super();
		this.orderbean = orderbean;
		this.orderNo = orderNo;
		this.proditem = proditem;
		this.prodId = prodId;
		this.qty = qty;
		this.itemTotal = itemTotal;
	}
	
	public OrderItemBean() {
		
	}

	public Integer getSeqno() {
		return seqno;
	}

	public void setSeqno(Integer seqno) {
		this.seqno = seqno;
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

	public Product getProditem() {
		return proditem;
	}

	public void setProditem(Product proditem) {
		this.proditem = proditem;
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
	};



}
