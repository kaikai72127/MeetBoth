package springTeam5._02_subLocation.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import springTeam5._02_subLocation.model.CourseOrderBean;
import springTeam5._02_subLocation.model.CourseOrderRepository;

@Service
@Transactional
public class CourseOrderService {
	
	@Autowired
	private CourseOrderRepository courseOrderRepo;
	
	//小工具們
	//日期格式化小工具
	public String getCurrentDate() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		return sdf.format(date);
	}
	// 訂單編號生成小工具
		public String generateOrderNumber() {
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
			String date = sdf.format(new Date());

			List<CourseOrderBean> orderList = courseOrderRepo.findOrderByUID(date);
			int size = orderList.size();
			return "MBC" + date + String.format("%04d", (size + 1));
		}

	//--------------------------------------
	//新增
	public CourseOrderBean createCourseOrder(CourseOrderBean obean) {
		return courseOrderRepo.save(obean);
	}
	//修改
	public CourseOrderBean updateCourseOrder(CourseOrderBean obean) {
		return courseOrderRepo.save(obean);
	}
	//查詢
	public List<CourseOrderBean> findAll(){
		return courseOrderRepo.findAll();
	}

	public CourseOrderBean findByID(Integer courseOrderId){
		return courseOrderRepo.findByID(courseOrderId);
	}
	
}
