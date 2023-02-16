package springTeam5._02_subLocation.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface CourseOrderRepository extends JpaRepository<CourseOrderBean, Integer> {
	
//	courseOrder 全部搜尋
	public List<CourseOrderBean> findAll();
	
//	透過ID刪除整筆商品資料
	public void deleteById(Integer courseOId);
//	流水單號小工具用
	@Query(value = "select * from COURSE_ORDER where orderUID like concat('%',?1,'%') order by course_oId", nativeQuery = true)
	public List<CourseOrderBean> findOrderByUID(String orderUID);
//	找尋單一訂單	
	@Query(value = "select * from COURSE_ORDER where course_oId=?", nativeQuery = true)
	public CourseOrderBean findByID(Integer courseOrderId);

}
