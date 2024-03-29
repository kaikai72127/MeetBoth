package springTeam5._05_teacStu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import springTeam5._05_teacStu.model.ReplyTeac;
import springTeam5._05_teacStu.model.ReplyTeacRepository;

@Service
@Transactional
public class ReplyTeacService implements ReplyTeacServiceInterface {
	
	@Autowired
	private ReplyTeacRepository rtRepo;
	
//	透過回覆編號建立教師貼文回覆查詢
	@Override
	public List<ReplyTeac> findByTeacherTeacno(Integer teacno) {
		return rtRepo.findByTeacherTeacno(teacno);
	}
	
//	刪除教師貼文回覆
	@Override
	public void deleteByTeacherTeacno(Integer teacno) {
		rtRepo.deleteByTeacherTeacno(teacno);
	}
	
//	新增教師貼文回覆
	@Override
	public void addReplyTeac(ReplyTeac rt) {
		rtRepo.save(rt);
	}
	
//	修改教師貼文回覆
	@Override
	public ReplyTeac updateReplyTeac(ReplyTeac rt) {
		return rtRepo.save(rt);
	}
	
}
