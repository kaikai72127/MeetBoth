package springTeam5._02_subLocation.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CourseRepository extends JpaRepository<Course, Integer> {

//	shoppingHome 全部搜尋
	public List<Course> findAll();

//	給ProdPicSave使用 來找尋單一的Product 並顯示圖片
//	或是 單純用來搜尋單一Product
	public Course findByCourseID(int courseID);

//	透過prodID刪除整筆商品資料
	public void deleteByCourseID(Integer courseID);
	

//	條件搜尋
	@Query(value = "select * from Course where IIF(?1=0,?1,courseClass)=?1 and coursePrice >= ?2 and coursePrice <= ?3 and (courseName like concat('%',?4,'%') or memberID like concat('%',?4,'%')) order by courseID", nativeQuery = true)
	public List<Course> findAllByOrderByCourseID(Integer type, Integer low, Integer high, String name);

	@Query(value = "select * from Course where IIF(?1=0,?1,courseClass)=?1 and coursePrice >= ?2 and coursePrice <= ?3 and (courseName like concat('%',?4,'%') or memberID like concat('%',?4,'%')) order by coursePrice DESC", nativeQuery = true)
	public List<Course> findAllByOrderByCoursePriceDesc(Integer type, Integer low, Integer high, String name);

	@Query(value = "select * from Course where IIF(?1=0,?1,courseClass)=?1 and coursePrice >= ?2 and coursePrice <= ?3 and (courseName like concat('%',?4,'%') or memberID like concat('%',?4,'%')) order by coursePrice", nativeQuery = true)
	public List<Course> findAllByOrderByCoursePrice(Integer type, Integer low, Integer high, String name);

	@Query(value = "select * from Course where IIF(?1=0,?1,courseClass)=?1 and coursePrice >= ?2 and coursePrice <= ?3 and (courseName like concat('%',?4,'%') or memberID like concat('%',?4,'%')) order by coursePost DESC", nativeQuery = true)
	public List<Course> findAllByOrderByCoursePostDesc(Integer type, Integer low, Integer high, String name);

	@Query(value = "select * from Course where IIF(?1=0,?1,courseClass)=?1 and coursePrice >= ?2 and coursePrice <= ?3 and (courseName like concat('%',?4,'%') or memberID like concat('%',?4,'%')) order by courseUpdate DESC", nativeQuery = true)
	public List<Course> findAllByOrderByCourseUpdateDesc(Integer type, Integer low, Integer high, String name);

	@Query(value = "SELECT  top 4 p.*\r\n" + "FROM COURSE p\r\n" + "where p.courseClass = ?1 and p.courseID != ?2\r\n"
			+ "ORDER BY (SELECT COUNT(*) FROM courseComment c WHERE c.courseID = p.courseID) DESC;", nativeQuery = true)
	public List<Course> findTop4CourseLikeByCourseLike(Integer courseClass, Integer courseID);
	
	@Query(value = "SELECT TOP 3 * FROM COURSE ORDER BY NEWID()", nativeQuery = true)
	List<Course> findRandomCourses();
}