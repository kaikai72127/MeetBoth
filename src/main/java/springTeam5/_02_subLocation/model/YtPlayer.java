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

import springTeam5._01_member.model.MemberBean;

@Entity
@Table(name = "YTPLAYER")
@Component
public class YtPlayer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "YTPLAYERID")
	private int ytPlayerID;
	
	@Column(name = "COURSEID")
	@Transient
	private int courseID;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "COURSEID")
	private Course course;
	
	@Column(name = "YTPLAYERNAME")
	private String ytPlayerName;
	
	@Column(name = "YTPLAYERURL")
	private String ytPlayerURL;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "YTPLAYERCUSTOMID")
	private MemberBean memberBean;

	public YtPlayer() {
	}

	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}
	
	public int getYtPlayerID() {
		return ytPlayerID;
	}

	public void setYtPlayerID(int ytPlayerID) {
		this.ytPlayerID = ytPlayerID;
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

	public String getYtPlayerName() {
		return ytPlayerName;
	}

	public void setYtPlayerName(String ytPlayerName) {
		this.ytPlayerName = ytPlayerName;
	}

	public String getYtPlayerURL() {
		return ytPlayerURL;
	}

	public void setYtPlayerURL(String ytPlayerURL) {
		this.ytPlayerURL = ytPlayerURL;
	}

	public YtPlayer(int ytPlayerID, int courseID, Course course, String ytPlayerName, String ytPlayerURL, MemberBean memberBean) {
		super();
		this.ytPlayerID = ytPlayerID;
		this.courseID = courseID;
		this.course = course;
		this.ytPlayerName = ytPlayerName;
		this.ytPlayerURL = ytPlayerURL;
		this.memberBean = memberBean;
	}

	
	
	

}
