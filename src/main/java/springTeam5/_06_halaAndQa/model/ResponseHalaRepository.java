package springTeam5._06_halaAndQa.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ResponseHalaRepository extends JpaRepository<ResponseHalaBean, Integer> {

	// 查詢全部貼文留言
	@Query(value = "select * form ResponseHala", nativeQuery = true)
	public List<ResponseHalaBean> findAllResponseHala();

	// id查詢
	public ResponseHalaBean findByResponseHalaId(Integer ResponseHalaId);

	// 刪除
	public void deleteByResponseHalaId(Integer ResponseHalaId);
}
