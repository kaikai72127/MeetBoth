package springTeam5._05_teacStu.service;

import java.util.List;

import springTeam5._05_teacStu.model.ReplyTeac;

public interface ReplyTeacServiceInterface {
	
//	透過回覆編號建立教師貼文回覆查詢
	public List<ReplyTeac> findByTeacherTeacno(Integer teacno);
	
//	刪除教師貼文回覆
	public void deleteByTeacherTeacno(Integer teacno);
	
//	新增教師貼文回覆
	public void addReplyTeac(ReplyTeac rt);
	
//	修改教師貼文回覆
	public ReplyTeac updateReplyTeac(ReplyTeac rt);
	
}
