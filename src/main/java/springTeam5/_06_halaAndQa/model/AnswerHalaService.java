package springTeam5._06_halaAndQa.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AnswerHalaService {

	@Autowired
	private AnswerHalaRepository asRepo;

	// 新增
	public AnswerHalaBean insertAnswerHala(AnswerHalaBean ahb) {
		return asRepo.save(ahb);
	}

	// 修改
	public AnswerHalaBean updateAnswerHala(AnswerHalaBean ahb) {
		return asRepo.save(ahb);
	}

	// 刪除
	public void deleteAnswerHala(Integer answerId) {
		asRepo.deleteByAnswerId(answerId);
	}

	// 查詢全部
	public List<AnswerHalaBean> findAnswerHalaAll() {
		return asRepo.findAllAnswerHala();
	}

	// id查詢
	public AnswerHalaBean selectAnswerId(Integer answerId) {
		return asRepo.findByAnswerId(answerId);
	}

	// 更新讚數
	public void updatetumb(AnswerHalaBean answerHalaBean) {
		asRepo.save(answerHalaBean);
	}
	
	//找貼文下的回答
	public List <AnswerHalaBean> findAnswerByHalaId(Integer halaId){
		return asRepo.findAnswerByHalaId(halaId);
	}

}
