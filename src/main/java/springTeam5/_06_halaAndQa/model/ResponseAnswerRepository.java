package springTeam5._06_halaAndQa.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ResponseAnswerRepository extends JpaRepository<ResponseAnswerBean, Integer> {

	// 查詢全部回覆留言
	@Query(value = "select * form ResponseAnswer", nativeQuery = true)
	public List<ResponseAnswerBean> findAllResponseAnswer();

	// id查詢
	public ResponseAnswerBean findByResponseAnswerId(Integer ResponseAnswerId);

	// 刪除
	public void deleteByResponseAnswerId(Integer ResponseAnswerId);
	
}
