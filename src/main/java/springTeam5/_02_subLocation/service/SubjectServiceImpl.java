package springTeam5._02_subLocation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import springTeam5._02_subLocation.model.SubjectBean;
import springTeam5._02_subLocation.model.SubjectRepository;

@Service
@Transactional
public class SubjectServiceImpl implements SubjectService{
	
	@Autowired
	private SubjectRepository sRepo;

//	搜尋全部	
	@Override
	public List<SubjectBean> searchAllSub(){
		List<SubjectBean> sl = sRepo.findAll();
		return sl;
	}
//	透過編號建立查詢
	@Override
	public SubjectBean findById(Integer subjectId){
		SubjectBean sl = sRepo.findBySubjectId(subjectId);
		return sl;
	}
//	模糊查詢全部
	@Override
	public List<SubjectBean> findByClass(String subjectClass){
		List<SubjectBean> sl = sRepo.findByAllLike(subjectClass);
		return sl; 
	}
//	新增
	@Override
	public SubjectBean add(SubjectBean subjectBean) {
		return sRepo.save(subjectBean);
	}
//	透過ID刪除
	@Override
	public void deleteSubFromSubno(Integer subjectId) {
		sRepo.deleteBySubjectId(subjectId);

	}
//	透過ID修改	
	@Override
	public void updateSubFromSubno(SubjectBean subjectBean) {
		sRepo.save(subjectBean);

	}

}
