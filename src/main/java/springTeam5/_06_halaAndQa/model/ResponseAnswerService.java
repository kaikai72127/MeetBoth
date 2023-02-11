package springTeam5._06_halaAndQa.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ResponseAnswerService {

	@Autowired
	private ResponseAnswerRepository raRepo;
	
	// 新增
	public ResponseAnswerBean insertResponseAnswer(ResponseAnswerBean rab) {
		return raRepo.save(rab);
	}

	// 修改
	public ResponseAnswerBean updateResponseAnswer(ResponseAnswerBean rab) {
		return raRepo.save(rab);
	}

	// 刪除
	public void deleteResponseAnswer(Integer responseAnswerId) {
		raRepo.deleteByResponseAnswerId(responseAnswerId);
	}

	// 查詢全部
	public List<ResponseAnswerBean> findResponseAnswerAll() {
		return raRepo.findAllResponseAnswer();
	}

	// id查詢
	public ResponseAnswerBean selectResponseAnswerId(Integer responseAnswerId) {
		return raRepo.findByResponseAnswerId(responseAnswerId);
	}

	// 更新讚數
	public void updatetumb(ResponseAnswerBean responseAnswerBean) {
		raRepo.save(responseAnswerBean);
	}

}
