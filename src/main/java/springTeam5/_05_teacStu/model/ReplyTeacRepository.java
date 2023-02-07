package springTeam5._05_teacStu.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ReplyTeacRepository extends JpaRepository<ReplyTeac, Integer> {

//		透過回覆編號建立教師貼文回覆查詢
		public ReplyTeac findByReplyNo(Integer replyNo);
		
//		刪除某條Comment
		public void deleteByReplyNo(Integer replyNo);

}
