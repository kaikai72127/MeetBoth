package springTeam5._03_product.model;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

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
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "PRODUCT")
@Component
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PRODID")
	private int prodID;

	@Column(name = "PRODNAME")
	private String prodName;

	@Column(name = "PRODPRICE")
	private int prodPrice;

	@Column(name = "MEMBERID")
	private int memberID;

	@Column(name = "INVENTORY")
	private int inventory;

	@Column(name = "PRODPOST")
	private String prodPost;

	@Column(name = "PRODUPDATE")
	private String prodUpdate;

	@Column(name = "DIRECTIONS")
	private String directions;

	@Column(name = "PRODIMG")
	private Blob prodImg;

	@Column(name = "PRODSALES")
	private Integer prodSales;

	@Column(name = "PRODCHECK")
	private Integer prodCheck;

	@Column(name = "PRODCLASS")
	@Transient
	private int prodClass;

	@Column(name = "PRODSTATE")
	private String prodState;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "PRODCLASS")
	private ProdType prodtype;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product", cascade = CascadeType.ALL)
	private List<ProductComment> productComment = new ArrayList<ProductComment>();

	public Product() {
	}

	public Product(int prodID, String prodName, int prodPrice, int memberID, int inventory, String prodPost,
			String prodUpdate, String directions, Blob prodImg, Integer prodSales, Integer prodCheck, int prodClass,
			String prodState, ProdType prodtype, List<ProductComment> productComment) {
		super();
		this.prodID = prodID;
		this.prodName = prodName;
		this.prodPrice = prodPrice;
		this.memberID = memberID;
		this.inventory = inventory;
		this.prodPost = prodPost;
		this.prodUpdate = prodUpdate;
		this.directions = directions;
		this.prodImg = prodImg;
		this.prodSales = prodSales;
		this.prodCheck = prodCheck;
		this.prodClass = prodClass;
		this.prodState = prodState;
		this.prodtype = prodtype;
		this.productComment = productComment;
	}

	public String getProdState() {
		return prodState;
	}

	public void setProdState(String prodState) {
		this.prodState = prodState;
	}

	public Integer getProdCheck() {
		return prodCheck;
	}

	public void setProdCheck(Integer prodCheck) {
		this.prodCheck = prodCheck;
	}

	public Integer getProdSales() {
		return prodSales;
	}

	public void setProdSales(Integer prodSales) {
		this.prodSales = prodSales;
	}

	public int getProdID() {
		return prodID;
	}

	public void setProdID(int prodID) {
		this.prodID = prodID;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public int getProdPrice() {
		return prodPrice;
	}

	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}

	public int getMemberID() {
		return memberID;
	}

	public void setMemberID(int memberID) {
		this.memberID = memberID;
	}

	public int getInventory() {
		return inventory;
	}

	public void setInventory(int inventory) {
		this.inventory = inventory;
	}

	public String getProdPost() {
		return prodPost;
	}

	public void setProdPost(String prodPost) {
		this.prodPost = prodPost;
	}

	public String getProdUpdate() {
		return prodUpdate;
	}

	public void setProdUpdate(String prodUpdate) {
		this.prodUpdate = prodUpdate;
	}

	public String getDirections() {
		return directions;
	}

	public void setDirections(String directions) {
		this.directions = directions;
	}

	public Blob getProdImg() {
		return prodImg;
	}

	public void setProdImg(Blob prodImg) {
		this.prodImg = prodImg;
	}

	public int getProdClass() {
		return prodClass;
	}

	public void setProdClass(int prodClass) {
		this.prodClass = prodClass;
	}

	public ProdType getProdtype() {
		return prodtype;
	}

	public void setProdtype(ProdType prodtype) {
		this.prodtype = prodtype;
	}

	public List<ProductComment> getProductComment() {
		return productComment;
	}

	public void setProductComment(List<ProductComment> productComment) {
		this.productComment = productComment;
	}

	@Override
	public String toString() {
		return "Product [prodID=" + prodID + ", prodName=" + prodName + ", prodPrice=" + prodPrice + ", memberID="
				+ memberID + ", inventory=" + inventory + ", prodPost=" + prodPost + ", prodUpdate=" + prodUpdate
				+ ", directions=" + directions + ", prodImg=" + prodImg + ", prodSales=" + prodSales + ", prodCheck="
				+ prodCheck + ", prodClass=" + prodClass + ", prodtype=" + prodtype + ", productComment="
				+ productComment + "]";
	}
	
//	CREATE TABLE PRODUCT(
//			prodClass int foreign key references PRODTYPE(prodClass), --產品類別編號
//			prodID int not null IDENTITY (1,1) primary key, --產品編號
//			prodName nvarchar(30), --產品名稱
//			prodPrice decimal(8,2),--商品價格
//			memberID int not null, --會員編號(賣家)
//			inventory int not null, --商品庫存
//			prodPost datetime2(0) not null,--商品上架時間
//			prodUpdate datetime2(0) not null,--商品資訊最後更新時間
//			prodImg varbinary(max), --商品圖片
//			directions nvarchar(max), --商品介紹
//			prodSales int,-- 商品銷售額
//			prodCheck int, -- 商品瀏覽次數
//			prodState nvarchar --商品狀態
//			);


}
