package springTeam5._02_subLocation.model;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

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
	
	@Column(name = "MemberID")
	@Transient
	private int memberID;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "MEMBERID")
	private MemberBean memberBean;
	
	//與課程訂單的關係是一對多
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "courseBean", cascade = CascadeType.ALL)
	private Set<CourseOrderBean> courseOrder = new LinkedHashSet<CourseOrderBean>(); // itemsList
	
	
	public Course() {
	}

	public Course(int courseID, String courseName, int coursePrice, String coursePost, String courseUpdate,
			String courseDirections, Blob courseImg, int courseSales, int courseClass, CourseType coursetype,
			List<CourseComment> courseComment, List<YtPlayer> ytPlayer, int memberID, MemberBean memberBean,
			Set<CourseOrderBean> courseOrder) {
		this.courseID = courseID;
		this.courseName = courseName;
		this.coursePrice = coursePrice;
		this.coursePost = coursePost;
		this.courseUpdate = courseUpdate;
		this.courseDirections = courseDirections;
		this.courseImg = courseImg;
		this.courseSales = courseSales;
		this.courseClass = courseClass;
		this.coursetype = coursetype;
		this.courseComment = courseComment;
		this.ytPlayer = ytPlayer;
		this.memberID = memberID;
		this.memberBean = memberBean;
		this.courseOrder = courseOrder;
	}

	public Course(String courseName, int coursePrice, String coursePost, String courseUpdate, String courseDirections,
			Blob courseImg, int courseSales, int courseClass, CourseType coursetype, List<CourseComment> courseComment,
			List<YtPlayer> ytPlayer, int memberID, MemberBean memberBean, Set<CourseOrderBean> courseOrder) {
		super();
		this.courseName = courseName;
		this.coursePrice = coursePrice;
		this.coursePost = coursePost;
		this.courseUpdate = courseUpdate;
		this.courseDirections = courseDirections;
		this.courseImg = courseImg;
		this.courseSales = courseSales;
		this.courseClass = courseClass;
		this.coursetype = coursetype;
		this.courseComment = courseComment;
		this.ytPlayer = ytPlayer;
		this.memberID = memberID;
		this.memberBean = memberBean;
		this.courseOrder = courseOrder;
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

	public int getMemberID() {
		return memberID;
	}

	public void setMemberID(int memberID) {
		this.memberID = memberID;
	}

	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

	public Set<CourseOrderBean> getCourseOrder() {
		return courseOrder;
	}

	public void setCourseOrder(Set<CourseOrderBean> courseOrder) {
		this.courseOrder = courseOrder;
	}
	
	
}
