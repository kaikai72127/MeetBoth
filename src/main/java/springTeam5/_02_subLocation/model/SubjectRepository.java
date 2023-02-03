package springTeam5._02_subLocation.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface SubjectRepository extends JpaRepository<SubjectBean, Integer> {

//	模糊查詢全部
	@Query(value = "from SubjectBean where subjectId like concat('%', ?1, '%') or subjectName like concat('%', ?1, '%') or subjectClass like concat('%', ?1, '%')")
	public List<SubjectBean> findByAllLike(String searchAllLike);
		
//	透過編號建立查詢
	public SubjectBean findBySubjectId(Integer subjectId);
	
//	搜尋全部
	public List<SubjectBean> findAll();
	
//	透過ID刪除
	public void deleteBySubjectId(Integer subjectId);
}
