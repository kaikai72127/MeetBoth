package springTeam5._05_teacStu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import springTeam5._05_teacStu.model.StudRepository;
import springTeam5._05_teacStu.model.StudBean;

@Service
@Transactional
public class StudService implements StudServiceInterface{
	
	@Autowired
	private StudRepository sRepo;
	
//	模糊查詢學生全部
	@Override
	public List<StudBean> searchAllLikeStud(String searchAllLike) {
		List<StudBean> ts = sRepo.findByAllLike(searchAllLike);
		return ts;
	}
	
//  透過時薪區間建立學生貼文查詢
	@Override
	public List<StudBean> searchStudByPrice(Double low, Double high) {
		List<StudBean> ts = sRepo.findByPriceBetween(low, high);
		return ts;
	}
	
//	搜尋全部學生貼文依時薪降序排序
	@Override
	public List<StudBean> searchAllStudOBprice() {
		List<StudBean> ts = sRepo.findAllByOrderByPriceDesc();
		return ts;
	}
	
//	搜尋全部學生貼文依日期降序排序
	@Override
	public List<StudBean> searchAllStudOBpDate() {
		List<StudBean> ts = sRepo.findAllByOrderByPostDateDesc();
		return ts;
	}
	
//	搜尋全部學生貼文依會員編號排序
	@Override
	public List<StudBean> searchAllStudOBmId() {
		List<StudBean> ts = sRepo.findAllByOrderByMemberId();
		return ts;
	}
	
//	透過貼文編號建立學生貼文查詢
	@Override
	public StudBean searchStudFromStudno(Integer studno) {
		StudBean ts = sRepo.findByStudno(studno);
		return ts;
	}
	
//	搜尋全部學生貼文
	@Override
	public List<StudBean> searchAllStud() {
		List<StudBean> ts = sRepo.findAll();
		return ts;
	}
	
//	新增學生貼文
	@Override
	public void addStud(StudBean sb) {
		sRepo.save(sb);
	}
	
//	透過ID刪除學生貼文
	@Override
	public void deleteStudfromStudno(Integer studno) {
		sRepo.deleteByStudno(studno);
	}
	
//	透過ID修改學生貼文
	@Override
	public StudBean updateStudFromStudno(StudBean sb) {
		StudBean ts = sRepo.save(sb);
		return ts;
	}
}
