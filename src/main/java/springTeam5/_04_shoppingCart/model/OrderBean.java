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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import springTeam5._01_member.model.MemberBean;

@Entity @Table(name = "memberorder")
@Component
public class OrderBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ORDERNO")
	private Integer orderNo; // 訂單編號
	
	@ManyToOne
	@JoinColumn(name = "MEMBERBUY_FK")
	private MemberBean memberbuy;
	@Column(name = "MEMBERBUY")
	@Transient
	private Integer memberBuyId; // 買家會員編號
	
	@ManyToOne
	@JoinColumn(name = "MEMBERSALE_FK")
	private MemberBean membersale;
	@Column(name = "MEMBERSALE")
	@Transient
	private Integer memberSaleId; // 賣家會員編號
	
	@Column(name = "ORDERDATE")
	private String orderDate; // 訂單日期
	@Column(name = "UPORDERDATE")
	private String uporderDate; // 更新日期
	@Column(name = "SHIPPING_NAME")
	private String shippingName; // 收件人姓名
	@Column(name = "SHIPPING_PHONE")
	private String shippingPhone; // 收件人電話
	@Column(name = "SHIPPING_ADDRESS")
	private String shippingAddress; // 收件地址
	@Column(name = "ORDSTSTUS")
	
	//狀態
	private String ordStstus ="處理中"; // 訂單狀態 處理中(預設)/備貨中/已完成/取消
	@Column(name = "PAYMENTSTSTUS")
	private String paymentStstus = "未付款"; // 付款狀態 未付款(預設)/已付款/退款中/已退款
	@Column(name = "DELIVERYSTSTUS")
	private String deliveryStstus ="無"; // 送貨狀態 無(預設)/備貨中/已發貨/已取貨/退貨中/已退貨
	@Column(name = "PAYMENTMETHOD")
	private String paymentMethod; //付款方式 貨到付款/信用卡/轉帳
	
	@ManyToOne
	@JoinColumn(name = "DISCOUNTID_FK")
	private Discount discount;
	@Transient
	@Column(name = "DISCOUNTID")
	private Integer discountId; //折扣碼
	
	
	@Column(name = "TOTALAMOUNT")
	private Integer totalAmount;  //總金額
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "orderbean",cascade = CascadeType.ALL)
	@OrderBy("seqno desc") //拿資料的順序自己決定用,增加下一個排序
	private Set<OrderItemBean> items = new LinkedHashSet<OrderItemBean>(); // itemsList
//	private List<OrderItemBean> items; // itemsList

	public OrderBean() {

	}
	//新增有ID
	public OrderBean(Integer orderNo, MemberBean memberbuy, Integer memberBuyId, MemberBean membersale,
			Integer memberSaleId, String orderDate, String uporderDate, String shippingName, String shippingPhone,
		String shippingAddress, String ordStstus, String paymentStstus, String deliveryStstus,
		String paymentMethod, Discount discount, Integer discountId, Integer totalAmount,
		Set<OrderItemBean> items) {
	this.orderNo = orderNo;
	this.memberbuy = memberbuy;
	this.memberBuyId = memberBuyId;
	this.membersale = membersale;
	this.memberSaleId = memberSaleId;
	this.orderDate = orderDate;
	this.uporderDate = uporderDate;
	this.shippingName = shippingName;
	this.shippingPhone = shippingPhone;
	this.shippingAddress = shippingAddress;
	this.ordStstus = ordStstus;
	this.paymentStstus = paymentStstus;
	this.deliveryStstus = deliveryStstus;
	this.paymentMethod = paymentMethod;
	this.discount = discount;
	this.discountId = discountId;
	this.totalAmount = totalAmount;
	this.items = items;
}

	public OrderBean(MemberBean memberbuy, Integer memberBuyId, MemberBean membersale, Integer memberSaleId,
			String orderDate, String uporderDate, String shippingName, String shippingPhone, String shippingAddress,
			String ordStstus, String paymentStstus, String deliveryStstus, String paymentMethod,
			Discount discount, Integer discountId, Integer totalAmount, Set<OrderItemBean> items) {
		super();
		this.memberbuy = memberbuy;
		this.memberBuyId = memberBuyId;
		this.membersale = membersale;
		this.memberSaleId = memberSaleId;
		this.orderDate = orderDate;
		this.uporderDate = uporderDate;
		this.shippingName = shippingName;
		this.shippingPhone = shippingPhone;
		this.shippingAddress = shippingAddress;
		this.ordStstus = ordStstus;
		this.paymentStstus = paymentStstus;
		this.deliveryStstus = deliveryStstus;
		this.paymentMethod = paymentMethod;
		this.discount = discount;
		this.discountId = discountId;
		this.totalAmount = totalAmount;
		this.items = items;
	}

	public Integer getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	public MemberBean getMemberbuy() {
		return memberbuy;
	}

	public void setMemberbuy(MemberBean memberbuy) {
		this.memberbuy = memberbuy;
	}

	public Integer getMemberBuyId() {
		return memberBuyId;
	}

	public void setMemberBuyId(Integer memberBuyId) {
		this.memberBuyId = memberBuyId;
	}

	public MemberBean getMembersale() {
		return membersale;
	}

	public void setMembersale(MemberBean membersale) {
		this.membersale = membersale;
	}

	public Integer getMemberSaleId() {
		return memberSaleId;
	}

	public void setMemberSaleId(Integer memberSaleId) {
		this.memberSaleId = memberSaleId;
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

	public String getShippingName() {
		return shippingName;
	}

	public void setShippingName(String shippingName) {
		this.shippingName = shippingName;
	}

	public String getShippingPhone() {
		return shippingPhone;
	}

	public void setShippingPhone(String shippingPhone) {
		this.shippingPhone = shippingPhone;
	}

	public String getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(String shoppingAddress) {
		this.shippingAddress = shoppingAddress;
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

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public Discount getDiscount() {
		return discount;
	}

	public void setDiscount(Discount discount) {
		this.discount = discount;
	}

	public Integer getDiscountId() {
		return discountId;
	}

	public void setDiscountId(Integer discountId) {
		this.discountId = discountId;
	}

	public Integer getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(Integer totalAmount) {
		this.totalAmount = totalAmount;
	}

	public Set<OrderItemBean> getItems() {
		return items;
	}

	public void setItems(Set<OrderItemBean> items) {
		this.items = items;
	}

	


}
	