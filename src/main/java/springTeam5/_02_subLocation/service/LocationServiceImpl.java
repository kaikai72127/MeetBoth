package springTeam5._02_subLocation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import springTeam5._02_subLocation.model.LocationBean;
import springTeam5._02_subLocation.model.LocationRepository;



@Service
@Transactional
public class LocationServiceImpl implements LocationService{
	
	@Autowired
	private LocationRepository lRepo;

	
//	搜尋全部
	@Override
	public List<LocationBean> searchAllLoc(){
		List<LocationBean> sl = lRepo.findAll();
		return sl;
	}
//	透過編號建立查詢
	@Override
	public LocationBean findById(Integer locNo){
		LocationBean sl = lRepo.findByLocNo(locNo);
		return sl;
	}
//	模糊查詢全部
	@Override
	public List<LocationBean> findByClass(String locationClass){
		List<LocationBean> sl = lRepo.findByAllLike(locationClass);
		return sl; 
	}
//	新增
	@Override
	public LocationBean add(LocationBean locationBean) {
		return lRepo.save(locationBean);
	}

//	透過ID刪除
	@Override
	public void deleteLocFromLocno(Integer locNo) {
		lRepo.deleteByLocNo(locNo);
	}

//	透過ID修改	
	@Override
	public void updateLocFromLocno(LocationBean locationBean) {
		lRepo.save(locationBean);
	}

}
