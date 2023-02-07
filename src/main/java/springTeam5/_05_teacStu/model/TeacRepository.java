package springTeam5._05_teacStu.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TeacRepository extends JpaRepository<TeacBean, Integer>{

//	模糊查詢教師全部
	@Query(value = "from TeacBean where memberId like concat('%', ?1, '%') or highEdu like concat('%', ?1, '%') or studExp like concat('%', ?1, '%')"
			+ "or tutorExp like concat('%', ?1, '%') or status like concat('%', ?1, '%') or teacLoc like concat('%', ?1, '%')"
			+ "or teacObject like concat('%', ?1, '%') or classMode like concat('%', ?1, '%') or willTeac like concat('%', ?1, '%')"
			+ "or avaTime like concat('%', ?1, '%') or subjectItemEx like concat('%', ?1, '%') or skills like concat('%', ?1, '%')"
			+ "or conMethod like concat('%', ?1, '%') or conTime like concat('%', ?1, '%') or subjectItem like concat('%', ?1, '%')"
			+ "or lanAbility like concat('%', ?1, '%')")
	public List<TeacBean> findByAllLike(String searchAllLike);
	
//	@Query(value = "from TeacBean where memberId like concat('%', ?1, '%') or highEdu like concat('%', ?1, '%') or studExp like concat('%', ?1, '%')"
//			+ "or tutorExp like concat('%', ?1, '%') or status like concat('%', ?1, '%') or ?1 in elements(teacLoc)"
//			+ "or ?1 in elements(teacObject) or ?1 in elements(classMode) or willTeac like concat('%', ?1, '%')"
//			+ "or ?1 in elements(teacTime) or subjectItemEx like concat('%', ?1, '%') or ?1 in elements(skills)"
//			+ "or ?1 in elements(conMethod) or ?1 in elements(conTime) or ?1 in elements(subjectItem)"
//			+ "or ?1 in elements(lanAbility)")
//			public List<TeacBean> findByAllLike(String searchAllLike);

//  透過時薪區間建立教師貼文查詢
	public List<TeacBean> findByPriceBetween(Double low, Double high);

//	搜尋全部教師貼文依時薪降序排序
	public List<TeacBean> findAllByOrderByPriceDesc();

//	搜尋全部教師貼文依日期降序排序
	public List<TeacBean> findAllByOrderByUpdateDateDesc();

//	搜尋全部教師貼文依會員編號排序
	public List<TeacBean> findAllByOrderByMemberId();

//	透過貼文編號建立教師貼文查詢
	public TeacBean findByTeacno(Integer teacno);

//	搜尋全部教師貼文
	public List<TeacBean> findAll();

//	透過ID刪除教師貼文
	public void deleteByTeacno(Integer teacno);
}
