package springTeam5._02_subLocation.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface YtPlayerRepository extends JpaRepository<YtPlayer, Integer> {
	
//	透過 CourseID 搜尋全部的 ytPlayerBean
	@Query(value = "from YtPlayer where courseid like concat('%', ?1, '%')")
	public List<YtPlayer> findByAllLike(Integer ytPlayerID);


//	用來搜尋單一Product
	public YtPlayer findByYtPlayerID(Integer ytPlayerID);
	
//	刪除某個ytPlayer
	public void deleteByYtPlayerID(Integer ytPlayerID);
	
	public List<YtPlayer> findByCourseCourseID(Integer courseID);
}
