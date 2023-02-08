package springTeam5._06_halaAndQa.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ResponseHalaService {

	@Autowired
	private ResponseHalaRepository rhRepo;

	// 新增
	public ResponseHalaBean insertResponseHala(ResponseHalaBean rhb) {
		return rhRepo.save(rhb);
	}

	// 修改
	public ResponseHalaBean updateResponseHala(ResponseHalaBean rhb) {
		return rhRepo.save(rhb);
	}

	// 刪除
	public void deleteResponseHala(Integer responseHalaId) {
		rhRepo.deleteByResponseHalaId(responseHalaId);
	}

	// 查詢全部
	public List<ResponseHalaBean> findResponseHalaAll() {
		return rhRepo.findAllResponseHala();
	}

	// id查詢
	public ResponseHalaBean selectResponseHalaId(Integer responseHalaId) {
		return rhRepo.findByResponseHalaId(responseHalaId);
	}

	// 更新讚數
	public void updatetumb(ResponseHalaBean responseHalaBean) {
		rhRepo.save(responseHalaBean);
	}

}
