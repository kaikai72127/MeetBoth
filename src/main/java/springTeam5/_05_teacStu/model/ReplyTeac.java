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

@Entity
@Table(name = "REPLYTEAC")
@Component
public class ReplyTeac {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "REPLYNO")
	private Integer replyNo;
	@Column(name = "SCORE")
	private int score;
	@Column(name = "REPLYDATE")
	private String replyDate;
	@Column(name = "REPLY")
	private String reply;  
	@ManyToOne
	@JoinColumn(name = "TEACNO")
	private TeacBean teacher;
	
	public ReplyTeac() {
	}

	public ReplyTeac(Integer replyNo, int score, String replyDate, String reply, TeacBean teacher) {
		this.replyNo = replyNo;
		this.score = score;
		this.replyDate = replyDate;
		this.reply = reply;
		this.teacher = teacher;
	}

	public Integer getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(Integer replyNo) {
		this.replyNo = replyNo;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public TeacBean getTeacher() {
		return teacher;
	}

	public void setTeacher(TeacBean teacher) {
		this.teacher = teacher;
	}
}
