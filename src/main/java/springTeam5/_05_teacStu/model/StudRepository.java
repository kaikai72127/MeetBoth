package springTeam5._05_teacStu.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface StudRepository extends JpaRepository<StudBean, Integer> {
	
//	模糊查詢學生全部
	@Query(value = "select s from StudBean s join s.member m where s.educaLimit like concat('%', ?1, '%') or s.studLoc like concat('%', ?1, '%')"
			+ "or s.object like concat('%', ?1, '%') or s.classMode like concat('%', ?1, '%') or s.testTeacMode like concat('%', ?1, '%')"
			+ "or s.studTime like concat('%', ?1, '%') or s.conMethod like concat('%', ?1, '%') or s.conTime like concat('%', ?1, '%')"
			+ "or s.price like concat('%', ?1, '%') or s.subjectItem like concat('%', ?1, '%') or s.textBook like concat('%', ?1, '%')"
			+ "or s.startDate like concat('%', ?1, '%') or s.period like concat('%', ?1, '%') or s.views like concat('%', ?1, '%')"
			+ "or m.memName like concat('%', ?1, '%') or m.memNickName like concat('%', ?1, '%')")
	public List<StudBean> findByAllLike(String searchAllLike);
	
//  透過時薪區間建立學生貼文查詢
	public List<StudBean> findByPriceBetween(Double low, Double high);
	
//	搜尋全部學生貼文依時薪降序排序
	public List<StudBean> findAllByOrderByPriceDesc();
	
//	搜尋全部學生貼文依日期降序排序
<<<<<<< HEAD
	public List<StudBean> findAllByOrderByUpdateDateDesc();
	
//	搜尋全部學生貼文依瀏覽次數排序
	public List<StudBean> findAllByOrderByViews();
=======
	public List<StudBean> findAllByOrderByPostDateDesc();
	
//	搜尋全部學生貼文依會員編號排序
	public List<StudBean> findAllByOrderByMemberId();
>>>>>>> origin/_01_Seal
	
//	透過貼文編號建立學生貼文查詢
	public StudBean findByStudno(Integer studno);
	
//	搜尋全部學生貼文
	public List<StudBean> findAll();
	
//	透過ID刪除學生貼文
	public void deleteByStudno(Integer studno);
	
//	搜尋最新更新的前6筆貼文
	public List<StudBean> findFirst6ByOrderByUpdateDateDesc();
}
