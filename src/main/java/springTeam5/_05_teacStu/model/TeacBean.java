package springTeam5._05_teacStu.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

import springTeam5._01_member.model.MemberBean;

@Entity
@Table(name = "teacher")
@Component
public class TeacBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "TEACNO")
	private Integer teacno;
	@Column(name = "UPDATEDATE")
	private String updateDate;
	@Column(name = "HIGHEDU")
	private String highEdu;
	@Column(name = "STUDEXP")
	private String studExp;
	@Column(name = "TUTOREXP")
	private String tutorExp;
	@Column(name = "TEACLOC")
	private String teacLoc;
	@Column(name = "TEACOBJECT")
	private String teacObject;
	@Column(name = "CLASSMODE")
	private String classMode;
	@Column(name = "WILLTEAC")
	private String willTeac;
	@Column(name = "TEACTIME")
	private String teacTime;
	@Column(name = "SKILLS")
	private String skills;
	@Column(name = "CONMETHOD")
	private String conMethod;
	@Column(name = "CONTIME")
	private String conTime;
	@Column(name = "PRICE")
	private Double price;
	@Column(name = "SUBJECTITEM")
	private String subjectItem;
	@Column(name = "LANABILITY")
	private String lanAbility;
	@Column(name = "VIEWS")
	private Integer views;
	@Transient
	private Integer goal;
	
	@JsonIgnore
	@OneToMany(mappedBy = "teacher")
	private List<ReplyTeac> replyTeacs = new ArrayList<>();
	
	@ManyToOne
	@JoinColumn(name = "MEMBERID")
	private MemberBean member;
	
	public TeacBean() {
	}

	public TeacBean(Integer teacno, String updateDate, String highEdu, String studExp,
			String tutorExp, String teacLoc, String teacObject, String classMode, String willTeac, String teacTime,
			String skills, String conMethod, String conTime, Double price, String subjectItem, String lanAbility,
			Integer views, List<ReplyTeac> replyTeacs, MemberBean member, Integer goal) {
		this.teacno = teacno;
		this.updateDate = updateDate;
		this.highEdu = highEdu;
		this.studExp = studExp;
		this.tutorExp = tutorExp;
		this.teacLoc = teacLoc;
		this.teacObject = teacObject;
		this.classMode = classMode;
		this.willTeac = willTeac;
		this.teacTime = teacTime;
		this.skills = skills;
		this.conMethod = conMethod;
		this.conTime = conTime;
		this.price = price;
		this.subjectItem = subjectItem;
		this.lanAbility = lanAbility;
		this.views = views;
		this.replyTeacs = replyTeacs;
		this.member = member;
		this.goal = goal;
	}

	public Integer getTeacno() {
		return teacno;
	}

	public void setTeacno(Integer teacno) {
		this.teacno = teacno;
	}


	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public String getHighEdu() {
		return highEdu;
	}

	public void setHighEdu(String highEdu) {
		this.highEdu = highEdu;
	}

	public String getStudExp() {
		return studExp;
	}

	public void setStudExp(String studExp) {
		this.studExp = studExp;
	}

	public String getTutorExp() {
		return tutorExp;
	}

	public void setTutorExp(String tutorExp) {
		this.tutorExp = tutorExp;
	}

	public String getTeacLoc() {
		return teacLoc;
	}

	public void setTeacLoc(String teacLoc) {
		this.teacLoc = teacLoc;
	}

	public String getTeacObject() {
		return teacObject;
	}

	public void setTeacObject(String teacObject) {
		this.teacObject = teacObject;
	}

	public String getClassMode() {
		return classMode;
	}

	public void setClassMode(String classMode) {
		this.classMode = classMode;
	}

	public String getWillTeac() {
		return willTeac;
	}

	public void setWillTeac(String willTeac) {
		this.willTeac = willTeac;
	}

	public String getTeacTime() {
		return teacTime;
	}

	public void setTeacTime(String teacTime) {
		this.teacTime = teacTime;
	}

	public String getSkills() {
		return skills;
	}

	public void setSkills(String skills) {
		this.skills = skills;
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

	public String getSubjectItem() {
		return subjectItem;
	}

	public void setSubjectItem(String subjectItem) {
		this.subjectItem = subjectItem;
	}

	public String getLanAbility() {
		return lanAbility;
	}

	public void setLanAbility(String lanAbility) {
		this.lanAbility = lanAbility;
	}

	public Integer getViews() {
		return views;
	}

	public void setViews(Integer views) {
		this.views = views;
	}

	public List<ReplyTeac> getReplyTeacs() {
		return replyTeacs;
	}

	public void setReplyTeacs(List<ReplyTeac> replyTeacs) {
		this.replyTeacs = replyTeacs;
	}

	public MemberBean getMember() {
		return member;
	}

	public void setMember(MemberBean member) {
		this.member = member;
	}
	
	public Integer getGoal() {
		return goal;
	}
	
	public void setGoal(Integer goal) {
		this.goal = goal;
	}
}
