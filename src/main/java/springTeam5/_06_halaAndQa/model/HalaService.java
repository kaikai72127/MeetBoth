package springTeam5._06_halaAndQa.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class HalaService  {
	
	@Autowired
	private HalaRepository halaRepo;
	
	//新增
	public HalaBean insertHala(HalaBean hb) {
		return halaRepo.save(hb);
	}
	
	//修改
	public HalaBean updateHala(HalaBean halaBean) {
		return halaRepo.save(halaBean);
	}
	
	//刪除
	public void deleteHala(Integer halaId) {
		halaRepo.deleteByHalaid(halaId);
	}

	//查詢全部
	public List<HalaBean> findHalaAll(){
		return halaRepo.findAllHala();
	}
	
	//查詢分類
	public List<HalaBean> selectHalaClass(String halaclassname) {
		return halaRepo.findByHalaclassname(halaclassname);
	}
	
	//編號查詢
	public HalaBean selectHalaId(Integer halaId) {
		return halaRepo.findByHalaid(halaId);
	}
	


}
