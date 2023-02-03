package springTeam5._06_halaAndQa.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface HalaRepository extends JpaRepository<HalaBean, Integer> {

	// 查詢全部
	@Query(value = "select * from Hala", nativeQuery = true)
	public List<HalaBean> findAllHala();

	// 分類查詢
	public List<HalaBean> findByHalaclassname(String halaclassname);

	// ID查詢
	public HalaBean findByHalaid(Integer halaid);

	// 刪除
	public void deleteByHalaid(Integer halaid);

}
