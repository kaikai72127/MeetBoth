package springTeam5._02_subLocation.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CourseTypeRepository extends JpaRepository<CourseType, Integer>  {
	
//	搜單一類別
	public CourseType findByCourseClass(Integer courseclass);
}
