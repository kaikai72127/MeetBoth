package springTeam5._05_teacStu.service;

import java.util.List;

import springTeam5._05_teacStu.model.TeacBean;

public interface TeacServiceInterface {
//	模糊查詢教師全部
	public List<TeacBean> searchAllLike(String searchAllLike);
	
//	用陣列模糊搜尋教學地區欄位
	public List<TeacBean> findByTeacLocIn(List<String> teacLoc);
	
//	模糊搜尋教學對象欄位
	public List<TeacBean> findByTeacObjectContaining(String keyword);
	
//	用陣列模糊搜尋教學時段欄位
	public List<TeacBean> findByTeacTimeIn(List<String> teacTime);
	
//	用陣列模糊搜尋科目欄位
	public List<TeacBean> findBySubjectItemIn(List<String> subjectItem);
	
//	用陣列模糊搜尋語言能力欄位
	public List<TeacBean> findByLanAbilityIn(List<String> lanAbility);
	
//  透過時薪區間建立教師貼文查詢
	public List<TeacBean> searchTeacByPrice(Double low, Double high);
	
//	搜尋全部教師貼文依時薪降序排序
	public List<TeacBean> searchAllTeacOBprice();
	
//	搜尋全部教師貼文依日期降序排序
	public List<TeacBean> searchAllTeacOBpDate();
	
//	搜尋全部教師貼文依瀏覽次數排序
	public List<TeacBean> findAllByOrderByViews();
	
//	透過貼文編號建立教師貼文查詢
	public TeacBean searchTeacFromTeacno(Integer teacno);
	
//	搜尋全部教師貼文
	public List<TeacBean> searchAllTeac();
	
//	新增教師貼文
	public void addTeac(TeacBean tb);
	
//	透過ID刪除教師貼文
	public void deleteTeacfromTeacno(Integer teacno);
	
//	透過ID修改教師貼文
	public TeacBean updateTeacFromTeacno(TeacBean tb);
	
//	搜尋最新更新的前6筆貼文
	public List<TeacBean> findFirst6ByOrderByUpdateDateDesc();
}
