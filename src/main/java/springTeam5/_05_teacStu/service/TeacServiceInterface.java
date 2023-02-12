package springTeam5._05_teacStu.service;

import java.util.List;

import springTeam5._05_teacStu.model.TeacBean;

public interface TeacServiceInterface {
//	模糊查詢教師全部
	public List<TeacBean> searchAllLike(String searchAllLike);
	
//  透過時薪區間建立教師貼文查詢
	public List<TeacBean> searchTeacByPrice(Double low, Double high);
	
//	搜尋全部教師貼文依時薪降序排序
	public List<TeacBean> searchAllTeacOBprice();
	
//	搜尋全部教師貼文依日期降序排序
	public List<TeacBean> searchAllTeacOBpDate();
	
<<<<<<< HEAD
//	搜尋全部教師貼文依瀏覽次數排序
=======
//	搜尋全部教師貼文依會員編號排序
>>>>>>> origin/_01_Seal
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
