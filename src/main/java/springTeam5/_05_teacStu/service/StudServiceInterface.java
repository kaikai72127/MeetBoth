package springTeam5._05_teacStu.service;

import java.util.List;

import springTeam5._05_teacStu.model.StudBean;

public interface StudServiceInterface {
	
//	模糊查詢學生全部
	public List<StudBean> searchAllLikeStud(String searchAllLike);
	
//  透過時薪區間建立學生貼文查詢
	public List<StudBean> searchStudByPrice(Double low, Double high);
	
//	搜尋全部學生貼文依時薪降序排序
	public List<StudBean> searchAllStudOBprice();
	
//	搜尋全部學生貼文依日期降序排序
	public List<StudBean> searchAllStudOBpDate();
	
//	搜尋全部學生貼文依瀏覽次數排序
	public List<StudBean> findAllByOrderByViews();
	
//	透過貼文編號建立學生貼文查詢
	public StudBean searchStudFromStudno(Integer studno);
	
//	搜尋全部學生貼文
	public List<StudBean> searchAllStud();
	
//	新增學生貼文
	public void addStud(StudBean sb);
	
//	透過ID刪除學生貼文
	public void deleteStudfromStudno(Integer studno);
	
//	透過ID修改學生貼文
	public StudBean updateStudFromStudno(StudBean sb);
	
//	搜尋最新更新的前6筆貼文
	public List<StudBean> findFirst6ByOrderByUpdateDateDesc();
}
