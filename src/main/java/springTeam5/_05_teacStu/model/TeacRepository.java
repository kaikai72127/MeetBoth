package springTeam5._05_teacStu.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TeacRepository extends JpaRepository<TeacBean, Integer>{

//	模糊查詢教師全部
	@Query(value = "select t from TeacBean t join t.member m where t.highEdu like concat('%', ?1, '%') or t.studExp like concat('%', ?1, '%')"
			+ "or t.tutorExp like concat('%', ?1, '%') or t.teacLoc like concat('%', ?1, '%')"
			+ "or t.teacObject like concat('%', ?1, '%') or t.classMode like concat('%', ?1, '%') or t.willTeac like concat('%', ?1, '%')"
			+ "or t.teacTime like concat('%', ?1, '%') or t.skills like concat('%', ?1, '%')"
			+ "or t.conMethod like concat('%', ?1, '%') or t.conTime like concat('%', ?1, '%') or t.subjectItem like concat('%', ?1, '%')"
			+ "or t.lanAbility like concat('%', ?1, '%') or t.views like concat('%', ?1, '%') or m.memName like concat('%', ?1, '%')"
			+ "or m.memNickName like concat('%', ?1, '%')")
	public List<TeacBean> findByAllLike(String searchAllLike);
	
//  透過時薪區間建立教師貼文查詢
	public List<TeacBean> findByPriceBetween(Double low, Double high);

//	搜尋全部教師貼文依時薪降序排序
	public List<TeacBean> findAllByOrderByPriceDesc();

//	搜尋全部教師貼文依日期降序排序
	public List<TeacBean> findAllByOrderByUpdateDateDesc();

//	搜尋全部教師貼文依瀏覽次數排序
	public List<TeacBean> findAllByOrderByViews();

//	透過貼文編號建立教師貼文查詢
	public TeacBean findByTeacno(Integer teacno);

//	搜尋全部教師貼文
	public List<TeacBean> findAll();

//	透過ID刪除教師貼文
	public void deleteByTeacno(Integer teacno);
	
//	搜尋最新更新的前6筆貼文
	public List<TeacBean> findFirst6ByOrderByUpdateDateDesc();
}
