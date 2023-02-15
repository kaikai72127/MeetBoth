package springTeam5._02_subLocation.model;

import java.sql.Blob;
import java.util.ArrayList;
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
@Table(name = "COURSE")
@Component
public class Course {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "COURSEID")
	private int courseID;

	@Column(name = "COURSENAME")
	private String courseName;

	@Column(name = "COURSEPRICE")
	private int coursePrice;

	@Column(name = "COURSEPOST")
	private String coursePost;

	@Column(name = "COURSEUPDATE")
	private String courseUpdate;

	@Column(name = "COURSEDIRECTIONS")
	private String courseDirections;

	@Column(name = "COURSEIMG")
	private Blob courseImg;

	@Column(name = "COURSESALES")
	private int courseSales;

	@Column(name = "COURSECLASS")
	@Transient
	private int courseClass;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "COURSECLASS")
	private CourseType coursetype;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "course", cascade = CascadeType.ALL)
	private List<CourseComment> courseComment = new ArrayList<CourseComment>();

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "course", cascade = CascadeType.ALL)
	private List<YtPlayer> ytPlayer = new ArrayList<YtPlayer>();
	
	@Column(name = "MEMBERID")
	@Transient
	private int memberID;
	
	@Column(name = "MEMBERBUYID")
	@Transient
	private int memberBuyID;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "MemberID")
	private MemberBean memberBean;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "MemberBuyID")
	private MemberBean memberBuyBean;
	
	public Course() {
	}
	
	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}
	
	public Course(int courseID, String courseName, int coursePrice, int memberID, int memberBuyID, String coursePost,
			String courseUpdate, String courseDirections, Blob courseImg, int courseSales, int courseClass,
			CourseType coursetype, List<CourseComment> courseComment, List<YtPlayer> ytPlayer,MemberBean memberBean) {
		super();
		this.courseID = courseID;
		this.courseName = courseName;
		this.coursePrice = coursePrice;
		this.memberBuyID = memberID;
		this.memberID = memberID;
		this.coursePost = coursePost;
		this.courseUpdate = courseUpdate;
		this.courseDirections = courseDirections;
		this.courseImg = courseImg;
		this.courseSales = courseSales;
		this.courseClass = courseClass;
		this.coursetype = coursetype;
		this.courseComment = courseComment;
		this.ytPlayer = ytPlayer;
		this.memberBean = memberBean;
	}
	
	

	public int getCourseID() {
		return courseID;
	}

	public void setCourseID(int courseID) {
		this.courseID = courseID;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public int getCoursePrice() {
		return coursePrice;
	}

	public void setCoursePrice(int coursePrice) {
		this.coursePrice = coursePrice;
	}

	public int getMemberID() {
		return memberID;
	}

	public void setMemberID(int memberID) {
		this.memberID = memberID;
	}
	
	public int getMemberBuyID() {
		return memberBuyID;
	}
	public void setMemberBuyID(int memberBuyID) {
		this.memberBuyID = memberBuyID;
	}

	public String getCoursePost() {
		return coursePost;
	}

	public void setCoursePost(String coursePost) {
		this.coursePost = coursePost;
	}

	public String getCourseUpdate() {
		return courseUpdate;
	}

	public void setCourseUpdate(String courseUpdate) {
		this.courseUpdate = courseUpdate;
	}

	public String getCourseDirections() {
		return courseDirections;
	}

	public void setCourseDirections(String courseDirections) {
		this.courseDirections = courseDirections;
	}

	public Blob getCourseImg() {
		return courseImg;
	}

	public void setCourseImg(Blob courseImg) {
		this.courseImg = courseImg;
	}

	public int getCourseSales() {
		return courseSales;
	}

	public void setCourseSales(int courseSales) {
		this.courseSales = courseSales;
	}

	public int getCourseClass() {
		return courseClass;
	}

	public void setCourseClass(int courseClass) {
		this.courseClass = courseClass;
	}

	public CourseType getCoursetype() {
		return coursetype;
	}

	public void setCoursetype(CourseType coursetype) {
		this.coursetype = coursetype;
	}

	public List<CourseComment> getCourseComment() {
		return courseComment;
	}

	public void setCourseComment(List<CourseComment> courseComment) {
		this.courseComment = courseComment;
	}
	
	public List<YtPlayer> getYtPlayer() {
		return ytPlayer;
	}

	public void setYtPlayer(List<YtPlayer> ytPlayer) {
		this.ytPlayer = ytPlayer;
	}

	

	
}
