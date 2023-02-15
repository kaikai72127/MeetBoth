package springTeam5._06_halaAndQa.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class HalaService {

	@Autowired
	private HalaRepository halaRepo;

//	模糊查詢全部
	public List<HalaBean> searchAllLike(String searchAllLike) {
		List<HalaBean> hb = halaRepo.findByAllLike(searchAllLike);
		return hb;
	}

	// 新增
	public HalaBean insertHala(HalaBean hb) {
		return halaRepo.save(hb);
	}

	// 修改
	public HalaBean updateHala(HalaBean halaBean) {
		return halaRepo.save(halaBean);
	}

	// 刪除
	public void deleteHala(Integer halaId) {
		halaRepo.deleteByHalaId(halaId);
	}

	// 查詢全部
	public List<HalaBean> findHalaAll() {
		return halaRepo.findAllHala();
	}

	// 查詢分類
	public List<HalaBean> selectHalaClass(String halaclassname) {
		return halaRepo.findByHalaclassname(halaclassname);
	}

	//會員編號查詢
	public List<HalaBean> selectMemberId(Integer memberId) {
		return halaRepo.findByMemberId(memberId);
	} 
	
	// id查詢
	public HalaBean selectHalaId(Integer halaId) {
		return halaRepo.findByHalaId(halaId);
	}
	

	// 更新讚數
	public void updatetumb(HalaBean halaBean) {
		halaRepo.save(halaBean);
	}
	
	//熱門前5
	public List<HalaBean> findTopHot(){
		return halaRepo.findTopfive();
	}

}
