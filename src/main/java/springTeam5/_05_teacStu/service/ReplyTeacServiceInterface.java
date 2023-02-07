package springTeam5._05_teacStu.service;

import springTeam5._05_teacStu.model.ReplyTeac;

public interface ReplyTeacServiceInterface {
	
//	透過回覆編號建立教師貼文回覆查詢
	public ReplyTeac findByReplyNo(Integer replyNo);
	
//	刪除教師貼文回覆
	public void deleteByReplyNo(Integer replyNo);
	
//	新增教師貼文回覆
	public void addReplyTeac(ReplyTeac rt);
	
//	修改教師貼文回覆
	public ReplyTeac updateReplyTeac(ReplyTeac rt);
	
}
