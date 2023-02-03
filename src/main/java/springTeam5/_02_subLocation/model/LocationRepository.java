package springTeam5._02_subLocation.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface LocationRepository extends JpaRepository<LocationBean, Integer> {

//	模糊查詢全部
	@Query(value = "from LocationBean where locNo like concat('%', ?1, '%') or locName like concat('%', ?1, '%') or locClass like concat('%', ?1, '%')")
	public List<LocationBean> findByAllLike(String searchAllLike);
		
//	透過編號建立查詢
	public LocationBean findByLocNo(Integer locNo);
	
//	搜尋全部
	public List<LocationBean> findAll();
	
//	透過ID刪除
	public void deleteByLocNo(Integer locNo);
}
