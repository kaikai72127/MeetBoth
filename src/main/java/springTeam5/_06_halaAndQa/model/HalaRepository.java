package springTeam5._06_halaAndQa.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface HalaRepository extends JpaRepository<HalaBean, Integer> {

	// 模糊查詢全部
	@Query(value = "from HalaBean where memberid like concat('%', ?1, '%') or title like concat('%', ?1, '%') or halacontent like concat('%', ?1, '%') or halaclassname like concat('%',?1,'%')")
	public List<HalaBean> findByAllLike(String searchAllLike);

	// 查詢全部
	@Query(value = "select * from Hala order by postdate desc", nativeQuery = true)
	public List<HalaBean> findAllHala();

	// 分類查詢
	public List<HalaBean> findByHalaclassname(String halaclassname);

	// ID查詢
	public HalaBean findByHalaId(Integer halaid);

	// 刪除
	public void deleteByHalaId(Integer halaid);
	
	//熱門前5
	@Query(value = "select top 5 * from hala order by watch DESC",nativeQuery = true)
	public List<HalaBean> findTopfive();
	
	//會員編號查詢
	 @Query(value = "select * from Hala where memberid=?", nativeQuery = true)
	 public List<HalaBean>findByMemberId(Integer memberId);
	
}
