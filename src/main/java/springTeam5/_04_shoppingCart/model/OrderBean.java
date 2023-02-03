package springTeam5._04_shoppingCart.model;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name = "memberorder")
@Component
public class OrderBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ORDERNO")
	private Integer orderNo; // 訂單編號
	@Column(name = "MEMBERID")
	private String memberId; // 會員編號
	@Column(name = "ORDERDATE")
	private String orderDate; // 訂單日期
	@Column(name = "UPORDERDATE")
	private String uporderDate; // 更新日期
	@Column(name = "SHIPPINGADDRESS")
	private String shippingAddress; // 收件地址
	@Column(name = "ORDSTSTUS")
	private String ordStstus ="處理中"; // 訂單狀態 處理中(預設)/備貨中/已完成
	@Column(name = "PAYMENTSTSTUS")
	private String paymentStstus = "未付款"; // 付款狀態 未付款(預設)/已付款/退款中/已退款
	@Column(name = "DELIVERYSTSTUS")
	private String deliveryStstus ="無"; // 送貨狀態 無/備貨中/已發貨/已取貨/退貨中/已退貨
	@Column(name = "TOTALAMOUNT")
	private Integer totalAmount = 0; // 總金額 0處理中(預設)
//	private String cancelTag; // 取消
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "orderbean",cascade = CascadeType.ALL)
	@OrderBy("seqno desc") //拿資料的順序自己決定用,增加下一個排序
	private Set<OrderItemBean> items = new LinkedHashSet<OrderItemBean>(); // itemsList

	
	//新增有ID
	public OrderBean(Integer orderNo, String memberId, String orderDate, String uporderDate, String shippingAddress,
			String ordStstus, String paymentStstus, String deliveryStstus, Integer totalAmount,
			Set<OrderItemBean> items) {
		this.memberId = memberId;
		this.orderDate = orderDate;
		this.uporderDate = uporderDate;
		this.shippingAddress = shippingAddress;
		this.ordStstus = ordStstus;
		this.paymentStstus = paymentStstus;
		this.deliveryStstus = deliveryStstus;
		this.totalAmount = totalAmount;
		this.items = items;
	}

	
	//修改沒有ID
	public OrderBean( String memberId, String orderDate, String uporderDate, String shippingAddress,
			String ordStstus, String paymentStstus, String deliveryStstus, Integer totalAmount,
			Set<OrderItemBean> items) {
		this.memberId = memberId;
		this.orderDate = orderDate;
		this.uporderDate = uporderDate;
		this.shippingAddress = shippingAddress;
		this.ordStstus = ordStstus;
		this.paymentStstus = paymentStstus;
		this.deliveryStstus = deliveryStstus;
		this.totalAmount = totalAmount;
		this.items = items;
	}

	public OrderBean() {

	}
	
	public Integer getOrderNo() {
		return orderNo;
	}


	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public String getOrderDate() {
		return orderDate;
	}


	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}


	public String getUporderDate() {
		return uporderDate;
	}


	public void setUporderDate(String uporderDate) {
		this.uporderDate = uporderDate;
	}


	public String getShippingAddress() {
		return shippingAddress;
	}


	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}


	public String getOrdStstus() {
		return ordStstus;
	}


	public void setOrdStstus(String ordStstus) {
		this.ordStstus = ordStstus;
	}


	public String getPaymentStstus() {
		return paymentStstus;
	}


	public void setPaymentStstus(String paymentStstus) {
		this.paymentStstus = paymentStstus;
	}


	public String getDeliveryStstus() {
		return deliveryStstus;
	}


	public void setDeliveryStstus(String deliveryStstus) {
		this.deliveryStstus = deliveryStstus;
	}


	public Integer getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(Integer totalAmount) {
		this.totalAmount = totalAmount;
	}

	public void setTotalAmount() {
		this.totalAmount = 0;
	}


	public Set<OrderItemBean> getItems() {
		return items;
	}


	public void setItems(Set<OrderItemBean> items) {
		this.items = items;
	}


	@Override
	public String toString() {
		return "OrderBean [orderNo=" + orderNo + ", memberId=" + memberId + ", orderdate=" + orderDate
				+ ", uporderDate=" + uporderDate + ", shippingAddress=" + shippingAddress + ", ordStstus=" + ordStstus
				+ ", paymentStstus=" + paymentStstus + ", deliveryStstus=" + deliveryStstus + ", totalAmount="
				+ totalAmount + "]";
	}

}
	