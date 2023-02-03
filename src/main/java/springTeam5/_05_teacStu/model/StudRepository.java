package springTeam5._05_teacStu.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface StudRepository extends JpaRepository<StudBean, Integer> {
	
//	模糊查詢學生全部
	@Query(value = "from StudBean where memberid like concat('%', ?1, '%') or title like concat('%', ?1, '%') or detail like concat('%', ?1, '%')"
			+ "or price like concat('%', ?1, '%') or subjectitem like concat('%', ?1, '%') or learnloc like concat('%', ?1, '%')")
	public List<StudBean> findByAllLike(String searchAllLike);
	
//  透過時薪區間建立學生貼文查詢
	public List<StudBean> findByPriceBetween(Double low, Double high);
	
//	搜尋全部學生貼文依時薪降序排序
	public List<StudBean> findAllByOrderByPriceDesc();
	
//	搜尋全部學生貼文依日期降序排序
	public List<StudBean> findAllByOrderByPostdateDesc();
	
//	搜尋全部學生貼文依會員編號排序
	public List<StudBean> findAllByOrderByMemberid();
	
//	透過貼文編號建立學生貼文查詢
	public StudBean findByStudno(Integer studno);
	
//	搜尋全部學生貼文
	public List<StudBean> findAll();
	
//	透過ID刪除學生貼文
	public void deleteByStudno(Integer studno);
}
