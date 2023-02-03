package springTeam5._06_halaAndQa.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="QA")
@Component
public class QaBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="QAID")
	private Integer qaid;
	
	@Column(name = "QACLASSNAME")
	private String qaclassname;
	
	@Column(name = "MEMBERID")
	private Integer memberid;
	
	@Column(name = "TITLE")
	private String title;
	
	@Column(name = "POSTDATE")
	private String postdate;
	
	@Column(name = "QACONTENT")
	private String qacontent;

	public QaBean() {
	}

	public QaBean(Integer qaid, String qaclassname, Integer memberid, String title, String postdate, String qacontent) {
		super();
		this.qaid = qaid;
		this.qaclassname = qaclassname;
		this.memberid = memberid;
		this.title = title;
		this.postdate = postdate;
		this.qacontent = qacontent;
	}

	public QaBean(String qaclassname, Integer memberid, String title, String postdate, String qacontent) {
		super();
		this.qaclassname = qaclassname;
		this.memberid = memberid;
		this.title = title;
		this.postdate = postdate;
		this.qacontent = qacontent;
	}

	public Integer getQaid() {
		return qaid;
	}

	public void setQaid(Integer qaid) {
		this.qaid = qaid;
	}

	public String getQaclassname() {
		return qaclassname;
	}

	public void setQaclassname(String qaclassname) {
		this.qaclassname = qaclassname;
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

	public String getPostdate() {
		return postdate;
	}

	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}

	public String getQacontent() {
		return qacontent;
	}

	public void setQacontent(String qacontent) {
		this.qacontent = qacontent;
	}

}