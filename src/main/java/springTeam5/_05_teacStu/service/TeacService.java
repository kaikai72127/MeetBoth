package springTeam5._05_teacStu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import springTeam5._05_teacStu.model.TeacBean;
import springTeam5._05_teacStu.model.TeacRepository;

@Service
@Transactional
public class TeacService implements TeacServiceInterface {
	
	@Autowired
	private TeacRepository tRepo;
	
//	模糊查詢教師全部
	@Override
	public List<TeacBean> searchAllLike(String searchAllLike) {
		List<TeacBean> ts = tRepo.findByAllLike(searchAllLike);
		return ts;
	}
	
//  透過時薪區間建立教師貼文查詢
	@Override
	public List<TeacBean> searchTeacByPrice(Double low, Double high) {
		List<TeacBean> ts = tRepo.findByPriceBetween(low, high);
		return ts;
	}
	
//	搜尋全部教師貼文依時薪降序排序
	@Override
	public List<TeacBean> searchAllTeacOBprice() {
		List<TeacBean> ts = tRepo.findAllByOrderByPriceDesc();
		return ts;
	}
	
//	搜尋全部教師貼文依日期降序排序
	@Override
	public List<TeacBean> searchAllTeacOBpDate() {
		List<TeacBean> ts = tRepo.findAllByOrderByPostdateDesc();
		return ts;
	}
	
//	搜尋全部教師貼文依會員編號排序
	@Override
	public List<TeacBean> searchAllTeacOBmId() {
		List<TeacBean> ts = tRepo.findAllByOrderByMemberid();
		return ts;
	}
	
//	透過貼文編號建立教師貼文查詢
	@Override
	public TeacBean searchTeacFromTeacno(Integer teacno) {
		TeacBean ts = tRepo.findByTeacno(teacno);
		return ts;
	}
	
//	搜尋全部教師貼文
	@Override
	public List<TeacBean> searchAllTeac() {
		List<TeacBean> ts = tRepo.findAll();
		return ts;
	}
	
//	新增教師貼文
	@Override
	public void addTeac(TeacBean tableForTeac) {
		tRepo.save(tableForTeac);
	}
	
//	透過ID刪除教師貼文
	@Override
	public void deleteTeacfromTeacno(Integer teacno) {
		tRepo.deleteByTeacno(teacno);
	}
	
//	透過ID修改教師貼文
	@Override
	public TeacBean updateTeacFromTeacno(TeacBean tableForTeac) {
		TeacBean ts = tRepo.save(tableForTeac);
		return ts;
	}
}
