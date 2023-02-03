package springTeam5._06_halaAndQa.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="HALA")
@Component
public class HalaBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="HALAID")
	private Integer halaid;
	
	@Column(name = "HALACLASSNAME")
	private String halaclassname;
	
	@Column(name = "MEMBERID")
	private Integer memberid;
	
	@Column(name = "TITLE")
	private String title;
	
	@Column(name = "POSTDATE")
	private String postdate;
	
	@Column(name = "HALACONTENT")
	private String halacontent;
	

	public HalaBean() {
	}


	public HalaBean(String halaclassname, Integer memberid, String title, String postdate, String halacontent) {
		super();
		this.halaclassname = halaclassname;
		this.memberid = memberid;
		this.title = title;
		this.postdate = postdate;
		this.halacontent = halacontent;
	}


	public HalaBean(Integer halaid, String halaclassname, Integer memberid, String title, String postdate,
			String halacontent) {
		super();
		this.halaid = halaid;
		this.halaclassname = halaclassname;
		this.memberid = memberid;
		this.title = title;
		this.postdate = postdate;
		this.halacontent = halacontent;
	}


	public Integer getHalaid() {
		return halaid;
	}


	public void setHalaid(Integer halaid) {
		this.halaid = halaid;
	}


	public String getHalaclassname() {
		return halaclassname;
	}


	public void setHalaclassname(String halaclassname) {
		this.halaclassname = halaclassname;
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


	public String getHalacontent() {
		return halacontent;
	}


	public void setHalacontent(String halacontent) {
		this.halacontent = halacontent;
	}


}