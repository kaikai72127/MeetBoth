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
@Table(name="HALA")
@Component
public class HalaBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="HALAID")
	private Integer halaId;
	
	@Column(name = "HALACLASSNAME")
	private String halaclassname;
	
//	@Column(name = "MEMBERID")
//	private Integer memberid;
	
	@Column(name = "TITLE")
	private String title;
	
	@Column(name = "POSTDATE")
	private String postdate;
	
	@Column(name = "HALACONTENT")
	private String halacontent;
	
	@Column(name = "TUMB")
	private Integer tumb;
	
	@Column(name = "TUMBOFF")
	private Integer tumboff;
	
	@Column(name="WATCH")
	private Integer watch;
	
	@Column(name = "PICTURE")
	private Blob picture;
	
    @OneToMany(fetch = FetchType.LAZY,mappedBy = "hala",cascade = CascadeType.ALL)
    private List<ResponseHalaBean> responseHala;
    
    @OneToMany(fetch = FetchType.LAZY,mappedBy = "hala",cascade = CascadeType.ALL)
    private List<AnswerHalaBean> answerHala;
    
    @Column(name = "memberID")
    @Transient
    private Integer memberID;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="memberID")
    private MemberBean memberBean;
	

	public HalaBean() {
	}


	public HalaBean(String halaclassname, Integer memberid, String title, String postdate, String halacontent) {
		super();
		this.halaclassname = halaclassname;
		this.memberID = memberid;
		this.title = title;
		this.postdate = postdate;
		this.halacontent = halacontent;
	}


	public HalaBean(Integer halaid, String halaclassname, Integer memberid, String title, String postdate,
			String halacontent) {
		super();
		this.halaId = halaid;
		this.halaclassname = halaclassname;
		this.memberID = memberid;
		this.title = title;
		this.postdate = postdate;
		this.halacontent = halacontent;
	}







	public HalaBean(Integer halaId, String halaclassname, Integer memberid, String title, String postdate,
			String halacontent, Integer tumb, Integer tumboff, Blob picture) {
		super();
		this.halaId = halaId;
		this.halaclassname = halaclassname;
		this.memberID = memberid;
		this.title = title;
		this.postdate = postdate;
		this.halacontent = halacontent;
		this.tumb = tumb;
		this.tumboff = tumboff;
		this.picture = picture;
	}




	public List<AnswerHalaBean> getAnswerHala() {
		return answerHala;
	}


	public void setAnswerHala(List<AnswerHalaBean> answerHala) {
		this.answerHala = answerHala;
	}



	public HalaBean(String halaclassname, Integer memberid, String title, String postdate, String halacontent,
			Integer tumb, Integer tumboff, Integer watch, Blob picture, List<ResponseHalaBean> responseHala,
			List<AnswerHalaBean> answerHala) {
		super();
		this.halaclassname = halaclassname;
		this.memberID = memberid;
		this.title = title;
		this.postdate = postdate;
		this.halacontent = halacontent;
		this.tumb = tumb;
		this.tumboff = tumboff;
		this.watch = watch;
		this.picture = picture;
		this.responseHala = responseHala;
		this.answerHala = answerHala;
	}


	public HalaBean(Integer halaId, String halaclassname, Integer memberid, String title, String postdate,
			String halacontent, Integer tumb, Integer tumboff, Integer watch, Blob picture,
			List<ResponseHalaBean> responseHala, List<AnswerHalaBean> answerHala) {
		super();
		this.halaId = halaId;
		this.halaclassname = halaclassname;
		this.memberID = memberid;
		this.title = title;
		this.postdate = postdate;
		this.halacontent = halacontent;
		this.tumb = tumb;
		this.tumboff = tumboff;
		this.watch = watch;
		this.picture = picture;
		this.responseHala = responseHala;
		this.answerHala = answerHala;
	}


	public Integer getWatch() {
		return watch;
	}


	public void setWatch(Integer watch) {
		this.watch = watch;
	}


	public HalaBean(Integer halaId, String halaclassname, Integer memberid, String title, String postdate,
			String halacontent, Integer tumb, Integer tumboff, Blob picture, List<ResponseHalaBean> responseHala,
			List<AnswerHalaBean> answerHala) {
		super();
		this.halaId = halaId;
		this.halaclassname = halaclassname;
		this.memberID = memberid;
		this.title = title;
		this.postdate = postdate;
		this.halacontent = halacontent;
		this.tumb = tumb;
		this.tumboff = tumboff;
		this.picture = picture;
		this.responseHala = responseHala;
		this.answerHala = answerHala;
	}


	public HalaBean(String halaclassname, Integer memberid, String title, String postdate, String halacontent,
			Integer tumb, Integer tumboff, Blob picture, List<ResponseHalaBean> responseHala,
			List<AnswerHalaBean> answerHala) {
		super();
		this.halaclassname = halaclassname;
		this.memberID = memberid;
		this.title = title;
		this.postdate = postdate;
		this.halacontent = halacontent;
		this.tumb = tumb;
		this.tumboff = tumboff;
		this.picture = picture;
		this.responseHala = responseHala;
		this.answerHala = answerHala;
	}


	public List<ResponseHalaBean> getResponseHala() {
		return responseHala;
	}


	public void setResponseHala(List<ResponseHalaBean> responseHala) {
		this.responseHala = responseHala;
	}


	public void setHalaId(Integer halaId) {
		this.halaId = halaId;
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




	public Integer getHalaId() {
		return halaId;
	}


	public void setHalaid(Integer halaId) {
		this.halaId = halaId;
	}


	public String getHalaclassname() {
		return halaclassname;
	}


	public void setHalaclassname(String halaclassname) {
		this.halaclassname = halaclassname;
	}


	public Integer getMemberid() {
		return memberID;
	}


	public void setMemberid(Integer memberid) {
		this.memberID = memberid;
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