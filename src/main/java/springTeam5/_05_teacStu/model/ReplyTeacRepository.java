package springTeam5._05_teacStu.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ReplyTeacRepository extends JpaRepository<ReplyTeac, Integer> {

//		透過貼文編號建立教師貼文回覆查詢
		public List<ReplyTeac> findByTeacherTeacno(Integer teacno);
		
//		刪除某條Comment
		public void deleteByTeacherTeacno(Integer teacno);

}
