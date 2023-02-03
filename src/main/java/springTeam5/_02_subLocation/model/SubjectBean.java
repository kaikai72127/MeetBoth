package springTeam5._02_subLocation.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;


@Entity
@Table(name = "subject")
@Component
public class SubjectBean {

	@Id
	@Column(name = "SUBJECTID")
	private Integer subjectId;

	@Column(name = "SUBJECTNAME")
	private String subjectName;
	
	@Column(name = "SUBJECTCLASS")
	private String subjectClass;

	public SubjectBean() {
	}

	public Integer getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public String getSubjectClass() {
		return subjectClass;
	}

	public void setSubjectClass(String subjectClass) {
		this.subjectClass = subjectClass;
	}

	public SubjectBean(Integer subjectId, String subjectName, String subjectClass) {
		this.subjectId = subjectId;
		this.subjectName = subjectName;
		this.subjectClass = subjectClass;
	}

	public SubjectBean(String subjectName, String subjectClass) {
		this.subjectName = subjectName;
		this.subjectClass = subjectClass;
	}
	
	
	
	
	
	


}

