package springTeam5._06_halaAndQa.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface QaRepository extends JpaRepository<QaBean, Integer> {

	// 查詢全部
	@Query(value = "select * from QA", nativeQuery = true)
	public List<QaBean> findAllQa();

	// 分類查詢
	public List<QaBean> findByQaclassname(String qaclassname);

	// ID查詢
	public QaBean findByQaid(Integer qaid);

	// 刪除
	public void deleteByQaid(Integer qaid);

}
