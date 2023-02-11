package springTeam5._02_subLocation.model;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="COURSETYPE")
@Component
public class CourseType {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="COURSECLASS")
	private Integer courseClass;
	
	@Column(name="COURSECLASSNAME")
	private String courseClassName;
	

	public Integer getCourseClass() {
		return courseClass;
	}
	public void setCourseClass(Integer courseClass) {
		this.courseClass = courseClass;
	}
	public String getCourseClassName() {
		return courseClassName;
	}
	public void setCourseClassName(String courseClassName) {
		this.courseClassName = courseClassName;
	}
	public Set<Course> getCourse() {
		return course;
	}
	public void setCourse(Set<Course> course) {
		this.course = course;
	}
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "coursetype",cascade = CascadeType.ALL)
	private Set<Course> course = new LinkedHashSet<Course>();
	
	
	
	
	@Override
	public String toString() {
		return "CourseType [courseClass=" + courseClass + ", courseClassName=" + courseClassName + "]";
	}
	
	public CourseType() {
	}
	
	public CourseType(Integer courseClass, String courseClassName, Set<Course> course) {
		super();
		this.courseClass = courseClass;
		this.courseClassName = courseClassName;
		this.course = course;
	}

	

}
