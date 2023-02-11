package springTeam5._06_halaAndQa.model;

import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import springTeam5._01_member.model.MemberBean;

@Entity
@Table(name = "RESPONSEHALA")
@Component
public class ResponseHalaBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "RESPONSEHALAID")
	private Integer responseHalaId;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "HALAID")
	private HalaBean hala;

	@Column(name = "HALAID")
	@Transient
	private Integer halaId;

	@Column(name = "memberID")
	@Transient
	private Integer memberID;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="memberID")
	private MemberBean memberBean;

	@Column(name = "RESPONSEHALADATE")
	private String responseHalaPostDate;

	@Column(name = "RESPONSEHALACONTENT")
	private String responseHalaContent;

	@Column(name = "TUMB")
	private Integer tumb;

	@Column(name = "TUMBOFF")
	private Integer tumboff;

	@Column(name = "PICTURE")
	private Blob picture;

	public ResponseHalaBean() {

	}

	public ResponseHalaBean(Integer responseHalaId, Integer halaId, Integer memberID, String responseHalaPostDate,
			String responseHalaContent, Integer tumb, Integer tumboff, Blob picture) {
		super();
		this.responseHalaId = responseHalaId;
		this.halaId = halaId;
		this.memberID = memberID;
		this.responseHalaPostDate = responseHalaPostDate;
		this.responseHalaContent = responseHalaContent;
		this.tumb = tumb;
		this.tumboff = tumboff;
		this.picture = picture;
	}

	public HalaBean getHala() {
		return hala;
	}

	public void setHala(HalaBean hala) {
		this.hala = hala;
	}

	public Integer getMemberID() {
		return memberID;
	}

	public void setMemberID(Integer memberID) {
		this.memberID = memberID;
	}

	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

	public ResponseHalaBean(Integer responseHalaId, HalaBean hala, Integer halaId, Integer memberID,
			MemberBean memberBean, String responseHalaPostDate, String responseHalaContent, Integer tumb,
			Integer tumboff, Blob picture) {
		super();
		this.responseHalaId = responseHalaId;
		this.hala = hala;
		this.halaId = halaId;
		this.memberID = memberID;
		this.memberBean = memberBean;
		this.responseHalaPostDate = responseHalaPostDate;
		this.responseHalaContent = responseHalaContent;
		this.tumb = tumb;
		this.tumboff = tumboff;
		this.picture = picture;
	}

	public ResponseHalaBean(Integer responseHalaId, HalaBean hala, Integer halaId, Integer memberID,
			String responseHalaPostDate, String responseHalaContent, Integer tumb, Integer tumboff, Blob picture) {
		super();
		this.responseHalaId = responseHalaId;
		this.hala = hala;
		this.halaId = halaId;
		this.memberID = memberID;
		this.responseHalaPostDate = responseHalaPostDate;
		this.responseHalaContent = responseHalaContent;
		this.tumb = tumb;
		this.tumboff = tumboff;
		this.picture = picture;
	}

	public Integer getResponseHalaId() {
		return responseHalaId;
	}

	public void setResponseHalaId(Integer responseHalaId) {
		this.responseHalaId = responseHalaId;
	}

	public Integer getHalaId() {
		return halaId;
	}

	public void setHalaId(Integer halaId) {
		this.halaId = halaId;
	}

	public Integer getmemberID() {
		return memberID;
	}

	public void setmemberID(Integer memberID) {
		this.memberID = memberID;
	}

	public String getResponseHalaPostDate() {
		return responseHalaPostDate;
	}

	public void setResponseHalaPostDate(String responseHalaPostDate) {
		 this.responseHalaPostDate=responseHalaPostDate;
	}

	public String getResponseHalaContent() {
		return responseHalaContent;
	}

	public void setResponseHalaContent(String responseHalaContent) {
		this.responseHalaContent = responseHalaContent;
	}

	public Integer getTumb() {
		return tumb;
	}

	public void setTumb(Integer tumb) {
		this.tumb = tumb;
	}

	public Integer getTumboff() {
		return tumboff;
	}

	public void setTumboff(Integer tumboff) {
		this.tumboff = tumboff;
	}

	public Blob getPicture() {
		return picture;
	}

	public void setPicture(Blob picture) {
		this.picture = picture;
	}

}
