package springTeam5._02_subLocation.service;

import java.sql.SQLException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springTeam5._02_subLocation.model.CourseComment;
import springTeam5._02_subLocation.model.CourseCommentRepository;

@Service
@Transactional
public class CourseCommentService {

	@Autowired
	private CourseCommentRepository ccRepo;
	
	
	
	public void insertCourseComment(CourseComment cc) {
		ccRepo.save(cc);
	}

//	透過 CourseID 搜尋全部的 commentBean
	public List<CourseComment> searchAllCommentByCourseID(Integer id) throws SQLException {
		return ccRepo.findByAllLike(id);
	}

//	修改一條Comment
	public void updateCommentByCourseCommentID(CourseComment c) {
		ccRepo.save(c);
	}

//	刪除某條Comment
	public void deleteCommentFromCourseCommentID(Integer CourseCommentID) {
		ccRepo.deleteByCourseCommentID(CourseCommentID);
	}

//	排序
//	評分高到低
	public List<CourseComment> findAllByOrderByCourseScore() {
		return ccRepo.findAllByOrderByCourseScore();
	}

//	評分低到高
	public List<CourseComment> findAllByOrderByCourseScoreDESC() {
		return ccRepo.findAllByOrderByCourseScoreDesc();
	}

//	時間較新
	public List<CourseComment> findAllByOrderByCourseCommentDate() {
		return ccRepo.findAllByOrderByCourseCommentDate();
	}

//	時間較舊
	public List<CourseComment> findAllByOrderByCourseCommentDateDESC() {
		return ccRepo.findAllByOrderByCourseCommentDateDesc();
	}

}
