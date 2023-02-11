package springTeam5._02_subLocation.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springTeam5._02_subLocation.model.CourseType;
import springTeam5._02_subLocation.model.CourseTypeRepository;

@Service
@Transactional
public class CourseTypeService {

	@Autowired
	private CourseTypeRepository ctRepo;
	
//	透過產品類別編號建立查詢
	public CourseType findByCourseClass(Integer courseclass) {
		return ctRepo.findByCourseClass(courseclass);
	}
	
//	新增商品
	public void insertCourse(CourseType ct) {
		ctRepo.save(ct);
	}
	
}
