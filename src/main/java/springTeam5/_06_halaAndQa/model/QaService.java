package springTeam5._06_halaAndQa.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@Service
@Transactional
public class QaService {
	
	@Autowired
	private QaRepository qaRepo;
	
	//新增
		public QaBean insertQa(QaBean qb) {
			return qaRepo.save(qb);
		}
		
		//修改
		public QaBean updateQA(QaBean qaBean) {
			return qaRepo.save(qaBean);
		}
		
		//刪除
		public void deleteQa(Integer qaId) {
			qaRepo.deleteByQaid(qaId);
		}

		//查詢全部
		public List<QaBean> findQaAll(){
			return qaRepo.findAllQa();
		}
		
		//查詢分類
		public List<QaBean> selectQaClass(String qaclassname) {
			return qaRepo.findByQaclassname(qaclassname);
		}
		
		//編號查詢
		public QaBean selectQaId(Integer qaId) {
			return qaRepo.findByQaid(qaId);
		}
		


	}
