package springTeam5._02_subLocation.service;


import java.sql.SQLException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springTeam5._02_subLocation.model.Course;
import springTeam5._02_subLocation.model.CourseRepository;

@Service
@Transactional
public class CourseService {

	@Autowired
	private CourseRepository cRepo;

//	搜尋全部
//	@Override
	public List<Course> searchAllCourse() throws SQLException {
		return cRepo.findAll();
	}

//	透過課程編號(courseID)來做單一個課程資訊搜尋 會回傳一個 Course
	public Course searchSingleCourseFromCourseID(Integer courseID) throws SQLException {
		return cRepo.findByCourseID(courseID);
	}

//	透過courseID刪除整筆資料
	public void deleteCourseFromCourseID(Integer courseID) {
		cRepo.deleteByCourseID(courseID);
	}

//	透過courseID修改course的資料
	public void updateCourse(Course c) {
		cRepo.save(c);
	}
	
//	新增評論
	public void insertCourseComment(Course c) {
		cRepo.save(c);
	}

//	模糊搜尋
	public List<Course> searchWithCondiOrderByCourseID(Integer type, Integer low, Integer high, String name)throws SQLException {
		return cRepo.findAllByOrderByCourseID(type, low, high, name);
	}
	public List<Course> searchWithCondiOrderByCoursePriceDesc(Integer type, Integer low, Integer high, String name)throws SQLException {
		return cRepo.findAllByOrderByCoursePriceDesc(type, low, high, name);
	}
	public List<Course> searchWithCondiOrderByCoursePrice(Integer type, Integer low, Integer high, String name)throws SQLException {
		return cRepo.findAllByOrderByCoursePrice(type, low, high, name);
	}
	public List<Course> searchWithCondiOrderByCoursePost(Integer type, Integer low, Integer high, String name)throws SQLException {
		return cRepo.findAllByOrderByCoursePostDesc(type, low, high, name);
	}
	public List<Course> searchWithCondiOrderByCourseUpdate(Integer type, Integer low, Integer high, String name)throws SQLException {
		return cRepo.findAllByOrderByCourseUpdateDesc(type, low, high, name);
	}
	
	public List<Course> findTop4CourseLikeByCourseLike(Integer courseClass,Integer courseID){
		return cRepo.findTop4CourseLikeByCourseLike(courseClass,courseID);
	}
	
	public List<Course> findRandomCourses(){
		return cRepo.findRandomCourses();
	}

}
