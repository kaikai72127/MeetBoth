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
	@Column(name = "LEARNLOC")
	private String learnloc;
	@Column(name = "CLASSPICTURE")
	private Blob classpicture;
	
	public StudBean() {
	}

	public StudBean(Integer studno, Integer memberid, String title, Date postdate, String detail, Double price,
			String subjectitem, String learnloc, Blob classpicture) {
		this.studno = studno;
		this.memberid = memberid;
		this.title = title;
		this.postdate = postdate;
		this.detail = detail;
		this.price = price;
		this.subjectitem = subjectitem;
		this.learnloc = learnloc;
		this.classpicture = classpicture;
	}

	public Integer getStudno() {
		return studno;
	}

	public void setStudno(Integer studno) {
		this.studno = studno;
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

	public String getLearnloc() {
		return learnloc;
	}

	public void setLearnloc(String learnloc) {
		this.learnloc = learnloc;
	}

	public Blob getClasspicture() {
		return classpicture;
	}

	public void setClasspicture(Blob classpicture) {
		this.classpicture = classpicture;
	}
}
