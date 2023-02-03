package springTeam5._02_subLocation.service;

import java.util.List;

import springTeam5._02_subLocation.model.SubjectBean;


public interface SubjectService {
	public List<SubjectBean> searchAllSub();

	public SubjectBean findById(Integer subjectId);

	public List<SubjectBean> findByClass(String subjectClass);

	public SubjectBean add(SubjectBean subjectBean);

	public void deleteSubFromSubno(Integer subjectId);

	public void updateSubFromSubno(SubjectBean subjectBean);

}
