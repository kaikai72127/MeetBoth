package springTeam5._01_member.model;

import java.io.Serializable;
import java.sql.Blob;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

import springTeam5._02_subLocation.model.Course;
import springTeam5._02_subLocation.model.CourseComment;
import springTeam5._02_subLocation.model.YtPlayer;
import springTeam5._03_product.model.Product;
import springTeam5._03_product.model.ProductComment;
import springTeam5._04_shoppingCart.model.OrderBean;
import springTeam5._04_shoppingCart.model.OrderItemBean;
import springTeam5._05_teacStu.model.StudBean;
import springTeam5._05_teacStu.model.TeacBean;



@Entity
@Table(name = "Member")
@Component
public class MemberBean implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "memberID")
	private int memberID;
	
	@Column(name = "account")
	private String account = "";
		
	@Column(name = "password")
	private String password = "";
		
	@Column(name = "idnumber")
	private String idNumber = "";
		
	@Column(name = "memname")
	private String memName = "";
		
	@Column(name = "memnickname")
	private String memNickName = "";
		
	@Column(name = "memold")
	private int memOld;
		
	@Column(name = "membirth")
	private String memBirth  = "";
	
	@Column(name = "memgender")
	private String memGender = "";
		
	@Column(name = "email")
	private String eMail = "";
		
	@Column(name = "phone")
	private String phone;
		
	@Column(name = "photo")
	private Blob photo = null;
		
	@Column(name = "address")
	private String address = "";
		
	@Column(name = "registime")
	private Date registime = new Date();

	@Column(name = "role")
	private String role = "user";
	
	@JsonIgnore
	@OneToMany(mappedBy = "member")
	private List<TeacBean> teacBean = new ArrayList<>();
	
	@JsonIgnore
	@OneToMany(mappedBy = "member")
	private List<StudBean> studBean = new ArrayList<>();
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "memberbuy",cascade = CascadeType.ALL)
	private Set<OrderBean> orderBuy = new LinkedHashSet<OrderBean>(); // itemsList
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "membersale",cascade = CascadeType.ALL)
	private Set<OrderItemBean> orderSale = new LinkedHashSet<OrderItemBean>(); // itemsList
	
//	連結商品
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "memberBean",cascade = CascadeType.ALL)
	private Set<Product> product = new LinkedHashSet<Product>();

	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "memberBean",cascade = CascadeType.ALL)
	private Set<ProductComment> productComment = new LinkedHashSet<ProductComment>();
//	連結商品 結束
	
//	連結課程
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "memberBean",cascade = CascadeType.ALL)
	private Set<Course> course = new LinkedHashSet<Course>();
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "memberBuyBean",cascade = CascadeType.ALL)
	private Set<Course> courseBuy = new LinkedHashSet<Course>();

	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "memberBean",cascade = CascadeType.ALL)
	private Set<CourseComment> courseComment = new LinkedHashSet<CourseComment>();
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "memberBean",cascade = CascadeType.ALL)
	private Set<YtPlayer> ytPlayer = new LinkedHashSet<YtPlayer>();
//	連結課程 結束
	
	
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
	public MemberBean() {
	}
	
//	public MemberBean(MemberBean member) {
//		this.memberID = member.getMemberID();
//		this.account = member.getAccount();
//		this.password = member.getPassword();
//		this.idNumber = member.getIdNumber();
//		this.memName = member.getMemName();
//		this.memNickName = member.getMemNickName();
//		this.memOld = member.getMemOld();
//		this.memBirth = member.getMemBirth();
//		this.memGender = member.getMemGender();
//		this.eMail = member.geteMail();
//		this.phone = member.getPhone();
//		this.photo = member.getPhoto();
//		this.address = member.getAddress();
//	}
//	public MemberBean(int memberID, String account, String password, String idNumber, String memName,
//			String memNickName, int memOld, String memBirth, String memGender, String eMail, String phone, Blob photo,
//			String address, Date registime) {
//		super();
//		this.memberID = memberID;
//		this.account = account;
//		this.password = password;
//		this.idNumber = idNumber;
//		this.memName = memName;
//		this.memNickName = memNickName;
//		this.memOld = memOld;
//		this.memBirth = memBirth;
//		this.memGender = memGender;
//		this.eMail = eMail;
//		this.phone = phone;
//		this.photo = photo;
//		this.address = address;
//		this.registime = registime;
//	}
//	public MemberBean(String account, String password, String idNumber, String memName, String memNickName, int memOld,
//			String memBirth, String memGender, String eMail, String phone, Blob photo, String address, Date registime) {
//		this.account = account;
//		this.password = password;
//		this.idNumber = idNumber;
//		this.memName = memName;
//		this.memNickName = memNickName;
//		this.memOld = memOld;
//		this.memBirth = memBirth;
//		this.memGender = memGender;
//		this.eMail = eMail;
//		this.phone = phone;
//		this.photo = photo;
//		this.address = address;
//		this.registime = registime;
//	}
//	

	public Set<Product> getProduct() {
		return product;
	}

	public void setProduct(Set<Product> product) {
		this.product = product;
	}

	public Set<ProductComment> getProductComment() {
		return productComment;
	}

	public void setProductComment(Set<ProductComment> productComment) {
		this.productComment = productComment;
	}
	
	public Set<Course> getCourse() {
		return course;
	}

	public void setCourse(Set<Course> course) {
		this.course = course;
	}

	public Set<CourseComment> getCourseComment() {
		return courseComment;
	}

	public void setCourseComment(Set<CourseComment> courseComment) {
		this.courseComment = courseComment;
	}

	public int getMemberID() {
		return memberID;
	}

	public void setMemberID(int memberID) {
		this.memberID = memberID;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemNickName() {
		return memNickName;
	}

	public void setMemNickName(String memNickName) {
		this.memNickName = memNickName;
	}

	public int getMemOld() {
		return memOld;
	}

	public void setMemOld(int memOld) {
		this.memOld = memOld;
	}

	public String getMemBirth() {
		return memBirth;
	}

	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}

	public String getMemGender() {
		return memGender;
	}

	public void setMemGender(String memGender) {
		this.memGender = memGender;
	}

	public String geteMail() {
		return eMail;
	}

	public void seteMail(String eMail) {
		this.eMail = eMail;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Blob getPhoto() {
		return photo;
	}

	public void setPhoto(Blob photo) {
		this.photo = photo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRegistime() {
		return new SimpleDateFormat("YYYY/MM/dd").format(registime);
	}

	public void setRegistime(Date date) {
		this.registime = date;
	}
	
	public List<TeacBean> getTeacBean() {
		return teacBean;
	}

	public void setTeacBean(List<TeacBean> teacBean) {
		this.teacBean = teacBean;
	}

	public Set<OrderBean> getOrderBuy() {
		return orderBuy;
	}

	public void setOrderBuy(Set<OrderBean> orderBuy) {
		this.orderBuy = orderBuy;
	}

	public Set<OrderItemBean> getOrderSale() {
		return orderSale;
	}

	public void setOrderSale(Set<OrderItemBean> orderSale) {
		this.orderSale = orderSale;
	}
	@Override
	public String toString() {
		return "MemberBean [memberID=" + memberID + ", account=" + account + ", password=" + password + ", idNumber="
				+ idNumber + ", memName=" + memName + ", memNickName=" + memNickName + ", memOld=" + memOld
				+ ", memBirth=" + memBirth + ", memGender=" + memGender + ", eMail=" + eMail + ", phone=" + phone
				+ ", address=" + address + ", registime=" + new SimpleDateFormat("YYYY/MM/dd").format(registime) + "]";
	}

}
