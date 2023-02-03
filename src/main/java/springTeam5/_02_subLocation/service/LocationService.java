package springTeam5._02_subLocation.service;

import java.util.List;

import springTeam5._02_subLocation.model.LocationBean;




public interface LocationService {
	public List<LocationBean> searchAllLoc();

	public LocationBean findById(Integer locNo);

	public List<LocationBean> findByClass(String locationClass);

	public LocationBean add(LocationBean locationBean);

	public void deleteLocFromLocno(Integer locNo);

	public void updateLocFromLocno(LocationBean locationBean);

}