package springTeam5._02_subLocation.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CourseCommentRepository extends JpaRepository<CourseComment, Integer>  {

//	透過 CourseID 搜尋全部的 commentBean
	@Query(value = "from CourseComment where courseid like concat('%', ?1, '%') order by courseCommentDate")
	public List<CourseComment> findByAllLike(Integer courseID);
	
//	刪除某條Comment
	public void deleteByCourseCommentID(Integer courseid);
	
//	排序
//	評分高到低
	public List<CourseComment> findAllByOrderByCourseScore();
//	評分低到高
	public List<CourseComment> findAllByOrderByCourseScoreDesc();
//	時間較新
	public List<CourseComment> findAllByOrderByCourseCommentDate();
//	時間較舊
	public List<CourseComment> findAllByOrderByCourseCommentDateDesc();

}
