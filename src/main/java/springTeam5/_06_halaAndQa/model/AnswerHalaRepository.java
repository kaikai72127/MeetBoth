package springTeam5._06_halaAndQa.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface AnswerHalaRepository extends JpaRepository<AnswerHalaBean, Integer> {

	// 查詢全部貼文回覆
	@Query(value = "select * from AnswerHala", nativeQuery = true)
	public List<AnswerHalaBean> findAllAnswerHala();
	
	@Query(value = "select * from AnswerHala where halaId ?1 ", nativeQuery = true)
	public List<AnswerHalaBean> findAnswerByHalaId(Integer halaId);

	// id查詢
	public AnswerHalaBean findByAnswerId(Integer AnswerId);

	// 刪除
	public void deleteByAnswerId(Integer AnswerId);
}
