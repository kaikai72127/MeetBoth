package springTeam5._01_member.model;

import java.io.Serializable;
import java.sql.Blob;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;

import org.springframework.stereotype.Component;

import springTeam5._05_teacStu.model.StudBean;
import springTeam5._05_teacStu.model.TeacBean;



@Entity
@Table(name = "Member")
@Component
public class MemberBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
//	@OneToMany(mappedBy = "MemberBean")
//	private List<StudBean> stud;
//	
//	@OneToMany(mappedBy = "MemberBean")
//	private List<TeacBean> teac;

	@Column(name = "memberID", updatable = false)
	private int memberID;
	
	@Id
	@Column(name = "account")
	private String account = "";
		
	@Column(name = "password")
	private String password = "";
		
	@Column(name = "idnumber")
	private String idNumber = "";
		
	@Column(name = "memname")
	private String memName = "";
		
	@Column(name = "memnickname")
	private String memNickName = "";
		
	@Column(name = "memold")
	private int memOld;
		
	@Column(name = "membirth")
	private String memBirth  = "";
	
	@Column(name = "memgender")
	private String memGender = "";
		
	@Column(name = "email")
	private String eMail = "";
		
	@Column(name = "phone")
	private String phone;
		
	@Column(name = "photo")
	private Blob photo = null;
		
	@Column(name = "address")
	private String address = "";
		
	@Column(name = "registime")
	private Date registime = new Date();
	
	@Column(name = "role")
	private String role = "user";
	
	public MemberBean() {
	}
	
//	public MemberBean(MemberBean member) {
//		this.memberID = member.getMemberID();
//		this.account = member.getAccount();
//		this.password = member.getPassword();
//		this.idNumber = member.getIdNumber();
//		this.memName = member.getMemName();
//		this.memNickName = member.getMemNickName();
//		this.memOld = member.getMemOld();
//		this.memBirth = member.getMemBirth();
//		this.memGender = member.getMemGender();
//		this.eMail = member.geteMail();
//		this.phone = member.getPhone();
//		this.photo = member.getPhoto();
//		this.address = member.getAddress();
//	}
//	public MemberBean(int memberID, String account, String password, String idNumber, String memName,
//			String memNickName, int memOld, String memBirth, String memGender, String eMail, String phone, Blob photo,
//			String address, Date registime) {
//		super();
//		this.memberID = memberID;
//		this.account = account;
//		this.password = password;
//		this.idNumber = idNumber;
//		this.memName = memName;
//		this.memNickName = memNickName;
//		this.memOld = memOld;
//		this.memBirth = memBirth;
//		this.memGender = memGender;
//		this.eMail = eMail;
//		this.phone = phone;
//		this.photo = photo;
//		this.address = address;
//		this.registime = registime;
//	}
//	public MemberBean(String account, String password, String idNumber, String memName, String memNickName, int memOld,
//			String memBirth, String memGender, String eMail, String phone, Blob photo, String address, Date registime) {
//		this.account = account;
//		this.password = password;
//		this.idNumber = idNumber;
//		this.memName = memName;
//		this.memNickName = memNickName;
//		this.memOld = memOld;
//		this.memBirth = memBirth;
//		this.memGender = memGender;
//		this.eMail = eMail;
//		this.phone = phone;
//		this.photo = photo;
//		this.address = address;
//		this.registime = registime;
//	}
//	

	public int getMemberID() {
		return memberID;
	}

	public void setMemberID(int memberID) {
		this.memberID = memberID;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemNickName() {
		return memNickName;
	}

	public void setMemNickName(String memNickName) {
		this.memNickName = memNickName;
	}

	public int getMemOld() {
		return memOld;
	}

	public void setMemOld(int memOld) {
		this.memOld = memOld;
	}

	public String getMemBirth() {
		return memBirth;
	}

	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}

	public String getMemGender() {
		return memGender;
	}

	public void setMemGender(String memGender) {
		this.memGender = memGender;
	}

	public String geteMail() {
		return eMail;
	}

	public void seteMail(String eMail) {
		this.eMail = eMail;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Blob getPhoto() {
		return photo;
	}

	public void setPhoto(Blob photo) {
		this.photo = photo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRegistime() {
		return new SimpleDateFormat("YYYY/MM/dd").format(registime);
	}


	public void setRegistime(Date date) {
		this.registime = date;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "MemberBean [memberID=" + memberID + ", account=" + account + ", password=" + password + ", idNumber="
				+ idNumber + ", memName=" + memName + ", memNickName=" + memNickName + ", memOld=" + memOld
				+ ", memBirth=" + memBirth + ", memGender=" + memGender + ", eMail=" + eMail + ", phone=" + phone
				+ ", address=" + address + ", registime=" + new SimpleDateFormat("YYYY/MM/dd").format(registime) + "]";
	}

}
