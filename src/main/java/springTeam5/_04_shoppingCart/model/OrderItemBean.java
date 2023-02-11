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

import springTeam5._01_member.model.MemberBean;
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

	@ManyToOne
	@JoinColumn(name = "MEMBERSALE_FK") // 賣家會員編號
	private MemberBean membersale;

	@ManyToOne
	@JoinColumn(name = "PRODUTID_FK")
	private Product prodItem;// 商品編號

	@Column(name = "QTY")
	private Integer qty; // 數量

	@Column(name = "ITEMTOTAL")
	private Integer itemTotal; // 總金額

	// 新增有ID

	public OrderItemBean(Integer seqno, OrderBean orderbean, MemberBean membersale, Product prodItem, Integer qty,
			Integer itemTotal) {
		this.seqno = seqno;
		this.orderbean = orderbean;
		this.membersale = membersale;
		this.prodItem = prodItem;
		this.qty = qty;
		this.itemTotal = itemTotal;
	}

	// 修改沒有ID

	public OrderItemBean(OrderBean orderbean, MemberBean membersale, Product prodItem, Integer qty, Integer itemTotal) {
		this.orderbean = orderbean;
		this.membersale = membersale;
		this.prodItem = prodItem;
		this.qty = qty;
		this.itemTotal = itemTotal;
	}

	public OrderItemBean() {

	}

	// Getter Setter
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

	public MemberBean getMembersale() {
		return membersale;
	}

	public void setMembersale(MemberBean membersale) {
		this.membersale = membersale;
	}

	public Product getProdItem() {
		return prodItem;
	}

	public void setProdItem(Product prodItem) {
		this.prodItem = prodItem;
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

}
