package springTeam5._02_subLocation.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "location")
@Component
public class LocationBean {

	@Id
	@Column(name = "LOCNO")
	private Integer locNo;

	@Column(name = "LOCNAME")
	private String locName;
	
	@Column(name = "LOCCLASS")
	private String locClass;

	public LocationBean() {
	}

	public LocationBean(Integer locNo, String locName, String locClass) {
		this.locNo = locNo;
		this.locName = locName;
		this.locClass = locClass;
	}

	public LocationBean(String locName, String locClass) {
		this.locName = locName;
		this.locClass = locClass;
	}

	public Integer getLocNo() {
		return locNo;
	}

	public void setLocNo(Integer locNo) {
		this.locNo = locNo;
	}

	public String getLocName() {
		return locName;
	}

	public void setLocName(String locName) {
		this.locName = locName;
	}

	public String getLocClass() {
		return locClass;
	}

	public void setLocClass(String locClass) {
		this.locClass = locClass;
	}
	
	
	
	
}
