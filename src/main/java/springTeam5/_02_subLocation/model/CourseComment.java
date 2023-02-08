package springTeam5._02_subLocation.model;

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
@Table(name = "COURSECOMMENT")
@Component
public class CourseComment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "COURSECOMMENTID")
	private int courseCommentID;

	@Column(name = "COURSECUSTOMID")
	private int courseCustomID;

	@Column(name = "COURSESCORE")
	private int courseScore;

	@Column(name = "COURSECOMMENT")
	private String courseComment;

	@Column(name = "COURSECOMMENTDATE")
	private String courseCommentDate;

	@Column(name = "COURSEID")
	@Transient
	private int courseID;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "COURSEID")
	private Course course;

	public CourseComment() {
	}

	public int getCourseCommentID() {
		return courseCommentID;
	}

	public void setCourseCommentID(int courseCommentID) {
		this.courseCommentID = courseCommentID;
	}

	public int getCourseCustomID() {
		return courseCustomID;
	}

	public void setCourseCustomID(int courseCustomID) {
		this.courseCustomID = courseCustomID;
	}

	public int getCourseScore() {
		return courseScore;
	}

	public void setCourseScore(int courseScore) {
		this.courseScore = courseScore;
	}

	public String getCourseComment() {
		return courseComment;
	}

	public void setCourseComment(String courseComment) {
		this.courseComment = courseComment;
	}

	public String getCourseCommentDate() {
		return courseCommentDate;
	}

	public void setCourseCommentDate(String courseCommentDate) {
		this.courseCommentDate = courseCommentDate;
	}

	public int getCourseID() {
		return courseID;
	}

	public void setCourseID(int courseID) {
		this.courseID = courseID;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public CourseComment(int courseCommentID, int courseCustomID, int courseScore, String courseComment,
			String courseCommentDate, int courseID, Course course) {
		super();
		this.courseCommentID = courseCommentID;
		this.courseCustomID = courseCustomID;
		this.courseScore = courseScore;
		this.courseComment = courseComment;
		this.courseCommentDate = courseCommentDate;
		this.courseID = courseID;
		this.course = course;
	}
}
