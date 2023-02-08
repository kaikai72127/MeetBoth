package springTeam5._05_teacStu.model;

import java.sql.Blob;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "student")
@Component
public class StudBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "STUDNO")
	private Integer studno;
	@Column(name = "MEMBERID")
	private Integer memberId;
	@Column(name = "TITLE")
	private String title;
	@Column(name = "POSTDATE")
	private Date postDate;
	@Column(name = "DETAIL")
	private String detail;
	@Column(name = "PRICE")
	private Double price;
	@Column(name = "SUBJECTITEM")
	private String subjectItem;
	@Column(name = "LEARNLOC")
	private String learnLoc;
	@Column(name = "CLASSPICTURE")
	private Blob classPicture;
	
	public StudBean() {
	}

	public StudBean(Integer studno, Integer memberId, String title, Date postDate, String detail, Double price,
			String subjectItem, String learnLoc, Blob classPicture) {
		this.studno = studno;
		this.memberId = memberId;
		this.title = title;
		this.postDate = postDate;
		this.detail = detail;
		this.price = price;
		this.subjectItem = subjectItem;
		this.learnLoc = learnLoc;
		this.classPicture = classPicture;
	}

	public Integer getStudno() {
		return studno;
	}

	public void setStudno(Integer studno) {
		this.studno = studno;
	}

	public Integer getmemberId() {
		return memberId;
	}

	public void setmemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getpostDate() {
		return postDate;
	}

	public void setpostDate(Date postDate) {
		this.postDate = postDate;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getsubjectItem() {
		return subjectItem;
	}

	public void setsubjectItem(String subjectItem) {
		this.subjectItem = subjectItem;
	}

	public String getlearnLoc() {
		return learnLoc;
	}

	public void setlearnLoc(String learnLoc) {
		this.learnLoc = learnLoc;
	}

	public Blob getclassPicture() {
		return classPicture;
	}

	public void setclassPicture(Blob classPicture) {
		this.classPicture = classPicture;
	}
}
