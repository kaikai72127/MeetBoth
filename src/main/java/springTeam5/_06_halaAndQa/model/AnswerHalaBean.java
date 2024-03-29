package springTeam5._06_halaAndQa.model;

import java.sql.Blob;
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

import springTeam5._01_member.model.MemberBean;

@Entity
@Table(name="ANSWERHALA")
@Component
public class AnswerHalaBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ANSWERID")
	private Integer answerId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "HALAID")
	private HalaBean hala;
	
	@Column(name="HALAID")
	@Transient
	private Integer halaId;
	
	@Column(name="memberID")
	@Transient
	private Integer memberID;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="memberID")
	private MemberBean memberBean;
	
	@Column(name="ANSWERDATE")
	private String answerDate;
	
	@Column(name="ANSWERCONTENT")
	private String answerContent;
	
	@Column(name="TUMB")
	private Integer tumb;
	
	@Column(name="TUMBOFF")
	private Integer tumbOff;
	
	@Column(name="PICTURE")
	private Blob picture;
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "answerHala",cascade = CascadeType.ALL)
	private List<ResponseAnswerBean> responseAnswerBean;
	
	
	
	
	public AnswerHalaBean(Integer answerId, HalaBean hala, Integer halaId, Integer memberID, MemberBean memberBean,
			String answerDate, String answerContent, Integer tumb, Integer tumbOff, Blob picture,
			List<ResponseAnswerBean> responseAnswerBean) {
		super();
		this.answerId = answerId;
		this.hala = hala;
		this.halaId = halaId;
		this.memberID = memberID;
		this.memberBean = memberBean;
		this.answerDate = answerDate;
		this.answerContent = answerContent;
		this.tumb = tumb;
		this.tumbOff = tumbOff;
		this.picture = picture;
		this.responseAnswerBean = responseAnswerBean;
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



	public AnswerHalaBean() {
		
	}
	


	public HalaBean getHala() {
		return hala;
	}



	public void setHala(HalaBean hala) {
		this.hala = hala;
	}



	public List<ResponseAnswerBean> getResponseAnswerBean() {
		return responseAnswerBean;
	}



	public void setResponseAnswerBean(List<ResponseAnswerBean> responseAnswerBean) {
		this.responseAnswerBean = responseAnswerBean;
	}



	public AnswerHalaBean(Integer answerId, HalaBean hala, Integer halaId, Integer memberID, String answerDate,
			String answerContent, Integer tumb, Integer tumbOff, Blob picture,
			List<ResponseAnswerBean> responseAnswerBean) {
		super();
		this.answerId = answerId;
		this.hala = hala;
		this.halaId = halaId;
		this.memberID = memberID;
		this.answerDate = answerDate;
		this.answerContent = answerContent;
		this.tumb = tumb;
		this.tumbOff = tumbOff;
		this.picture = picture;
		this.responseAnswerBean = responseAnswerBean;
	}



	public Integer getAnswerId() {
		return answerId;
	}

	public void setAnswerId(Integer answerId) {
		this.answerId = answerId;
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

	public String getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(String answerDate) {
		this.answerDate = answerDate;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public Integer getTumb() {
		return tumb;
	}

	public void setTumb(Integer tumb) {
		this.tumb = tumb;
	}

	public Integer getTumbOff() {
		return tumbOff;
	}

	public void setTumbOff(Integer tumbOff) {
		this.tumbOff = tumbOff;
	}

	public Blob getPicture() {
		return picture;
	}

	public void setPicture(Blob picture) {
		this.picture = picture;
	}

	public List<ResponseAnswerBean> getResponseAnswerBeans() {
		return responseAnswerBean;
	}

	public void setResponseAnswerBeans(List<ResponseAnswerBean> responseAnswerBean) {
		this.responseAnswerBean = responseAnswerBean;
	} 
	
	
}
