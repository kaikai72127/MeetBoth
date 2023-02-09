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

@Entity
@Table(name = "RESPONSEANSWER")
@Component
public class ResponseAnswerBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="RESPONSEANSWERID")
	private Integer responseAnswerId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ANSWERID")
	private AnswerHalaBean answerHala;
	
	@Column(name="ANSWERID")
	@Transient
	private Integer answerId;
	
	@Column(name="MEMBERID")
	private Integer memberId;
	
	@Column(name="RESPONSEANSWERDATE")
	private String responseAnswerDate;
	
	@Column(name="RESPONSEANSWERCONTENT")
	private String responseAnswerContent;
	
	@Column(name="TUMB")
	private Integer tumb;
	
	@Column(name="TUMBOFF")
	private Integer tumbOff;
	
	@Column(name="PICTURE")
	private Blob picture;
	
	
	
	
	
    public ResponseAnswerBean() {
    	
    }


	public Integer getResponseAnswerId() {
		return responseAnswerId;
	}

	public void setResponseAnswerId(Integer responseAnswerId) {
		this.responseAnswerId = responseAnswerId;
	}

	

	

	public Integer getAnswerId() {
		return answerId;
	}

	public void setAnswerId(Integer answerId) {
		this.answerId = answerId;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public String getResponseAnswerDate() {
		return responseAnswerDate;
	}

	public void setResponseAnswerDate(String responseAnswerDate) {
		this.responseAnswerDate = responseAnswerDate;
	}

	public String getResponseAnswerContent() {
		return responseAnswerContent;
	}

	public void setResponseAnswerContent(String responseAnswerContent) {
		this.responseAnswerContent = responseAnswerContent;
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

	public AnswerHalaBean getAnswerHalaBean() {
		return answerHala;
	}

	public void setAnswerHalaBean(AnswerHalaBean answerHalaBean) {
		this.answerHala = answerHalaBean;
	}

	public ResponseAnswerBean(Integer responseAnswerId, AnswerHalaBean answerHala, Integer answerId,
			Integer memberId, String responseAnswerDate, String responseAnswerContent, Integer tumb, Integer tumbOff,
			Blob picture) {
		super();
		this.responseAnswerId = responseAnswerId;
		this.answerHala = answerHala;
		this.answerId = answerId;
		this.memberId = memberId;
		this.responseAnswerDate = responseAnswerDate;
		this.responseAnswerContent = responseAnswerContent;
		this.tumb = tumb;
		this.tumbOff = tumbOff;
		this.picture = picture;
	}
	
	

}
