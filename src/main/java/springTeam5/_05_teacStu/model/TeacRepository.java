package springTeam5._05_teacStu.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TeacRepository extends JpaRepository<TeacBean, Integer>{

//	模糊查詢教師全部
	@Query(value = "from TeacBean where memberid like concat('%', ?1, '%') or title like concat('%', ?1, '%') or detail like concat('%', ?1, '%')"
			+ "or price like concat('%', ?1, '%') or subjectitem like concat('%', ?1, '%')")
	public List<TeacBean> findByAllLike(String searchAllLike);

//  透過時薪區間建立教師貼文查詢
	public List<TeacBean> findByPriceBetween(Double low, Double high);

//	搜尋全部教師貼文依時薪降序排序
	public List<TeacBean> findAllByOrderByPriceDesc();

//	搜尋全部教師貼文依日期降序排序
	public List<TeacBean> findAllByOrderByPostdateDesc();

//	搜尋全部教師貼文依會員編號排序
	public List<TeacBean> findAllByOrderByMemberid();

//	透過貼文編號建立教師貼文查詢
	public TeacBean findByTeacno(Integer teacno);

//	搜尋全部教師貼文
	public List<TeacBean> findAll();

//	透過ID刪除教師貼文
	public void deleteByTeacno(Integer teacno);
}
