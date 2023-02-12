package springTeam5._05_teacStu.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import springTeam5._01_member.model.MemberBean;

@Entity
@Table(name = "student")
@Component
public class StudBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "STUDNO")
	private Integer studno;
<<<<<<< HEAD
	@Column(name = "UPDATEDATE")
	private String updateDate;
	@Column(name = "EDUCALIMIT")
	private String educaLimit;
	@Column(name = "STUDLOC")
	private String studLoc;
	@Column(name = "OBJECT")
	private String object;
	@Column(name = "CLASSMODE")
	private String classMode;
	@Column(name = "TESTTEACMODE")
	private String testTeacMode;
	@Column(name = "STUDTIME")
	private String studTime;
	@Column(name = "CONMETHOD")
	private String conMethod;
	@Column(name = "CONTIME")
	private String conTime;
=======
	@Column(name = "MEMBERID")
	private Integer memberId;
	@Column(name = "TITLE")
	private String title;
	@Column(name = "POSTDATE")
	private Date postDate;
	@Column(name = "DETAIL")
	private String detail;
>>>>>>> origin/_01_Seal
	@Column(name = "PRICE")
	private Double price;
	@Column(name = "SUBJECTITEM")
	private String subjectItem;
<<<<<<< HEAD
	@Column(name = "TEXTBOOK")
	private String textBook;
	@Column(name = "STARTDATE")
	private String startDate;
	@Column(name = "PERIOD")
	private String period;
	@Column(name = "VIEWS")
	private Integer views;
	@ManyToOne
	@JoinColumn(name = "MEMBERID")
	private MemberBean member;
=======
	@Column(name = "LEARNLOC")
	private String learnLoc;
	@Column(name = "CLASSPICTURE")
	private Blob classPicture;
>>>>>>> origin/_01_Seal
	
	public StudBean() {
	}

<<<<<<< HEAD
	public StudBean(Integer studno, String updateDate, String educaLimit, String studLoc, String object,
			String classMode, String testTeacMode, String studTime, String conMethod, String conTime, Double price,
			String subjectItem, String textBook, String startDate, String period, Integer views, MemberBean member) {
		this.studno = studno;
		this.updateDate = updateDate;
		this.educaLimit = educaLimit;
		this.studLoc = studLoc;
		this.object = object;
		this.classMode = classMode;
		this.testTeacMode = testTeacMode;
		this.studTime = studTime;
		this.conMethod = conMethod;
		this.conTime = conTime;
		this.price = price;
		this.subjectItem = subjectItem;
		this.textBook = textBook;
		this.startDate = startDate;
		this.period = period;
		this.views = views;
		this.member = member;
=======
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
>>>>>>> origin/_01_Seal
	}

	public Integer getStudno() {
		return studno;
	}

	public void setStudno(Integer studno) {
		this.studno = studno;
	}

<<<<<<< HEAD
	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
=======
	public Integer getmemberId() {
		return memberId;
	}

	public void setmemberId(Integer memberId) {
		this.memberId = memberId;
>>>>>>> origin/_01_Seal
	}

	public String getEducaLimit() {
		return educaLimit;
	}

	public void setEducaLimit(String educaLimit) {
		this.educaLimit = educaLimit;
	}

<<<<<<< HEAD
	public String getStudLoc() {
		return studLoc;
	}

	public void setStudLoc(String studLoc) {
		this.studLoc = studLoc;
=======
	public Date getpostDate() {
		return postDate;
	}

	public void setpostDate(Date postDate) {
		this.postDate = postDate;
>>>>>>> origin/_01_Seal
	}

	public String getObject() {
		return object;
	}

	public void setObject(String object) {
		this.object = object;
	}

	public String getClassMode() {
		return classMode;
	}

	public void setClassMode(String classMode) {
		this.classMode = classMode;
	}

	public String getTestTeacMode() {
		return testTeacMode;
	}

	public void setTestTeacMode(String testTeacMode) {
		this.testTeacMode = testTeacMode;
	}

	public String getStudTime() {
		return studTime;
	}

	public void setStudTime(String studTime) {
		this.studTime = studTime;
	}

	public String getConMethod() {
		return conMethod;
	}

	public void setConMethod(String conMethod) {
		this.conMethod = conMethod;
	}

	public String getConTime() {
		return conTime;
	}

	public void setConTime(String conTime) {
		this.conTime = conTime;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

<<<<<<< HEAD
	public String getSubjectItem() {
		return subjectItem;
	}

	public void setSubjectItem(String subjectItem) {
		this.subjectItem = subjectItem;
	}

	public String getTextBook() {
		return textBook;
	}

	public void setTextBook(String textBook) {
		this.textBook = textBook;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public Integer getViews() {
		return views;
	}

	public void setViews(Integer views) {
		this.views = views;
	}

	public MemberBean getMember() {
		return member;
	}

	public void setMember(MemberBean member) {
		this.member = member;
=======
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
>>>>>>> origin/_01_Seal
	}
}
