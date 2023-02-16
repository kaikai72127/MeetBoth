package springTeam5._02_subLocation.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import springTeam5._01_member.model.MemberBean;

@Entity
@Table(name = "COURSE_ORDER")
@Component
public class CourseOrderBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "COURSE_OID")
	private Integer courseOId; // 訂單編號
	
	@Column(name = "orderUID") //流水訂單編號
	private String orderUID ;

	@ManyToOne
	@JoinColumn(name = "MEMBERBUY_FK") // 買家會員編號
	private MemberBean memberbuy;

	@ManyToOne
	@JoinColumn(name = "COURSEID_FK") // 課程ID
	private Course courseBean;

	@Column(name = "ORDERDATE")
	private String orderDate; // 訂單日期
	
	@Column(name = "TOTALAMOUNT")
	private Integer totalAmount; // 總金額
	
	
	public CourseOrderBean() {
	}


	public CourseOrderBean(Integer courseOId, String orderUID, MemberBean memberbuy, Course courseBean,
			String orderDate, Integer totalAmount) {
		super();
		this.courseOId = courseOId;
		this.orderUID = orderUID;
		this.memberbuy = memberbuy;
		this.courseBean = courseBean;
		this.orderDate = orderDate;
		this.totalAmount = totalAmount;
	}


	public CourseOrderBean(String orderUID, MemberBean memberbuy, Course courseBean, String orderDate,
			Integer totalAmount) {
		super();
		this.orderUID = orderUID;
		this.memberbuy = memberbuy;
		this.courseBean = courseBean;
		this.orderDate = orderDate;
		this.totalAmount = totalAmount;
	}


	public Integer getCourseOId() {
		return courseOId;
	}


	public void setCourseOId(Integer courseOId) {
		this.courseOId = courseOId;
	}


	public String getOrderUID() {
		return orderUID;
	}


	public void setOrderUID(String orderUID) {
		this.orderUID = orderUID;
	}


	public MemberBean getMemberbuy() {
		return memberbuy;
	}


	public void setMemberbuy(MemberBean memberbuy) {
		this.memberbuy = memberbuy;
	}


	public Course getCourseBean() {
		return courseBean;
	}


	public void setCourseBean(Course courseBean) {
		this.courseBean = courseBean;
	}


	public String getOrderDate() {
		return orderDate;
	}


	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}


	public Integer getTotalAmount() {
		return totalAmount;
	}


	public void setTotalAmount(Integer totalAmount) {
		this.totalAmount = totalAmount;
	}

}
