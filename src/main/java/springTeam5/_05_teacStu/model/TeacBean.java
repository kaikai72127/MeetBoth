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
@Table(name = "teacher")
@Component
public class TeacBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "TEACNO")
	private Integer teacno;
	@Column(name = "MEMBERID")
	private Integer memberid;
	@Column(name = "TITLE")
	private String title;
	@Column(name = "POSTDATE")
	private Date postdate;
	@Column(name = "DETAIL")
	private String detail;
	@Column(name = "PRICE")
	private Double price;
	@Column(name = "SUBJECTITEM")
	private String subjectitem;
	@Column(name = "CLASSPICTURE")
	private Blob classpicture;
	
	public TeacBean() {
	}
	
	public TeacBean(Integer teacno, Integer memberid, String title, Date postdate, String detail, Double price,
			String subjectitem, Blob classpicture) {
		this.teacno = teacno;
		this.memberid = memberid;
		this.title = title;
		this.postdate = postdate;
		this.detail = detail;
		this.price = price;
		this.subjectitem = subjectitem;
		this.classpicture = classpicture;
	}

	public Integer getTeacno() {
		return teacno;
	}

	public void setTeacno(Integer teacno) {
		this.teacno = teacno;
	}

	public Integer getMemberid() {
		return memberid;
	}

	public void setMemberid(Integer memberid) {
		this.memberid = memberid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getPostdate() {
		return postdate;
	}

	public void setPostdate(Date postdate) {
		this.postdate = postdate;
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

	public String getSubjectitem() {
		return subjectitem;
	}

	public void setSubjectitem(String subjectitem) {
		this.subjectitem = subjectitem;
	}

	public Blob getClasspicture() {
		return classpicture;
	}

	public void setClasspicture(Blob classpicture) {
		this.classpicture = classpicture;
	}
}
